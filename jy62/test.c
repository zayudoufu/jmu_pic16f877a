#include<pic.h>
#include<stdint.h>
__CONFIG(0xFF29);     //оƬ����λ����
char data[20];
char useful[20];
float calaculate[30];
short datax,datay,dataz;
float buff,buf;
int x1,x2,x3,x4,x5;
int a1,a2,a3,a4,K;
int flag=0,n=0;
static volatile char table[16]={0x30,0x31,0x32,0x33,0x34,0x35,
0x36,0x37,0x38,0x39,0x41,0x42,0x43,0x44,0x45,0x46};

void DELAY()
{unsigned int i;for(i=999;i>0;i--);}
void ENABLE()//д�����������ӳ���
{ RA5=0; RA4=0;RA3=0;DELAY();RA3=1;}
void ENABLE1()//д���ֵ��ӳ���
{ RA5=1; RA4=0;RA3=0;DELAY();RA3=1;}

void div()
{
	if(buff<0){flag=1;buff=-buff;}  //buffΪshort������֮�����������ж��Ƿ�Ϊ����
	else flag=0;					//��Ϊ������־λflag��1������0
	buf=buff*18000/32768;			//��buff���ɽǶȲ�����100����
	x1=buf/10000;a1=buf-x1*10000;	//�����һλ
	x2=a1/1000;a2=a1-x2*1000;       //����ڶ�λ
	x3=a2/100;a3=a2-x3*100;			//�������λ
	x4=a3/10;a4=a3-x4*10;			//�������λ
	x5=a4;							//�������λ
}


void interrupt usart_seve() 
{

		data[n]=RCREG;
		if(data[0]!=0x55)n=0;   //�ж�data[0]�Ƿ�ΪЭ��ͷ�����������½���
		TXREG=useful[n];	    //��useful���ݷ��͸�����
		while(!TRMT);		    //�ȴ��������
		if(data[0]==0x55)n++;	//��data[0]ΪЭ��ͷ����Խ���ȫ��
		if(n>=11)n=0;			//��������11λ�����¿�ʼ��һ��

}

main()
{
	TRISD=0; TRISA=0;ADCON1=7;//����˿ڷ���
	DELAY(); //������ʱ,���ϵ� LCD ��λ��һ���� PIC ��
	PORTD=1;ENABLE(); //����
	PORTD=0x38;ENABLE(); //8 λ 2 �� 5x7 ����
	PORTD=0x0c;ENABLE(); //��ʾ��������겻������˸����
	PORTD=0x06;ENABLE(); //���ֲ���������Զ�����
	TRISC=0xff;PORTC=0xff;
	SPBRG=25;//ת�ز����ʷ�������ԼΪ9600kbd
	TXSTA=0B00100100;//ʹ��USART���ͣ������ʷ�����Ϊ���ٷ�ʽ
	RCSTA=0B10010000;//��������
	GIE=1;PEIE=1;RCIE=1;//����USART�����ж�
while(1)
{
	if(data[1]==0x53 && data[0]==0x55)//�ж�Э��ͷ����������
	{for(int i=0;i<11;i++){useful[i]=data[i];}};//������Ҫ��������dataǰ11�������ݸ�ֵ������useful
	datax=(short)((short)useful[3]<<8|useful[2]);//���Ƕ�X����ǿ��ת����short���͸ߵ�λ�ϲ���ֵ��datax
	buff=datax;div();
	PORTD=0x80; ENABLE(); //���ָ��� 1 �е�λ��
	PORTD='R'; ENABLE1(); //�Ƕ�X
	if(flag==1){PORTD='-'; ENABLE1();} //��־λ��Ϊ1�����һ�����ŷ�������ո�
	else {PORTD=' '; ENABLE1();}
	PORTD=table[x1]; ENABLE1();//�����һλ
	PORTD=table[x2]; ENABLE1();//����ڶ�λ
	PORTD=table[x3]; ENABLE1();//�������λ
	PORTD='.'; ENABLE1();
	PORTD=table[x4]; ENABLE1();//�������λ
	PORTD=table[x5]; ENABLE1();//�������λ
	PORTD=' '; ENABLE1();
	datay=(useful[5]<<8|useful[4]);//���Ƕ�Y����ǿ��ת����short���͸ߵ�λ�ϲ���ֵ��datay
	buff=datay;div();
	PORTD='P'; ENABLE1();//�Ƕ�Y
	if(flag==1){PORTD='-'; ENABLE1();}
	else {PORTD=' '; ENABLE1();}
	PORTD=table[x1]; ENABLE1();
	PORTD=table[x2]; ENABLE1();
	PORTD=table[x3]; ENABLE1();
	PORTD='.'; ENABLE1();
	PORTD=table[x4]; ENABLE1();
	K=x5;    //����lcdһ�в����� �򽫽Ƕ�Y�ĵڶ�λС����ֵ��K��������
	//PORTD=table[x5]; ENABLE1();
	PORTD=' '; ENABLE1();
	dataz=(useful[7]<<8|useful[6]);//���Ƕ�Z����ǿ��ת����short���͸ߵ�λ�ϲ���ֵ��dataz
	buff=dataz;div();
	PORTD=0xC0; ENABLE(); //���ָ��� 2 �е�λ��
	PORTD='Y'; ENABLE1();//�Ƕ�Z
	if(flag==1){PORTD='-'; ENABLE1();}
	else {PORTD=' '; ENABLE1();}
	PORTD=table[x1]; ENABLE1();
	PORTD=table[x2]; ENABLE1();
	PORTD=table[x3]; ENABLE1();
	PORTD='.'; ENABLE1();
	PORTD=table[x4]; ENABLE1();
	PORTD=table[x5]; ENABLE1();
	PORTD=' '; ENABLE1();
	PORTD=0xCF; ENABLE(); 
	PORTD=table[K]; ENABLE1();//�Ƕ�Y�ĵڶ�λС��
}
}