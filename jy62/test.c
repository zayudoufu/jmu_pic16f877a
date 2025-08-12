#include<pic.h>
#include<stdint.h>
__CONFIG(0xFF29);     //芯片配置位定义
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
void ENABLE()//写入控制命令的子程序
{ RA5=0; RA4=0;RA3=0;DELAY();RA3=1;}
void ENABLE1()//写入字的子程序
{ RA5=1; RA4=0;RA3=0;DELAY();RA3=1;}

void div()
{
	if(buff<0){flag=1;buff=-buff;}  //buff为short有正负之分所以这里判断是否为负数
	else flag=0;					//若为负数标志位flag置1否则清0
	buf=buff*18000/32768;			//将buff换成角度并扩大100倍数
	x1=buf/10000;a1=buf-x1*10000;	//计算第一位
	x2=a1/1000;a2=a1-x2*1000;       //计算第二位
	x3=a2/100;a3=a2-x3*100;			//计算第三位
	x4=a3/10;a4=a3-x4*10;			//计算第四位
	x5=a4;							//计算第五位
}


void interrupt usart_seve() 
{

		data[n]=RCREG;
		if(data[0]!=0x55)n=0;   //判断data[0]是否为协议头若不是则重新接收
		TXREG=useful[n];	    //将useful数据发送给电脑
		while(!TRMT);		    //等待发送完毕
		if(data[0]==0x55)n++;	//若data[0]为协议头则可以接收全部
		if(n>=11)n=0;			//当接收完11位后重新开始下一轮

}

main()
{
	TRISD=0; TRISA=0;ADCON1=7;//定义端口方向
	DELAY(); //调用延时,刚上电 LCD 复位不一定有 PIC 快
	PORTD=1;ENABLE(); //清屏
	PORTD=0x38;ENABLE(); //8 位 2 行 5x7 点阵
	PORTD=0x0c;ENABLE(); //显示器开、光标不开、闪烁不开
	PORTD=0x06;ENABLE(); //文字不动，光标自动右移
	TRISC=0xff;PORTC=0xff;
	SPBRG=25;//转载波特率发生器，约为9600kbd
	TXSTA=0B00100100;//使能USART发送，波特率发生器为高速方式
	RCSTA=0B10010000;//连续接收
	GIE=1;PEIE=1;RCIE=1;//开放USART接收中断
while(1)
{
	if(data[1]==0x53 && data[0]==0x55)//判断协议头和数据内容
	{for(int i=0;i<11;i++){useful[i]=data[i];}};//若符合要求则将数组data前11个的数据赋值给数组useful
	datax=(short)((short)useful[3]<<8|useful[2]);//将角度X数据强制转换成short类型高低位合并赋值给datax
	buff=datax;div();
	PORTD=0x80; ENABLE(); //光标指向第 1 行的位置
	PORTD='R'; ENABLE1(); //角度X
	if(flag==1){PORTD='-'; ENABLE1();} //标志位若为1则输出一个符号否则输出空格
	else {PORTD=' '; ENABLE1();}
	PORTD=table[x1]; ENABLE1();//输出第一位
	PORTD=table[x2]; ENABLE1();//输出第二位
	PORTD=table[x3]; ENABLE1();//输出第三位
	PORTD='.'; ENABLE1();
	PORTD=table[x4]; ENABLE1();//输出第四位
	PORTD=table[x5]; ENABLE1();//输出第五位
	PORTD=' '; ENABLE1();
	datay=(useful[5]<<8|useful[4]);//将角度Y数据强制转换成short类型高低位合并赋值给datay
	buff=datay;div();
	PORTD='P'; ENABLE1();//角度Y
	if(flag==1){PORTD='-'; ENABLE1();}
	else {PORTD=' '; ENABLE1();}
	PORTD=table[x1]; ENABLE1();
	PORTD=table[x2]; ENABLE1();
	PORTD=table[x3]; ENABLE1();
	PORTD='.'; ENABLE1();
	PORTD=table[x4]; ENABLE1();
	K=x5;    //由于lcd一行不够用 则将角度Y的第二位小数赋值给K到最后输出
	//PORTD=table[x5]; ENABLE1();
	PORTD=' '; ENABLE1();
	dataz=(useful[7]<<8|useful[6]);//将角度Z数据强制转换成short类型高低位合并赋值给dataz
	buff=dataz;div();
	PORTD=0xC0; ENABLE(); //光标指向第 2 行的位置
	PORTD='Y'; ENABLE1();//角度Z
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
	PORTD=table[K]; ENABLE1();//角度Y的第二位小数
}
}