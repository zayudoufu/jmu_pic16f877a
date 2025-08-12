#include <pic.h>

// ����λ���ã�����ʵ��PIC�ͺŵ���
__CONFIG(0xFF29);

// ����LCD�����ߺ궨��ΪPORTD����
#define LCD_RS PORTDbits.RD0
#define LCD_RW PORTDbits.RD1
#define LCD_E  PORTDbits.RD2
// ��������ʹ��RD4-RD7
#define LCD_D4 PORTDbits.RD4
#define LCD_D5 PORTDbits.RD5
#define LCD_D6 PORTDbits.RD6
#define LCD_D7 PORTDbits.RD7

// ���̺궨��
#define ROW1 PORTBbits.RB4
#define ROW2 PORTBbits.RB5
#define ROW3 PORTBbits.RB6
#define ROW4 PORTBbits.RB7
#define COL1 PORTBbits.RB0
#define COL2 PORTBbits.RB1
#define COL3 PORTBbits.RB2
#define COL4 PORTBbits.RB3

#define BUZZER PORTDbits.RD3 // ��������������������ΪRD3

float current_frequency = 0;
unsigned char preres = 0xFF; // ��ʼ��Ϊ�ް���
unsigned char TABLE[16] = {'1', '2', '3', 'A', '4', '5', '6', 'B', '7', '8', '9', 'C', '*', '0', '#', 'D'};

// ������������PWM����
volatile unsigned long timer_count = 0;
volatile unsigned long target_count = 0;

// ��������
void delay_ms(unsigned int ms);
void lcd_init();
void lcd_command(unsigned char cmd);
void lcd_data(unsigned char data);
void lcd_puts(const char *str);
void lcd_clear();
void lcd_putnumf(float num, unsigned char decimal_places);
unsigned char keyboard_scan();
void set_pwm_frequency(float freq);

// ����lcd_putc����
void lcd_putc(char c) {
    lcd_data(c);
}

void main() {
    // ��ʼ��
    TRISD = 0x00; // LCD���ݺͿ��������
    TRISE = 0x00; // RE0���������ԭ����
    TRISB = 0x0F; // RB0-3���룬RB4-7���

    // ����RD3Ϊ�������
    TRISD = TRISD & 0xF7; // ȷ��RD3������Ϊ���

    lcd_init();

    // ��ʼ��Timer0
    OPTION_REG = 0x07; // Ԥ��Ƶ256
    TMR0IE = 1;        // ʹ��Timer0�ж�
    GIE = 1;           // ȫ���ж�ʹ��
    PEIE = 1;          // �����ж�ʹ��

    // ��ʼƵ������Ϊ1000Hz
    current_frequency = 1000;
    set_pwm_frequency(current_frequency);

    // ����LCD��ʾ
    lcd_clear();
    lcd_puts("Key: ");
    lcd_puts("Initial");
    lcd_puts(" Freq: ");
    lcd_putnumf(current_frequency, 1);
    lcd_puts("Hz");

    while (1) {
        unsigned char key_index = keyboard_scan();

        if (key_index != 0xFF) {
            char key_char = TABLE[key_index];
            float frequency_map[] = {0.1, 1, 10, 40, 100, 1000};

            if (key_char >= '1' && key_char <= '6') {
                int map_index = key_char - '1';
                current_frequency = frequency_map[map_index];

                // ����LCD��ʾ
                lcd_clear();
                lcd_puts("Key: ");
                lcd_putc(key_char);
                lcd_puts(" Freq: ");
                lcd_putnumf(current_frequency, 1);
                lcd_puts("Hz");

                // ���ö�ʱ��Ƶ��
                set_pwm_frequency(current_frequency);
            }
        }
    }
}

// �жϷ������
void interrupt isr(void) {
    if (TMR0IF) {
        TMR0IF = 0; // ����жϱ�־
        TMR0 = 0;    // ���ö�ʱ��

        timer_count++;
        if (timer_count >= target_count) {
            BUZZER = !BUZZER;
            timer_count = 0;
        }
    }
}

// ����PWMƵ��
void set_pwm_frequency(float freq) {
    if (freq == 0) {
        target_count = 0;
        BUZZER = 0;
        return;
    }

    // ����������жϴ�����ÿ�����������жϣ�
    float period = 1.0 / freq; // ������
    float half_period = period / 2.0; // ������

    // Timer0���ã�4MHzʱ�ӣ�Ԥ��Ƶ256��ÿ��tick=256us
    // ÿ���жϵ�ʱ��=256us * 256 = 65.536ms
    // ������Ҫ���жϴ����Դﵽ������
    float interrupt_interval = 0.000065536; // 65.536ms per interrupt
    target_count = (unsigned long)(half_period / interrupt_interval);
}

// ��ʱ����
void delay_ms(unsigned int ms) {
    unsigned int i, j;
    for (i = 0; i < ms; i++) {
        for (j = 0; j < 1200; j++);
    }
}

// LCD��ʼ��
void lcd_init() {
    delay_ms(50); // �ȴ�LCD��ʼ��
    lcd_command(0x02); // 4λģʽ
    lcd_command(0x28); // 2�У�5x7����
    lcd_command(0x0C); // ��ʾ��������
    lcd_command(0x06); // �Զ�����
    lcd_command(0x01); // ����
    delay_ms(2);
}

// LCD��������
void lcd_command(unsigned char cmd) {
    LCD_RS = 0; // ����ģʽ
    LCD_RW = 0; // дģʽ
    LCD_E = 1;  // ʹ��
    LCD_D4 = (cmd & 0x10) ? 1 : 0;
    LCD_D5 = (cmd & 0x20) ? 1 : 0;
    LCD_D6 = (cmd & 0x40) ? 1 : 0;
    LCD_D7 = (cmd & 0x80) ? 1 : 0;
    delay_ms(1);
    LCD_E = 0;
    delay_ms(1);

    LCD_E = 1;
    LCD_D4 = (cmd & 0x01) ? 1 : 0;
    LCD_D5 = (cmd & 0x02) ? 1 : 0;
    LCD_D6 = (cmd & 0x04) ? 1 : 0;
    LCD_D7 = (cmd & 0x08) ? 1 : 0;
    delay_ms(1);
    LCD_E = 0;
    delay_ms(2);
}

// LCD��������
void lcd_data(unsigned char data) {
    LCD_RS = 1; // ����ģʽ
    LCD_RW = 0; // дģʽ
    LCD_E = 1;  // ʹ��
    LCD_D4 = (data & 0x10) ? 1 : 0;
    LCD_D5 = (data & 0x20) ? 1 : 0;
    LCD_D6 = (data & 0x40) ? 1 : 0;
    LCD_D7 = (data & 0x80) ? 1 : 0;
    delay_ms(1);
    LCD_E = 0;
    delay_ms(1);

    LCD_E = 1;
    LCD_D4 = (data & 0x01) ? 1 : 0;
    LCD_D5 = (data & 0x02) ? 1 : 0;
    LCD_D6 = (data & 0x04) ? 1 : 0;
    LCD_D7 = (data & 0x08) ? 1 : 0;
    delay_ms(1);
    LCD_E = 0;
    delay_ms(2);
}

// LCD��ʾ�ַ���
void lcd_puts(const char *str) {
    while (*str) {
        lcd_data(*str++);
    }
}

// LCD����
void lcd_clear() {
    lcd_command(0x01);
    delay_ms(2);
}

// LCD��ʾ������
void lcd_putnumf(float num, unsigned char decimal_places) {
    char buffer[16];
    unsigned char i = 0;

    // ������������
    unsigned long int_part = (unsigned long)num;
    if (int_part == 0) {
        buffer[i++] = '0';
    } else {
        while (int_part > 0) {
            buffer[i++] = (int_part % 10) + '0';
            int_part /= 10;
        }
    }

    // ��ת��������
    unsigned char start = 0, end = i - 1;
    while (start < end) {
        char temp = buffer[start];
        buffer[start] = buffer[end];
        buffer[end] = temp;
        start++;
        end--;
    }

    // ����С����
    if (decimal_places > 0) {
        buffer[i++] = '.';
        float frac_part = num - (float)(unsigned long)num;
        unsigned long multiplier = 1;
        for (unsigned char j = 0; j < decimal_places; j++) {
            multiplier *= 10;
        }
        unsigned long frac = (unsigned long)(frac_part * multiplier + 0.5);
        while (decimal_places > 0) {
            buffer[i++] = (frac % 10) + '0';
            frac /= 10;
            decimal_places--;
        }
    }

    // ��ʾ
    buffer[i] = '\0';
    lcd_puts(buffer);
}

// ����ɨ��
unsigned char keyboard_scan() {
    unsigned char row, col, result = 0xFF;
    unsigned char row_pins[] = {0xEF, 0xDF, 0xBF, 0x7F}; // ��Ӧ��0-3

    for (row = 0; row < 4; row++) {
        PORTB = row_pins[row];
        asm("nop");
        unsigned char col_val = PORTB & 0x0F;

        if (col_val != 0x0F) {
            // ȥ����
            delay_ms(10);
            col_val = PORTB & 0x0F;
            if (col_val != 0x0F) {
                // ȷ��������
                switch (col_val) {
                    case 0x0E: col = 0; break;
                    case 0x0D: col = 1; break;
                    case 0x0B: col = 2; break;
                    case 0x07: col = 3; break;
                    default: col = 0xFF;
                }
                if (col != 0xFF) {
                    result = row * 4 + col;
                    break;
                }
            }
        }
    }
    return result;
}