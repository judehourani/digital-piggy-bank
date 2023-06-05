#line 1 "C:/Users/Kevin/Desktop/New folder/MyProject.c"
unsigned int i, j, count;
 unsigned bal=0;
 unsigned char balval[6];
 unsigned char location;
 int index;
 int match = 1;
 unsigned char attempts = 0;










 void LCD_command(unsigned char);
 void LCD_initialize();
 void LCD_String_xy (unsigned char ,unsigned char ,unsigned char *);
 void LCD_String (unsigned char *);
 void LCD_Char (unsigned char );
 void LCD_Clear();
#line 39 "C:/Users/Kevin/Desktop/New folder/MyProject.c"
 void setPassword();
 void checkpass();
 void entercoins();
 unsigned char key();
 unsigned char keypad[4][3]={{'1','2','3'},{'4','5','6'},{'7','8','9'},{'*','0','#'}};
 unsigned char rownum,colnum;




 unsigned char Sel;
 unsigned char Selkey[2];


 char password[ 4 ];
 char pass[4];
 char inputpass[4];
 unsigned char kp;
 unsigned char ki;





 unsigned int angle;
 unsigned char HL;
 void pwm_init();
 void set_servo_position(int degrees);





 void MSdelay(unsigned int val);
 void Delay_us(unsigned int microseconds);


void main()
{

 pwm_init();
 set_servo_position(0);
 Delay_us(250);
 TRISB = 0x0F;
 option_reg = option_reg&0x7F;


 TRISC=0XFF;
 TRISD=0x00;

 PORTC = 0x00;
 PORTB= 0x00;






 TRISC=0XF0;

 LCD_Initialize();


 setPassword();
 LCD_Clear();
 MSdelay(2000);





 while(1)
 {
 while( RB1_bit  &&  RB2_bit  &&  RB3_bit )
 {
 entercoins();
 }


 Sel=key();
 if(Sel == '*')
 {

 LCD_String_xy(1,0,"Door opening");
 set_servo_position(90);

 MSdelay(5000);
 LCD_String_xy(1,0,"Door CLOSING");
 set_servo_position(0);
 }
 if(Sel == '#')
 {
 LCD_String_xy(1,0,"Balance");
 WordToStr(bal,balval);
 LCD_String_xy(2,7,balval);
 MSdelay(5000);
 }



 }



}




 void LCD_Initialize ()
 {
  TRISD  = 0x00;
 delay_ms(20);
 LCD_Command(0x02);
 LCD_Command(0x28);
 LCD_Command(0x01);
 LCD_Command(0x0c);
 LCD_Command(0x06);
 }

 void LCD_command(unsigned char cmnd)
 {
  PORTD  = ( PORTD  & 0x0f) |(0xF0 & cmnd);
  RD0_bit  = 0;
  RD1_bit  = 1;
 asm NOP;
  RD1_bit  = 0;
 MSdelay(1);
  PORTD  = ( PORTD  & 0x0f) | (cmnd<<4);
  RD1_bit  = 1;
 asm NOP;
  RD1_bit  = 0;
 MSdelay(3);
 }

 void LCD_String_xy (unsigned char row,unsigned char pos,unsigned char *str)
 {
 location=0;
 if(row<=1)
 {
 location=(0x80) | ((pos) & 0x0f);
 LCD_Command(location);
 }
 else
 {
 location=(0xC0) | ((pos) & 0x0f);
 LCD_Command(location);
 }

 LCD_String(str);

 }

 void LCD_String (unsigned char *str)
 {
 while((*str)!=0)
 {
 LCD_Char(*str);
 str++;
 }
 }

 void LCD_Char (unsigned char chardata)
 {
  PORTD  = ( PORTD  & 0x0f) | (0xF0 & chardata);
  RD0_bit  = 1;
  RD1_bit  = 1;
 asm NOP;
  RD1_bit  = 0;
 MSdelay(1);
  PORTD  = ( PORTD  & 0x0f) | (chardata<<4);
  RD1_bit  = 1;
 asm NOP;
  RD1_bit  = 0;
 MSdelay(3);
 }


 void LCD_Clear()
 {
 LCD_Command(0x01);
 MSdelay(3);
 }








 unsigned char key()
{
 PORTB=0X00;

 while( RB1_bit && RB2_bit && RB3_bit );


 while(! RB1_bit ||! RB2_bit ||! RB3_bit ) {

  RB4_bit =0;
  RB5_bit = RB6_bit = RB7_bit =1;

 if(! RB1_bit ||! RB2_bit ||! RB3_bit ) {
 MSdelay(100);

 rownum=0;
 break;
 }

  RB5_bit =0; RB4_bit = RB6_bit = RB7_bit =1;

 if(! RB1_bit ||! RB2_bit ||! RB3_bit ) {
 MSdelay(100);

 rownum=1;
 break;
 }

  RB6_bit =0; RB5_bit = RB4_bit = RB7_bit =1;

 if(! RB1_bit ||! RB2_bit ||! RB3_bit ) {
 MSdelay(100);

 rownum=2;
 break;
 }

  RB7_bit =0;  RB4_bit = RB5_bit = RB6_bit =1;

 if(! RB1_bit ||! RB2_bit ||! RB3_bit ){
 MSdelay(100);

 rownum=3;
 break;
 }
}


 if( RB1_bit ==0&& RB2_bit !=0&& RB3_bit !=0)
 {
 MSdelay(100);

 colnum=0;
 }
 else if( RB1_bit !=0&& RB2_bit ==0&& RB3_bit !=0)
 {
 MSdelay(100);

 colnum=1;
 }
 else if( RB1_bit !=0&& RB2_bit !=0&& RB3_bit ==0)
 {
 MSdelay(100);

 colnum=2;
 }


 while( RB1_bit ==0|| RB2_bit ==0|| RB3_bit ==0);

 return (keypad[rownum][colnum]);
}



 void entercoins()
 {
 LCD_String_xy(1,0,"Waiting.. :)");
 MSdelay(500);
 LCD_Clear();

 LCD_String_xy(1,0,"Balance:");


 if(PORTC & 0x10)
 {
 bal=bal+5;
 MSdelay(1000);
 WordToStr(bal,balval);

 LCD_String_xy(2,3,balval);
 LCD_String_xy(2,10,"fils");
 LCD_String_xy(1,13,":");


 MSdelay(1000);
 }

 if(PORTC & 0x20)
 {
 MSdelay(1000);
 bal=bal+50;
 WordToStr(bal,balval);

 LCD_String_xy(2,3,balval);
 LCD_String_xy(2,10,"fils");
 LCD_String_xy(1,13,":");

 MSdelay(1000);
 }


 if (PORTC & 0x40)
 {
 MSdelay(1000);
 bal=bal+25;
 WordToStr(bal,balval);

 LCD_String_xy(2,3,balval);
 LCD_String_xy(2,10,"fils");
 LCD_String_xy(1,13,":");

 MSdelay(1000);
 }


 if(PORTC & 0x80)
 {
 MSdelay(1000);
 bal=bal+10;
 WordToStr(bal,balval);

 LCD_String_xy(2,3,balval);
 LCD_String_xy(2,10,"fils");
 LCD_String_xy(1,13,":");

 MSdelay(1000);
 }


 }




 void setPassword()
 {
 LCD_String_xy(1,0,"Enter pass:");
 index = 0;

 while (index <  4 )
 {
 kp = key();
 pass[index] = kp;
 LCD_String_xy(2,index,"*");
 index++;
 MSdelay(500);
 }

 LCD_Clear();
 LCD_String_xy(1,0,"Password set.");
 MSdelay(1000);
 LCD_Clear();
 }






void checkpass()
{

 while (attempts < 3)
 {
 LCD_Clear();
 LCD_String_xy(1, 0, "enter pass");
 MSdelay(1000);
 index = 0;

 while (index <  4 )
 {
 kp = key();
 inputpass[index] = kp;
 LCD_String_xy(2, index, "*");
 index++;
 MSdelay(500);
 }

 LCD_Clear();
 LCD_String_xy(1, 0, "checking..");
 MSdelay(1000);
 LCD_Clear();



 for (index = 0; index <  4 ; index++)
 {
 if (inputpass[index] != pass[index])
 {
 match = 0;
 break;
 }
 }

 if (match == 1)
 {
 LCD_String_xy(1, 0, "CORRECT");




 break;
 }
 else
 {
 attempts++;

 if (attempts == 3)
 {
 LCD_String_xy(1, 0, "MAX ATTEMPTS");


 PORTC=PORTC | 0x01;
 MSdelay(5000);

 break;
 }
 else
 {
 LCD_String_xy(1, 0, "INCORRECT");

 }
 }
 }
}





void MSdelay(unsigned int val)
{
 for(i=0;i<val;i++)
 for(j=0;j<165;j++);
}




void pwm_init() {
 TRISC = TRISC & 0xF9;


 CCP1CON = 0x0C;

 CCP2CON = 0x0C;

 T2CON = T2CON | 0x07;

 PR2 = 249;
}

void Delay_us(unsigned int microseconds) {
 unsigned int i;

 while (microseconds--) {
 for (i = 0; i < 12; i++) {
 asm nop;
 }
 }
}

void Delay_ms(unsigned int milliseconds) {
 unsigned int i;

 while (milliseconds--) {
 for (i = 0; i < 238; i++) {
 Delay_us(1000);
 }
 }
}

void set_servo_position(int degrees) {
 int pulse_width = (degrees + 90) * 8 + 500;
 CCPR1L = pulse_width >> 2;
 CCP1CON = (CCP1CON & 0xCF) | ((pulse_width & 0x03) << 4);
 Delay_ms(50*4);
}
