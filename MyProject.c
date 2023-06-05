unsigned int i, j, count;
      unsigned bal=0; //credit
      unsigned char balval[6];
      unsigned char location;
      int index;
      int match = 1; // Variable to track if the password matches or not
      unsigned char attempts = 0; // Variable to track the number of attempts

      // Start Lcd module connections
      #define RS RD0_bit  //PIN 0 of PORTD is assigned for register select Pin of LCD/
      #define EN RD1_bit  //PIN 1 of PORTD is assigned for enable Pin of LCD */
      #define ldata PORTD  //PORTD(PD4-PD7) D4-D7 is assigned for LCD Data Output/
      #define LCD_Port TRISD  //define macros for PORTD Direction Register/
      // End Lcd module connections


      //LCD functions
      void LCD_command(unsigned char);
      void LCD_initialize();
      void LCD_String_xy (unsigned char ,unsigned char ,unsigned char *);
      void LCD_String (unsigned char *);
      void LCD_Char (unsigned char );
      void LCD_Clear();
      //End of LCD functions


            // Start Keypad module connections
      #define ROW1 RB4_bit
      #define ROW2 RB5_bit
      #define ROW3 RB6_bit
      #define ROW4 RB7_bit
      #define COL1 RB1_bit
      #define COL2 RB2_bit
      #define COL3 RB3_bit
      // End Keypad module connections


      //Keypad functions
      void setPassword();
      void checkpass();
      void entercoins();
      unsigned char key();
      unsigned char keypad[4][3]={{'1','2','3'},{'4','5','6'},{'7','8','9'},{'*','0','#'}};
      unsigned char rownum,colnum;
      //End of Keypad functions


      //start of keypad  variables
      unsigned char Sel;//3Decimal points
      unsigned char Selkey[2];
      #define PASSWORD_LENGTH 4 //for setting the password
      //char password[PASSWORD_LENGTH] = '0000';  //set to be four
      char password[PASSWORD_LENGTH];  //set to be four
      char pass[4];
      char inputpass[4];
      unsigned char kp;
      unsigned char ki;
      //end of keypad variables



      //start of servo motor
      unsigned int angle;
      unsigned char HL;//High Low
      void pwm_init();
      void set_servo_position(int degrees);
      //end of servo motor



      //Delay function
      void MSdelay(unsigned int val);
      void Delay_us(unsigned int microseconds);


void main()
{

      pwm_init(); // Initialize PWM module
      set_servo_position(0); // Set servo position to -45 degrees
      Delay_us(250); // Wait for a very short delay
      TRISB = 0x0F;
      option_reg = option_reg&0x7F;
      //keypad

      TRISC=0XFF;
      TRISD=0x00;

      PORTC = 0x00;
      PORTB= 0x00;


      //ADCON1 = ADCON1 | 0X0C; //make PORTE digital
      //TRISE = TRISE | 0x06; //IR Sensor for RE1 and RE2 as inputs
      //TRISA = TRISA | 0X06;
      //IR sensor
      TRISC=0XF0;

      LCD_Initialize();


      setPassword();
      LCD_Clear();
      MSdelay(2000);

      //checkpass();



      while(1)
         {
              while(COL1 && COL2 && COL3)
              {
                 entercoins();
              }


              Sel=key();
              if(Sel == '*')
              {

                 LCD_String_xy(1,0,"Door opening");
                 set_servo_position(90); // Set servo position to 45 degrees
                 //Delay_us(250); // Wait for a very short delay
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


//start of LCD function

      void LCD_Initialize () /* LCD Initialize function */
      {
           LCD_Port = 0x00;       //PORT as Output Port/
           delay_ms(20);        //15ms,16x2 LCD Power on delay/
           LCD_Command(0x02);  /*send for initialization of LCD for nibble (4-bit) mode */
           LCD_Command(0x28);  //use 2 line and initialize 5*8 matrix in (4-bit mode)/
           LCD_Command(0x01);  //clear display screen/
           LCD_Command(0x0c);  //display on cursor off/
           LCD_Command(0x06);  //increment cursor (shift cursor to right)/
    }

    void LCD_command(unsigned char cmnd)
    {
        ldata = (ldata & 0x0f) |(0xF0 & cmnd);  //Send higher nibble of command first to PORT/
        RS = 0;  //Command Register is selected i.e.RS=0/
        EN = 1;  //High-to-low pulse on Enable pin to latch data/
        asm NOP;
        EN = 0;
        MSdelay(1);
        ldata = (ldata & 0x0f) | (cmnd<<4);  /*Send lower nibble of command to PORT */
        EN = 1;
        asm NOP;
        EN = 0;
        MSdelay(3);
    }

    void LCD_String_xy (unsigned char row,unsigned char pos,unsigned char *str) //Send string to LCD function */
    {
    location=0;
    if(row<=1)
      {
        location=(0x80) | ((pos) & 0x0f);  //Print message on 1st row and desired location/
        LCD_Command(location);
      }
    else
      {
        location=(0xC0) | ((pos) & 0x0f);  //Print message on 2nd row and desired location/
        LCD_Command(location);
      }

    LCD_String(str);

    }

    void LCD_String (unsigned char *str) // Send string to LCD function */
    {
       while((*str)!=0)
        {
          LCD_Char(*str);
          str++;
        }
    }

    void LCD_Char (unsigned char chardata) /* LCD data write function */
    {
        ldata = (ldata & 0x0f) | (0xF0 & chardata);  //Send higher nibble of data first to PORT/
        RS = 1;  //Data Register is selected/
        EN = 1;  //High-to-low pulse on Enable pin to latch data/
        asm NOP;
        EN = 0;
        MSdelay(1);
        ldata = (ldata & 0x0f) | (chardata<<4);  //Send lower nibble of data to PORT/
        EN = 1;  //High-to-low pulse on Enable pin to latch data/
        asm NOP;
        EN = 0;
        MSdelay(3);
    }


    void LCD_Clear()
    {
       LCD_Command(0x01);  //clear display screen/
       MSdelay(3);
    }
  //End of LCD functions





//Start of keypad

        unsigned char key()
{
    PORTB=0X00; //set all bits in PORTB to 0

    while(COL1&&COL2&&COL3); //wait for a key press

    //scan the keypad for a specific key press
    while(!COL1||!COL2||!COL3) { //is checking if any of the column pins (COL1, COL2, COL3) are low. This means that if any of the column pins are connected to a button that is being pressed, the loop will continue to execute.
        //set ROW1 to 0, ROW2, ROW3, ROW4 to 1
        ROW1=0;
        ROW2=ROW3=ROW4=1;
        //check if a key press is detected on ROW1
        if(!COL1||!COL2||!COL3) {
        MSdelay(100);
            //set rownum to indicate key press on ROW1
            rownum=0;
            break;
        }
        //set ROW2 to 0, ROW1, ROW3, ROW4 to 1
        ROW2=0;ROW1=ROW3=ROW4=1;
        //check if a key press is detected on ROW2
        if(!COL1||!COL2||!COL3) {
        MSdelay(100);
            //set rownum to indicate key press on ROW2
            rownum=1;
            break;
        }
        //set ROW3 to 0, ROW1, ROW2, ROW4 to 1
        ROW3=0;ROW2=ROW1=ROW4=1;
        //check if a key press is detected on ROW3
        if(!COL1||!COL2||!COL3) {
        MSdelay(100);
            //set rownum to indicate key press on ROW3
            rownum=2;
            break;
        }
        //set ROW4 to 0, ROW1, ROW2, ROW3 to 1
        ROW4=0; ROW1=ROW2=ROW3=1;
        //check if a key press is detected on ROW4
        if(!COL1||!COL2||!COL3){
        MSdelay(100);
            //set rownum to indicate key press on ROW4
            rownum=3;
            break;
        }
}

    //check which column the key press was detected on
    if(COL1==0&&COL2!=0&&COL3!=0)//if COL1 is pressed
    {
            MSdelay(100);
            //set colnum to indicate key press on COL1
            colnum=0;
    }
    else if(COL1!=0&&COL2==0&&COL3!=0)//if COL2 is pressed
    {
            MSdelay(100);
            //set colnum to indicate key press on COL2
            colnum=1;
    }
    else if(COL1!=0&&COL2!=0&&COL3==0)//if COL3 is pressed
    {
            MSdelay(100);
            //set colnum to indicate key press on COL3
            colnum=2;
    }

    //wait for key press to be released
    while(COL1==0||COL2==0||COL3==0);//to prevent from debouncing to filter out unwanted signals and ensure that only one button press is registered.
    //return the value of the keypad at the position indicated by the rownum and colnum variables
    return (keypad[rownum][colnum]);
}
//END of keypad


 void entercoins()
 {
      LCD_String_xy(1,0,"Waiting.. :)");
      MSdelay(500);
      LCD_Clear();

      LCD_String_xy(1,0,"Balance:");

      //if (PORTC.RC4 == 0)
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
      //if (PORTC.RC5 == 0)
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

      //if (PORTC.RC6 == 0)
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

      //if (PORTC.RC7 == 0)
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



  //setting the password
      void setPassword()
      {
            LCD_String_xy(1,0,"Enter pass:");
            index = 0;

            while (index < PASSWORD_LENGTH)
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
 //end of setting the pass




 //start of checking pass
void checkpass()
{

    while (attempts < 3) // Keep looping until three attempts are made
    {
        LCD_Clear();
        LCD_String_xy(1, 0, "enter pass");
        MSdelay(1000);
        index = 0;

        while (index < PASSWORD_LENGTH)
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



        for (index = 0; index < PASSWORD_LENGTH; index++)
        {
            if (inputpass[index] != pass[index])
            {
                match = 0; // Set match to 0 if any characters don't match
                break; // Exit the loop, no need to continue checking
            }
        }

        if (match == 1)
        {
            LCD_String_xy(1, 0, "CORRECT");
            // The passwords match
            // Perform the desired actions for correct password
            //doorcontrol();
            //MSdelay(5000);
            break; // Exit the loop if the password is correct
        }
        else
        {
            attempts++; // Increase the count of incorrect password attempts

            if (attempts == 3)
            {
                LCD_String_xy(1, 0, "MAX ATTEMPTS");
                //LCD_String_xy(2, 0, "YOU FAILED :(");
                //PORTC.RC1=1;
                PORTC=PORTC | 0x01;
                MSdelay(5000);
                // Perform actions for reaching maximum incorrect attempts
                break; // Exit the loop if maximum attempts reached
            }
            else
            {
                LCD_String_xy(1, 0, "INCORRECT");
                // Perform the desired actions for incorrect password
            }
        }
    }
}
//end of checking pass



//Delay function
void MSdelay(unsigned int val)
{
     for(i=0;i<val;i++)
          for(j=0;j<165;j++);  /*This count Provide delay of 1 ms for 8MHz Frequency */
}
//End of delay function


 //servo motor
void pwm_init() {
     TRISC = TRISC & 0xF9;      // Set RC2 pin as output
     
     // Configure CCP1 module for PWM
     CCP1CON = 0x0C;
     
     CCP2CON = 0x0C;
     
     T2CON = T2CON | 0x07;
     
     PR2 = 249; // Set period register for 50Hz frequency
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
    int pulse_width = (degrees + 90) * 8 + 500; // Calculate pulse width (500 to 2400)
    CCPR1L = pulse_width >> 2; // Set CCPR1L register
    CCP1CON = (CCP1CON & 0xCF) | ((pulse_width & 0x03) << 4); // Set CCP1CON register
    Delay_ms(50*4); // Delay for the servo to reach the desired position
}
//end of servo motor