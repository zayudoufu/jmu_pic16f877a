#include<pic.h>
char x,Y,addr;
static volatile char table[21]={"my name is pic16f877 "};
void	delay(Y)//��������Ƶ�ʣ�4mhz
{unsigned int i;for(i=Y;i>0;i--);}
void	delay1(Y)//��������Ƶ�ʣ�4mhz
{unsigned int i;for(i=Y;i>0;i--);}
void interrupt usart_seve()
{
 TXREG=RCREG;//��USART�������ݲ���USARTת�ͳ�ȥ
EEPROM_WRITE(addr,RCREG);delay1(1000);
addr++;
}
main()
{addr=0;
TRISC=0xff;//�Ͽ�RCģ����USART��TX,RX����ϵ
SPBRG=12;//ת�ز����ʷ�������Ϊ19.2kbd
TXSTA=0B00100100;//ʹ��USART���ͣ������ʷ�����Ϊ���ٷ�ʽ
RCSTA=0B10010000;//��������
GIE=1;PEIE=1;RCIE=1;//����USART�����ж�
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
