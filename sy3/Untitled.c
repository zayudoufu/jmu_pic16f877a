#include<pic.h>

__CONFIG(0xFF29);

char x,y;

//发声部分
void delay1()//软件延时子程序

{char i1, i2;

for(i1=3;i1>0;i1--){for(i2=0x19;i2>0;i2--);};}

void delay2()//软件延时子程序

{char i1, i2;

for(i1=15;i1>0;i1--){for(i2=0x19;i2>0;i2--);};}

void delay3()//软件延时子程序

{char i1, i2;

for(i1=7;i1>0;i1--){for(i2=0x19;i2>0;i2--);};}

void delay4()//软件延时子程序

{char i1, i2;

for(i1=11;i1>0;i1--){for(i2=0x19;i2>0;i2--);};}

void sound_delay()//发声子程序

{unsigned int i;

for(i=300;i>0;i--){RE0=!RE0;delay1();};

for(i=300;i>0;i--){RE0=!RE0;delay3();};

for(i=100;i>0;i--){RE0=!RE0;delay2();};

for(i=100;i>0;i--){RE0=!RE0;delay4();};

}


void interrupt int_rb()

{

if(INTF==1){x=0;PORTD=0X80;sound_delay();INTF=0;}//优先判断外部中断标志位

else//如果不是INTF=1，一定是RBIF=1，因此此处不用判断

{

if(x==0)//如果抢答成功，判断是哪个队伍

{x=1;y=y^PORTB;

if(y==0x80){PORTD=0X08;};

if(y==0x40){PORTD=0X04;};

if(y==0x20){PORTD=0X02;};

if(y==0x10){PORTD=0X01;};

sound_delay();delay2();sound_delay();delay2();sound_delay();

};

y=PORTB;RBIF=0;//如果x=1，已经抢答过，直接出中断

}

}

main()

{

TRISD=0;PORTD=0;TRISB=0XFF; RBPU=0;INTEDG=1;

TRISE0=0;RE0=0;ADCON1=0x07;

x=1;

GIE=1;INTE=1;RBIE=1;INTF=0;



y=PORTB;RBIF=0;//读RB端口电平，只要有输入动作，既是读端口



while(1);

}