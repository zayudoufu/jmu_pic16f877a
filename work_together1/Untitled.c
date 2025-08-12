#include <pic.h>

// 配置位设置，根据实际PIC型号调整
__CONFIG(0xFF29);

// 修正LCD控制线宏定义为PORTD引脚
#define LCD_RS PORTDbits.RD0
#define LCD_RW PORTDbits.RD1
#define LCD_E  PORTDbits.RD2
// 数据线仍使用RD4-RD7
#define LCD_D4 PORTDbits.RD4
#define LCD_D5 PORTDbits.RD5
#define LCD_D6 PORTDbits.RD6
#define LCD_D7 PORTDbits.RD7

// 键盘宏定义
#define ROW1 PORTBbits.RB4
#define ROW2 PORTBbits.RB5
#define ROW3 PORTBbits.RB6
#define ROW4 PORTBbits.RB7
#define COL1 PORTBbits.RB0
#define COL2 PORTBbits.RB1
#define COL3 PORTBbits.RB2
#define COL4 PORTBbits.RB3

#define BUZZER PORTDbits.RD3 // 将蜂鸣器控制引脚设置为RD3

float current_frequency = 0;
unsigned char preres = 0xFF; // 初始化为无按键
unsigned char TABLE[16] = {'1', '2', '3', 'A', '4', '5', '6', 'B', '7', '8', '9', 'C', '*', '0', '#', 'D'};

// 新增变量用于PWM生成
volatile unsigned long timer_count = 0;
volatile unsigned long target_count = 0;

// 函数声明
void delay_ms(unsigned int ms);
void lcd_init();
void lcd_command(unsigned char cmd);
void lcd_data(unsigned char data);
void lcd_puts(const char *str);
void lcd_clear();
void lcd_putnumf(float num, unsigned char decimal_places);
unsigned char keyboard_scan();
void set_pwm_frequency(float freq);

// 定义lcd_putc函数
void lcd_putc(char c) {
    lcd_data(c);
}

void main() {
    // 初始化
    TRISD = 0x00; // LCD数据和控制线输出
    TRISE = 0x00; // RE0输出（保持原样）
    TRISB = 0x0F; // RB0-3输入，RB4-7输出

    // 设置RD3为输出引脚
    TRISD = TRISD & 0xF7; // 确保RD3被设置为输出

    lcd_init();

    // 初始化Timer0
    OPTION_REG = 0x07; // 预分频256
    TMR0IE = 1;        // 使能Timer0中断
    GIE = 1;           // 全局中断使能
    PEIE = 1;          // 外设中断使能

    // 初始频率设置为1000Hz
    current_frequency = 1000;
    set_pwm_frequency(current_frequency);

    // 更新LCD显示
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

                // 更新LCD显示
                lcd_clear();
                lcd_puts("Key: ");
                lcd_putc(key_char);
                lcd_puts(" Freq: ");
                lcd_putnumf(current_frequency, 1);
                lcd_puts("Hz");

                // 设置定时器频率
                set_pwm_frequency(current_frequency);
            }
        }
    }
}

// 中断服务程序
void interrupt isr(void) {
    if (TMR0IF) {
        TMR0IF = 0; // 清除中断标志
        TMR0 = 0;    // 重置定时器

        timer_count++;
        if (timer_count >= target_count) {
            BUZZER = !BUZZER;
            timer_count = 0;
        }
    }
}

// 设置PWM频率
void set_pwm_frequency(float freq) {
    if (freq == 0) {
        target_count = 0;
        BUZZER = 0;
        return;
    }

    // 计算所需的中断次数（每个周期两次中断）
    float period = 1.0 / freq; // 总周期
    float half_period = period / 2.0; // 半周期

    // Timer0配置：4MHz时钟，预分频256，每个tick=256us
    // 每次中断的时间=256us * 256 = 65.536ms
    // 计算需要的中断次数以达到半周期
    float interrupt_interval = 0.000065536; // 65.536ms per interrupt
    target_count = (unsigned long)(half_period / interrupt_interval);
}

// 延时函数
void delay_ms(unsigned int ms) {
    unsigned int i, j;
    for (i = 0; i < ms; i++) {
        for (j = 0; j < 1200; j++);
    }
}

// LCD初始化
void lcd_init() {
    delay_ms(50); // 等待LCD初始化
    lcd_command(0x02); // 4位模式
    lcd_command(0x28); // 2行，5x7点阵
    lcd_command(0x0C); // 显示开，光标关
    lcd_command(0x06); // 自动增量
    lcd_command(0x01); // 清屏
    delay_ms(2);
}

// LCD发送命令
void lcd_command(unsigned char cmd) {
    LCD_RS = 0; // 命令模式
    LCD_RW = 0; // 写模式
    LCD_E = 1;  // 使能
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

// LCD发送数据
void lcd_data(unsigned char data) {
    LCD_RS = 1; // 数据模式
    LCD_RW = 0; // 写模式
    LCD_E = 1;  // 使能
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

// LCD显示字符串
void lcd_puts(const char *str) {
    while (*str) {
        lcd_data(*str++);
    }
}

// LCD清屏
void lcd_clear() {
    lcd_command(0x01);
    delay_ms(2);
}

// LCD显示浮点数
void lcd_putnumf(float num, unsigned char decimal_places) {
    char buffer[16];
    unsigned char i = 0;

    // 处理整数部分
    unsigned long int_part = (unsigned long)num;
    if (int_part == 0) {
        buffer[i++] = '0';
    } else {
        while (int_part > 0) {
            buffer[i++] = (int_part % 10) + '0';
            int_part /= 10;
        }
    }

    // 反转整数部分
    unsigned char start = 0, end = i - 1;
    while (start < end) {
        char temp = buffer[start];
        buffer[start] = buffer[end];
        buffer[end] = temp;
        start++;
        end--;
    }

    // 处理小数点
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

    // 显示
    buffer[i] = '\0';
    lcd_puts(buffer);
}

// 键盘扫描
unsigned char keyboard_scan() {
    unsigned char row, col, result = 0xFF;
    unsigned char row_pins[] = {0xEF, 0xDF, 0xBF, 0x7F}; // 对应行0-3

    for (row = 0; row < 4; row++) {
        PORTB = row_pins[row];
        asm("nop");
        unsigned char col_val = PORTB & 0x0F;

        if (col_val != 0x0F) {
            // 去抖动
            delay_ms(10);
            col_val = PORTB & 0x0F;
            if (col_val != 0x0F) {
                // 确定列索引
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