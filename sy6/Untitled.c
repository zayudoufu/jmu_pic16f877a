#include <pic.h>
__CONFIG(0xFF29);

char adh, adl;
static volatile char table[16] = {0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37,
                                 0x38, 0x39, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46};

void DELAY() {
    unsigned int i;
    for (i = 999; i > 0; i--);
}

void ENABLE() {
    RA5 = 0;
    RA4 = 0;
    RA3 = 0;
    DELAY();
    RA3 = 1;
}

void ENABLE1() {
    RA5 = 1;
    RA4 = 0;
    RA3 = 0;
    DELAY();
    RA3 = 1;
}

void lcd() {
    TRISD = 0;
    TRISA = 0;
    PORTD = 0;
    DELAY();
    PORTD = 1;
    ENABLE();
    PORTD = 0x38;
    ENABLE();
    PORTD = 0x0C;
    ENABLE();
    PORTD = 0x06;
    ENABLE();
}

void interrupt tmr2_serve() {
    TMR2IF = 0;
    GO_nDONE = 1;
    while (!ADIF);
    adh = ADRESH;
    adl = ADRESL;
    ADIF = 0;
}

void main() {
    TRISA = 0x0C;  // ����AN0��AN1Ϊģ������
    lcd();
    GIE = 1;
    PEIE = 1;
    TMR2IE = 1;
    TMR2IF = 0;
    ADIF = 0;
    
    // ����ADC
    ADCON0 = 0b01000001;  // ѡ��AN0Ϊ����ͨ��������ADC
    ADCON1 = 0b10001110;  // ʹ��AN1��Ϊ��׼��ѹ����

    T2CON = 0b01111111;
    PR2 = 255;

    while (1) {
        PORTD = 0x80;
        ENABLE();
        PORTD = table[adh];
        ENABLE1();
        PORTD = table[adl >> 4];
        ENABLE1();
        PORTD = table[adl & 0x0F];
        ENABLE1();
        PORTD = 'H';
        ENABLE1();
    }
}