#include<pic.h>

__CONFIG(0xFF29);

char x,y;

//��������
void delay1()//�����ʱ�ӳ���

{char i1, i2;

for(i1=3;i1>0;i1--){for(i2=0x19;i2>0;i2--);};}

void delay2()//�����ʱ�ӳ���

{char i1, i2;

for(i1=15;i1>0;i1--){for(i2=0x19;i2>0;i2--);};}

void delay3()//�����ʱ�ӳ���

{char i1, i2;

for(i1=7;i1>0;i1--){for(i2=0x19;i2>0;i2--);};}

void delay4()//�����ʱ�ӳ���

{char i1, i2;

for(i1=11;i1>0;i1--){for(i2=0x19;i2>0;i2--);};}

void sound_delay()//�����ӳ���

{unsigned int i;

for(i=300;i>0;i--){RE0=!RE0;delay1();};

for(i=300;i>0;i--){RE0=!RE0;delay3();};

for(i=100;i>0;i--){RE0=!RE0;delay2();};

for(i=100;i>0;i--){RE0=!RE0;delay4();};

}


void interrupt int_rb()

{

if(INTF==1){x=0;PORTD=0X80;sound_delay();INTF=0;}//�����ж��ⲿ�жϱ�־λ

else//�������INTF=1��һ����RBIF=1����˴˴������ж�

{

if(x==0)//�������ɹ����ж����ĸ�����

{x=1;y=y^PORTB;

if(y==0x80){PORTD=0X08;};

if(y==0x40){PORTD=0X04;};

if(y==0x20){PORTD=0X02;};

if(y==0x10){PORTD=0X01;};

sound_delay();delay2();sound_delay();delay2();sound_delay();

};

y=PORTB;RBIF=0;//���x=1���Ѿ��������ֱ�ӳ��ж�

}

}

main()

{

TRISD=0;PORTD=0;TRISB=0XFF; RBPU=0;INTEDG=1;

TRISE0=0;RE0=0;ADCON1=0x07;

x=1;

GIE=1;INTE=1;RBIE=1;INTF=0;



y=PORTB;RBIF=0;//��RB�˿ڵ�ƽ��ֻҪ�����붯�������Ƕ��˿�



while(1);

}