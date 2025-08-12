# include <pic.h>
__CONFIG(0xFF29);
__EEPROM_DATA (0xB0,0x27,9,0,0,0,0,0); 
int count_temp,n,t_speed ;
char a,b,c,d,e,f,tmr01,tmr02,speed,d1,e1,f1,m;
static volatile char table [10]={0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,0x39};
union 
{  unsigned long count;
char da_ta [3];} li_cheng ;       //����һ�������壬������

void DELAY ()
{ unsigned int i ; for ( i=999;i >0;i --);}


 void ENABLE ()        //д�����������ӳ���
{RA5=0;RA4=0;RA3=0; DELAY ();RA3=1;}


void ENABLE1()        //д���ֵ��ӳ���
{RA5=1;RA4=0;RA3=0; DELAY ();RA3=1;}


void div ()
{ long x ; int y ; char z ;
a=li_cheng.count/100000;x=li_cheng.count-a*100000;
b=x/10000;y=x-b*10000;
c=y/1000;y=y-c*1000;
d=y/100;z=y-d*100;
e=z/10;f=z-e*10;
}


 void speed_calculate()
{ char z;
speed=18998/t_speed;
d1=speed/100;z=speed-d1*100;
e1=z/10;f1=z-e1*10;
}
void interrupt int_serve()
{
if (T0IF==1){n ++;T0IF =0;}
else 
{
 count_temp ++;       //��̼���
if (count_temp ==740){li_cheng.count ++; count_temp =0;};      //��̼��� 
if (li_cheng.count==0x927C0){INTE =0;RE0=1;};    //��������̼�����60��ǧ��ʱ���ñ�־�ź�RA0=1
 m ++;
 if (m ==0)
{n =0;tmr01=TMR0;T0IE=1;T0IF=0;};
if (m==1)
{tmr02=TMR0;T0IE=0;t_speed = n*256+(tmr02-tmr01);};
INTF =0;
}
}


 main()
{TRISD=0; TRISA=0;           //����˿ڷ���
DELAY();                    //������ʱ�����ϵ� LCD ��λ��һ���� PIC ��
PORTD=1;ENABLE();          //����
PORTD=0x38;ENABLE();       //8λ2��5x7����
PORTD=0x0C;ENABLE();       //��ʾ��������겻������˸����
PORTD=0x06; ENABLE();      //���ֲ���������Զ�����
li_cheng.da_ta[0]=eeprom_read(0x00);
li_cheng.da_ta [1]=eeprom_read(0x01);
li_cheng.da_ta [2]=eeprom_read (0x02);
m=250;n =0;
TRISB0=1;count_temp=0;TRISA0=0;RE0=0;TRISE0=0;
OPTION_REG =0B01000111;T0IF=0; TMR0=0;
GIE =1;INTE =1;INTF =0;
while (1)
{
div ();
 PORTD=0x80; ENABLE();            //���ָ���1�е�λ��
 PORTD=table[a];ENABLE1();        //�͵�1�е�1����ʮ��λ
 PORTD=table[b];ENABLE1();        //�͵�1�е�2������λ
 PORTD=table[c];ENABLE1();        //�͵�1�е�3����ǧλ
 PORTD=table[d];ENABLE1();       //�͵�1�е�4���ְ�λ
 PORTD=table[e];ENABLE1();       //�͵�1�е�5����ʮλ
 PORTD=table[f];ENABLE1();       //�͵�1�е�6���ָ�λ
eeprom_write(0x02,li_cheng.da_ta [2]); 
eeprom_write(0x01,li_cheng.da_ta [1]); 
eeprom_write(0x00,li_cheng.da_ta [0]); 
speed_calculate();
 PORTD=0xc0; ENABLE();            //���ָ���2�е�λ��
 PORTD=table[d1];ENABLE1();      //�͵�2�����ְ�λ
 PORTD=table[e1];ENABLE1();      //�͵�2������ʮλ
 PORTD=table[f1];ENABLE1();       //�͵�2�����ָ�λ
};
}