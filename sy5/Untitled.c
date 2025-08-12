#include<pic.h>
__CONFIG(0xFF29);
char x,y,z,Z;
bit a;
static volatile char table[16]={0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,0x39,0x41,0x42,0x43,0x44,0x45,0x46};
void DELAY()
{unsigned int i;for(i=999;i>0;i--);}
void ENABLE()
{RA5=0;RA4=0;RA3=0;DELAY();RA3=1;}
void ENABLE1()
{RA5=1;RA4=0;RA3=0;DELAY();RA3=1;}
void lcd()
{TRISD=0;TRISA=0;
PORTD=0;
DELAY();
PORTD=1;ENABLE();
PORTD=0x38;ENABLE();
PORTD=0x0c;ENABLE();
PORTD=0x06;ENABLE();
}
int TEMP1=0;
 int TEMP2=0;
void interrupt ccp1()
{
if(CCP1IF==1)
{a=!a;

if(a==1){ TMR1H=0;TMR1L=0;TMR1L=0;TMR1ON=1;z=0; 
	 TEMP1=CCPR1H ;  TEMP2=CCPR1L ;CCP1IF=0;  }
else
{
//	CCPR1L= CCPR1L- TEMP1;  CCPR1H= CCPR1L - TEMP2;
	y=CCPR1L+1;x=CCPR1H+CARRY;Z=z;TMR1ON=0;CCP1IF=0;

};
}
else
if(TMR1IF=1)
z++;
TMR1IF=0;
}
main()
{lcd();
TRISC2=1;
a=0;ADCON1=7;
GIE=1;PEIE=1;CCP1IE=1;CCP1IF=0;
TMR1IE=1;TMR1IF=0;
T1CON=0B00000001;
CCP1CON=5;
while(1)
{
PORTD=0x80;ENABLE();
PORTD=table[Z>>4];ENABLE1();
PORTD=table[Z&0x0f];ENABLE1();
PORTD=table[x>>4];ENABLE1();
PORTD=table[x&0x0f];ENABLE1();
PORTD=table[y>>4];ENABLE1();
PORTD=table[y&0x0f];ENABLE1();
PORTD='H';ENABLE1();
}
}
