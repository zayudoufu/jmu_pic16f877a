#include<pic.h>
char x,Y,addr;
static volatile char table[21]={"my name is pic16f877 "};
void	delay(Y)//晶体振荡器频率＝4mhz
{unsigned int i;for(i=Y;i>0;i--);}
void	delay1(Y)//晶体振荡器频率＝4mhz
{unsigned int i;for(i=Y;i>0;i--);}
void interrupt usart_seve()
{
 TXREG=RCREG;//从USART接受数据并从USART转送出去
EEPROM_WRITE(addr,RCREG);delay1(1000);
addr++;
}
main()
{addr=0;
TRISC=0xff;//断开RC模块与USART的TX,RX的联系
SPBRG=12;//转载波特率发生器，为19.2kbd
TXSTA=0B00100100;//使能USART发送，波特率发生器为高速方式
RCSTA=0B10010000;//连续接收
GIE=1;PEIE=1;RCIE=1;//开放USART接收中断
for(x=0;x<21;x++)
{
TXREG=table[x];
delay(500);
}
for(x=0;x<100;x++)
{
TXREG=EEPROM_READ(x);
delay(500);
}
addr=0;
while(1);
}
