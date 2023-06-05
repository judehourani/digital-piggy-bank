
_main:

;MyProject.c,76 :: 		void main()
;MyProject.c,79 :: 		pwm_init(); // Initialize PWM module
	CALL       _pwm_init+0
;MyProject.c,80 :: 		set_servo_position(0); // Set servo position to -45 degrees
	CLRF       FARG_set_servo_position_degrees+0
	CLRF       FARG_set_servo_position_degrees+1
	CALL       _set_servo_position+0
;MyProject.c,81 :: 		Delay_us(250); // Wait for a very short delay
	MOVLW      166
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	NOP
;MyProject.c,82 :: 		TRISB = 0x0F;
	MOVLW      15
	MOVWF      TRISB+0
;MyProject.c,83 :: 		option_reg = option_reg&0x7F;
	MOVLW      127
	ANDWF      OPTION_REG+0, 1
;MyProject.c,86 :: 		TRISC=0XFF;
	MOVLW      255
	MOVWF      TRISC+0
;MyProject.c,87 :: 		TRISD=0x00;
	CLRF       TRISD+0
;MyProject.c,89 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;MyProject.c,90 :: 		PORTB= 0x00;
	CLRF       PORTB+0
;MyProject.c,97 :: 		TRISC=0XF0;
	MOVLW      240
	MOVWF      TRISC+0
;MyProject.c,99 :: 		LCD_Initialize();
	CALL       _LCD_initialize+0
;MyProject.c,102 :: 		setPassword();
	CALL       _setPassword+0
;MyProject.c,103 :: 		LCD_Clear();
	CALL       _LCD_Clear+0
;MyProject.c,104 :: 		MSdelay(2000);
	MOVLW      208
	MOVWF      FARG_MSdelay_val+0
	MOVLW      7
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,110 :: 		while(1)
L_main1:
;MyProject.c,112 :: 		while(COL1 && COL2 && COL3)
L_main3:
	BTFSS      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main4
	BTFSS      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main4
	BTFSS      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_main4
L__main85:
;MyProject.c,114 :: 		entercoins();
	CALL       _entercoins+0
;MyProject.c,115 :: 		}
	GOTO       L_main3
L_main4:
;MyProject.c,118 :: 		Sel=key();
	CALL       _key+0
	MOVF       R0+0, 0
	MOVWF      _Sel+0
;MyProject.c,119 :: 		if(Sel == '*')
	MOVF       R0+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;MyProject.c,122 :: 		LCD_String_xy(1,0,"Door opening");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy+0
	CLRF       FARG_LCD_String_xy+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
;MyProject.c,123 :: 		set_servo_position(90); // Set servo position to 45 degrees
	MOVLW      90
	MOVWF      FARG_set_servo_position_degrees+0
	MOVLW      0
	MOVWF      FARG_set_servo_position_degrees+1
	CALL       _set_servo_position+0
;MyProject.c,125 :: 		MSdelay(5000);
	MOVLW      136
	MOVWF      FARG_MSdelay_val+0
	MOVLW      19
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,126 :: 		LCD_String_xy(1,0,"Door CLOSING");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy+0
	CLRF       FARG_LCD_String_xy+0
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
;MyProject.c,127 :: 		set_servo_position(0);
	CLRF       FARG_set_servo_position_degrees+0
	CLRF       FARG_set_servo_position_degrees+1
	CALL       _set_servo_position+0
;MyProject.c,128 :: 		}
L_main7:
;MyProject.c,129 :: 		if(Sel == '#')
	MOVF       _Sel+0, 0
	XORLW      35
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;MyProject.c,131 :: 		LCD_String_xy(1,0,"Balance");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy+0
	CLRF       FARG_LCD_String_xy+0
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
;MyProject.c,132 :: 		WordToStr(bal,balval);
	MOVF       _bal+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _bal+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _balval+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;MyProject.c,133 :: 		LCD_String_xy(2,7,balval);
	MOVLW      2
	MOVWF      FARG_LCD_String_xy+0
	MOVLW      7
	MOVWF      FARG_LCD_String_xy+0
	MOVLW      _balval+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
;MyProject.c,134 :: 		MSdelay(5000);
	MOVLW      136
	MOVWF      FARG_MSdelay_val+0
	MOVLW      19
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,135 :: 		}
L_main8:
;MyProject.c,139 :: 		}
	GOTO       L_main1
;MyProject.c,143 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_LCD_Initialize:

;MyProject.c,148 :: 		void LCD_Initialize () /* LCD Initialize function */
;MyProject.c,150 :: 		LCD_Port = 0x00;       //PORT as Output Port/
	CLRF       TRISD+0
;MyProject.c,151 :: 		delay_ms(20);        //15ms,16x2 LCD Power on delay/
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_LCD_Initialize9:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_Initialize9
	DECFSZ     R12+0, 1
	GOTO       L_LCD_Initialize9
	NOP
	NOP
;MyProject.c,152 :: 		LCD_Command(0x02);  /*send for initialization of LCD for nibble (4-bit) mode */
	MOVLW      2
	MOVWF      FARG_LCD_command+0
	CALL       _LCD_command+0
;MyProject.c,153 :: 		LCD_Command(0x28);  //use 2 line and initialize 5*8 matrix in (4-bit mode)/
	MOVLW      40
	MOVWF      FARG_LCD_command+0
	CALL       _LCD_command+0
;MyProject.c,154 :: 		LCD_Command(0x01);  //clear display screen/
	MOVLW      1
	MOVWF      FARG_LCD_command+0
	CALL       _LCD_command+0
;MyProject.c,155 :: 		LCD_Command(0x0c);  //display on cursor off/
	MOVLW      12
	MOVWF      FARG_LCD_command+0
	CALL       _LCD_command+0
;MyProject.c,156 :: 		LCD_Command(0x06);  //increment cursor (shift cursor to right)/
	MOVLW      6
	MOVWF      FARG_LCD_command+0
	CALL       _LCD_command+0
;MyProject.c,157 :: 		}
L_end_LCD_Initialize:
	RETURN
; end of _LCD_Initialize

_LCD_command:

;MyProject.c,159 :: 		void LCD_command(unsigned char cmnd)
;MyProject.c,161 :: 		ldata = (ldata & 0x0f) |(0xF0 & cmnd);  //Send higher nibble of command first to PORT/
	MOVLW      15
	ANDWF      PORTD+0, 0
	MOVWF      R1+0
	MOVLW      240
	ANDWF      FARG_LCD_command_cmnd+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 0
	MOVWF      PORTD+0
;MyProject.c,162 :: 		RS = 0;  //Command Register is selected i.e.RS=0/
	BCF        RD0_bit+0, BitPos(RD0_bit+0)
;MyProject.c,163 :: 		EN = 1;  //High-to-low pulse on Enable pin to latch data/
	BSF        RD1_bit+0, BitPos(RD1_bit+0)
;MyProject.c,164 :: 		asm NOP;
	NOP
;MyProject.c,165 :: 		EN = 0;
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
;MyProject.c,166 :: 		MSdelay(1);
	MOVLW      1
	MOVWF      FARG_MSdelay_val+0
	MOVLW      0
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,167 :: 		ldata = (ldata & 0x0f) | (cmnd<<4);  /*Send lower nibble of command to PORT */
	MOVLW      15
	ANDWF      PORTD+0, 0
	MOVWF      R2+0
	MOVF       FARG_LCD_command_cmnd+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	IORWF      R2+0, 0
	MOVWF      PORTD+0
;MyProject.c,168 :: 		EN = 1;
	BSF        RD1_bit+0, BitPos(RD1_bit+0)
;MyProject.c,169 :: 		asm NOP;
	NOP
;MyProject.c,170 :: 		EN = 0;
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
;MyProject.c,171 :: 		MSdelay(3);
	MOVLW      3
	MOVWF      FARG_MSdelay_val+0
	MOVLW      0
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,172 :: 		}
L_end_LCD_command:
	RETURN
; end of _LCD_command

_LCD_String_xy:

;MyProject.c,174 :: 		void LCD_String_xy (unsigned char row,unsigned char pos,unsigned char *str) //Send string to LCD function */
;MyProject.c,176 :: 		location=0;
	CLRF       _location+0
;MyProject.c,177 :: 		if(row<=1)
	MOVF       FARG_LCD_String_xy_row+0, 0
	SUBLW      1
	BTFSS      STATUS+0, 0
	GOTO       L_LCD_String_xy10
;MyProject.c,179 :: 		location=(0x80) | ((pos) & 0x0f);  //Print message on 1st row and desired location/
	MOVLW      15
	ANDWF      FARG_LCD_String_xy_pos+0, 0
	MOVWF      R0+0
	BSF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      _location+0
;MyProject.c,180 :: 		LCD_Command(location);
	MOVF       R0+0, 0
	MOVWF      FARG_LCD_command_cmnd+0
	CALL       _LCD_command+0
;MyProject.c,181 :: 		}
	GOTO       L_LCD_String_xy11
L_LCD_String_xy10:
;MyProject.c,184 :: 		location=(0xC0) | ((pos) & 0x0f);  //Print message on 2nd row and desired location/
	MOVLW      15
	ANDWF      FARG_LCD_String_xy_pos+0, 0
	MOVWF      R0+0
	MOVLW      192
	IORWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _location+0
;MyProject.c,185 :: 		LCD_Command(location);
	MOVF       R0+0, 0
	MOVWF      FARG_LCD_command_cmnd+0
	CALL       _LCD_command+0
;MyProject.c,186 :: 		}
L_LCD_String_xy11:
;MyProject.c,188 :: 		LCD_String(str);
	MOVF       FARG_LCD_String_xy_str+0, 0
	MOVWF      FARG_LCD_String+0
	CALL       _LCD_String+0
;MyProject.c,190 :: 		}
L_end_LCD_String_xy:
	RETURN
; end of _LCD_String_xy

_LCD_String:

;MyProject.c,192 :: 		void LCD_String (unsigned char *str) // Send string to LCD function */
;MyProject.c,194 :: 		while((*str)!=0)
L_LCD_String12:
	MOVF       FARG_LCD_String_str+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_LCD_String13
;MyProject.c,196 :: 		LCD_Char(*str);
	MOVF       FARG_LCD_String_str+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
;MyProject.c,197 :: 		str++;
	INCF       FARG_LCD_String_str+0, 1
;MyProject.c,198 :: 		}
	GOTO       L_LCD_String12
L_LCD_String13:
;MyProject.c,199 :: 		}
L_end_LCD_String:
	RETURN
; end of _LCD_String

_LCD_Char:

;MyProject.c,201 :: 		void LCD_Char (unsigned char chardata) /* LCD data write function */
;MyProject.c,203 :: 		ldata = (ldata & 0x0f) | (0xF0 & chardata);  //Send higher nibble of data first to PORT/
	MOVLW      15
	ANDWF      PORTD+0, 0
	MOVWF      R1+0
	MOVLW      240
	ANDWF      FARG_LCD_Char_chardata+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 0
	MOVWF      PORTD+0
;MyProject.c,204 :: 		RS = 1;  //Data Register is selected/
	BSF        RD0_bit+0, BitPos(RD0_bit+0)
;MyProject.c,205 :: 		EN = 1;  //High-to-low pulse on Enable pin to latch data/
	BSF        RD1_bit+0, BitPos(RD1_bit+0)
;MyProject.c,206 :: 		asm NOP;
	NOP
;MyProject.c,207 :: 		EN = 0;
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
;MyProject.c,208 :: 		MSdelay(1);
	MOVLW      1
	MOVWF      FARG_MSdelay_val+0
	MOVLW      0
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,209 :: 		ldata = (ldata & 0x0f) | (chardata<<4);  //Send lower nibble of data to PORT/
	MOVLW      15
	ANDWF      PORTD+0, 0
	MOVWF      R2+0
	MOVF       FARG_LCD_Char_chardata+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	IORWF      R2+0, 0
	MOVWF      PORTD+0
;MyProject.c,210 :: 		EN = 1;  //High-to-low pulse on Enable pin to latch data/
	BSF        RD1_bit+0, BitPos(RD1_bit+0)
;MyProject.c,211 :: 		asm NOP;
	NOP
;MyProject.c,212 :: 		EN = 0;
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
;MyProject.c,213 :: 		MSdelay(3);
	MOVLW      3
	MOVWF      FARG_MSdelay_val+0
	MOVLW      0
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,214 :: 		}
L_end_LCD_Char:
	RETURN
; end of _LCD_Char

_LCD_Clear:

;MyProject.c,217 :: 		void LCD_Clear()
;MyProject.c,219 :: 		LCD_Command(0x01);  //clear display screen/
	MOVLW      1
	MOVWF      FARG_LCD_command_cmnd+0
	CALL       _LCD_command+0
;MyProject.c,220 :: 		MSdelay(3);
	MOVLW      3
	MOVWF      FARG_MSdelay_val+0
	MOVLW      0
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,221 :: 		}
L_end_LCD_Clear:
	RETURN
; end of _LCD_Clear

_key:

;MyProject.c,230 :: 		unsigned char key()
;MyProject.c,232 :: 		PORTB=0X00; //set all bits in PORTB to 0
	CLRF       PORTB+0
;MyProject.c,234 :: 		while(COL1&&COL2&&COL3); //wait for a key press
L_key14:
	BTFSS      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_key15
	BTFSS      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_key15
	BTFSS      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_key15
L__key95:
	GOTO       L_key14
L_key15:
;MyProject.c,237 :: 		while(!COL1||!COL2||!COL3) { //is checking if any of the column pins (COL1, COL2, COL3) are low. This means that if any of the column pins are connected to a button that is being pressed, the loop will continue to execute.
L_key18:
	BTFSS      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L__key94
	BTFSS      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L__key94
	BTFSS      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L__key94
	GOTO       L_key19
L__key94:
;MyProject.c,239 :: 		ROW1=0;
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
;MyProject.c,240 :: 		ROW2=ROW3=ROW4=1;
	BSF        RB7_bit+0, BitPos(RB7_bit+0)
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L__key104
	BCF        RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L__key105
L__key104:
	BSF        RB6_bit+0, BitPos(RB6_bit+0)
L__key105:
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L__key106
	BCF        RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L__key107
L__key106:
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
L__key107:
;MyProject.c,242 :: 		if(!COL1||!COL2||!COL3) {
	BTFSS      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L__key93
	BTFSS      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L__key93
	BTFSS      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L__key93
	GOTO       L_key24
L__key93:
;MyProject.c,243 :: 		MSdelay(100);
	MOVLW      100
	MOVWF      FARG_MSdelay_val+0
	MOVLW      0
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,245 :: 		rownum=0;
	CLRF       _rownum+0
;MyProject.c,246 :: 		break;
	GOTO       L_key19
;MyProject.c,247 :: 		}
L_key24:
;MyProject.c,249 :: 		ROW2=0;ROW1=ROW3=ROW4=1;
	BCF        RB5_bit+0, BitPos(RB5_bit+0)
	BSF        RB7_bit+0, BitPos(RB7_bit+0)
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L__key108
	BCF        RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L__key109
L__key108:
	BSF        RB6_bit+0, BitPos(RB6_bit+0)
L__key109:
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L__key110
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L__key111
L__key110:
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
L__key111:
;MyProject.c,251 :: 		if(!COL1||!COL2||!COL3) {
	BTFSS      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L__key92
	BTFSS      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L__key92
	BTFSS      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L__key92
	GOTO       L_key27
L__key92:
;MyProject.c,252 :: 		MSdelay(100);
	MOVLW      100
	MOVWF      FARG_MSdelay_val+0
	MOVLW      0
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,254 :: 		rownum=1;
	MOVLW      1
	MOVWF      _rownum+0
;MyProject.c,255 :: 		break;
	GOTO       L_key19
;MyProject.c,256 :: 		}
L_key27:
;MyProject.c,258 :: 		ROW3=0;ROW2=ROW1=ROW4=1;
	BCF        RB6_bit+0, BitPos(RB6_bit+0)
	BSF        RB7_bit+0, BitPos(RB7_bit+0)
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L__key112
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L__key113
L__key112:
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
L__key113:
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L__key114
	BCF        RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L__key115
L__key114:
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
L__key115:
;MyProject.c,260 :: 		if(!COL1||!COL2||!COL3) {
	BTFSS      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L__key91
	BTFSS      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L__key91
	BTFSS      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L__key91
	GOTO       L_key30
L__key91:
;MyProject.c,261 :: 		MSdelay(100);
	MOVLW      100
	MOVWF      FARG_MSdelay_val+0
	MOVLW      0
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,263 :: 		rownum=2;
	MOVLW      2
	MOVWF      _rownum+0
;MyProject.c,264 :: 		break;
	GOTO       L_key19
;MyProject.c,265 :: 		}
L_key30:
;MyProject.c,267 :: 		ROW4=0; ROW1=ROW2=ROW3=1;
	BCF        RB7_bit+0, BitPos(RB7_bit+0)
	BSF        RB6_bit+0, BitPos(RB6_bit+0)
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L__key116
	BCF        RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L__key117
L__key116:
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
L__key117:
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L__key118
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L__key119
L__key118:
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
L__key119:
;MyProject.c,269 :: 		if(!COL1||!COL2||!COL3){
	BTFSS      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L__key90
	BTFSS      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L__key90
	BTFSS      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L__key90
	GOTO       L_key33
L__key90:
;MyProject.c,270 :: 		MSdelay(100);
	MOVLW      100
	MOVWF      FARG_MSdelay_val+0
	MOVLW      0
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,272 :: 		rownum=3;
	MOVLW      3
	MOVWF      _rownum+0
;MyProject.c,273 :: 		break;
	GOTO       L_key19
;MyProject.c,274 :: 		}
L_key33:
;MyProject.c,275 :: 		}
	GOTO       L_key18
L_key19:
;MyProject.c,278 :: 		if(COL1==0&&COL2!=0&&COL3!=0)//if COL1 is pressed
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_key36
	BTFSS      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_key36
	BTFSS      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_key36
L__key89:
;MyProject.c,280 :: 		MSdelay(100);
	MOVLW      100
	MOVWF      FARG_MSdelay_val+0
	MOVLW      0
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,282 :: 		colnum=0;
	CLRF       _colnum+0
;MyProject.c,283 :: 		}
	GOTO       L_key37
L_key36:
;MyProject.c,284 :: 		else if(COL1!=0&&COL2==0&&COL3!=0)//if COL2 is pressed
	BTFSS      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_key40
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_key40
	BTFSS      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_key40
L__key88:
;MyProject.c,286 :: 		MSdelay(100);
	MOVLW      100
	MOVWF      FARG_MSdelay_val+0
	MOVLW      0
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,288 :: 		colnum=1;
	MOVLW      1
	MOVWF      _colnum+0
;MyProject.c,289 :: 		}
	GOTO       L_key41
L_key40:
;MyProject.c,290 :: 		else if(COL1!=0&&COL2!=0&&COL3==0)//if COL3 is pressed
	BTFSS      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_key44
	BTFSS      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_key44
	BTFSC      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_key44
L__key87:
;MyProject.c,292 :: 		MSdelay(100);
	MOVLW      100
	MOVWF      FARG_MSdelay_val+0
	MOVLW      0
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,294 :: 		colnum=2;
	MOVLW      2
	MOVWF      _colnum+0
;MyProject.c,295 :: 		}
L_key44:
L_key41:
L_key37:
;MyProject.c,298 :: 		while(COL1==0||COL2==0||COL3==0);//to prevent from debouncing to filter out unwanted signals and ensure that only one button press is registered.
L_key45:
	BTFSS      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L__key86
	BTFSS      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L__key86
	BTFSS      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L__key86
	GOTO       L_key46
L__key86:
	GOTO       L_key45
L_key46:
;MyProject.c,300 :: 		return (keypad[rownum][colnum]);
	MOVLW      3
	MOVWF      R0+0
	MOVF       _rownum+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      _keypad+0
	ADDWF      R0+0, 1
	MOVF       _colnum+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
;MyProject.c,301 :: 		}
L_end_key:
	RETURN
; end of _key

_entercoins:

;MyProject.c,305 :: 		void entercoins()
;MyProject.c,307 :: 		LCD_String_xy(1,0,"Waiting.. :)");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy_row+0
	CLRF       FARG_LCD_String_xy_pos+0
	MOVLW      ?lstr4_MyProject+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,308 :: 		MSdelay(500);
	MOVLW      244
	MOVWF      FARG_MSdelay_val+0
	MOVLW      1
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,309 :: 		LCD_Clear();
	CALL       _LCD_Clear+0
;MyProject.c,311 :: 		LCD_String_xy(1,0,"Balance:");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy_row+0
	CLRF       FARG_LCD_String_xy_pos+0
	MOVLW      ?lstr5_MyProject+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,314 :: 		if(PORTC & 0x10)
	BTFSS      PORTC+0, 4
	GOTO       L_entercoins49
;MyProject.c,316 :: 		bal=bal+5;
	MOVLW      5
	ADDWF      _bal+0, 1
	BTFSC      STATUS+0, 0
	INCF       _bal+1, 1
;MyProject.c,317 :: 		MSdelay(1000);
	MOVLW      232
	MOVWF      FARG_MSdelay_val+0
	MOVLW      3
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,318 :: 		WordToStr(bal,balval);
	MOVF       _bal+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _bal+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _balval+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;MyProject.c,320 :: 		LCD_String_xy(2,3,balval);
	MOVLW      2
	MOVWF      FARG_LCD_String_xy_row+0
	MOVLW      3
	MOVWF      FARG_LCD_String_xy_pos+0
	MOVLW      _balval+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,321 :: 		LCD_String_xy(2,10,"fils");
	MOVLW      2
	MOVWF      FARG_LCD_String_xy_row+0
	MOVLW      10
	MOVWF      FARG_LCD_String_xy_pos+0
	MOVLW      ?lstr6_MyProject+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,322 :: 		LCD_String_xy(1,13,":");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy_row+0
	MOVLW      13
	MOVWF      FARG_LCD_String_xy_pos+0
	MOVLW      ?lstr7_MyProject+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,325 :: 		MSdelay(1000);
	MOVLW      232
	MOVWF      FARG_MSdelay_val+0
	MOVLW      3
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,326 :: 		}
L_entercoins49:
;MyProject.c,328 :: 		if(PORTC & 0x20)
	BTFSS      PORTC+0, 5
	GOTO       L_entercoins50
;MyProject.c,330 :: 		MSdelay(1000);
	MOVLW      232
	MOVWF      FARG_MSdelay_val+0
	MOVLW      3
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,331 :: 		bal=bal+50;
	MOVLW      50
	ADDWF      _bal+0, 0
	MOVWF      R0+0
	MOVF       _bal+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _bal+0
	MOVF       R0+1, 0
	MOVWF      _bal+1
;MyProject.c,332 :: 		WordToStr(bal,balval);
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _balval+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;MyProject.c,334 :: 		LCD_String_xy(2,3,balval);
	MOVLW      2
	MOVWF      FARG_LCD_String_xy_row+0
	MOVLW      3
	MOVWF      FARG_LCD_String_xy_pos+0
	MOVLW      _balval+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,335 :: 		LCD_String_xy(2,10,"fils");
	MOVLW      2
	MOVWF      FARG_LCD_String_xy_row+0
	MOVLW      10
	MOVWF      FARG_LCD_String_xy_pos+0
	MOVLW      ?lstr8_MyProject+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,336 :: 		LCD_String_xy(1,13,":");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy_row+0
	MOVLW      13
	MOVWF      FARG_LCD_String_xy_pos+0
	MOVLW      ?lstr9_MyProject+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,338 :: 		MSdelay(1000);
	MOVLW      232
	MOVWF      FARG_MSdelay_val+0
	MOVLW      3
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,339 :: 		}
L_entercoins50:
;MyProject.c,342 :: 		if (PORTC & 0x40)
	BTFSS      PORTC+0, 6
	GOTO       L_entercoins51
;MyProject.c,344 :: 		MSdelay(1000);
	MOVLW      232
	MOVWF      FARG_MSdelay_val+0
	MOVLW      3
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,345 :: 		bal=bal+25;
	MOVLW      25
	ADDWF      _bal+0, 0
	MOVWF      R0+0
	MOVF       _bal+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _bal+0
	MOVF       R0+1, 0
	MOVWF      _bal+1
;MyProject.c,346 :: 		WordToStr(bal,balval);
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _balval+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;MyProject.c,348 :: 		LCD_String_xy(2,3,balval);
	MOVLW      2
	MOVWF      FARG_LCD_String_xy_row+0
	MOVLW      3
	MOVWF      FARG_LCD_String_xy_pos+0
	MOVLW      _balval+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,349 :: 		LCD_String_xy(2,10,"fils");
	MOVLW      2
	MOVWF      FARG_LCD_String_xy_row+0
	MOVLW      10
	MOVWF      FARG_LCD_String_xy_pos+0
	MOVLW      ?lstr10_MyProject+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,350 :: 		LCD_String_xy(1,13,":");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy_row+0
	MOVLW      13
	MOVWF      FARG_LCD_String_xy_pos+0
	MOVLW      ?lstr11_MyProject+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,352 :: 		MSdelay(1000);
	MOVLW      232
	MOVWF      FARG_MSdelay_val+0
	MOVLW      3
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,353 :: 		}
L_entercoins51:
;MyProject.c,356 :: 		if(PORTC & 0x80)
	BTFSS      PORTC+0, 7
	GOTO       L_entercoins52
;MyProject.c,358 :: 		MSdelay(1000);
	MOVLW      232
	MOVWF      FARG_MSdelay_val+0
	MOVLW      3
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,359 :: 		bal=bal+10;
	MOVLW      10
	ADDWF      _bal+0, 0
	MOVWF      R0+0
	MOVF       _bal+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _bal+0
	MOVF       R0+1, 0
	MOVWF      _bal+1
;MyProject.c,360 :: 		WordToStr(bal,balval);
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _balval+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;MyProject.c,362 :: 		LCD_String_xy(2,3,balval);
	MOVLW      2
	MOVWF      FARG_LCD_String_xy_row+0
	MOVLW      3
	MOVWF      FARG_LCD_String_xy_pos+0
	MOVLW      _balval+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,363 :: 		LCD_String_xy(2,10,"fils");
	MOVLW      2
	MOVWF      FARG_LCD_String_xy_row+0
	MOVLW      10
	MOVWF      FARG_LCD_String_xy_pos+0
	MOVLW      ?lstr12_MyProject+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,364 :: 		LCD_String_xy(1,13,":");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy_row+0
	MOVLW      13
	MOVWF      FARG_LCD_String_xy_pos+0
	MOVLW      ?lstr13_MyProject+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,366 :: 		MSdelay(1000);
	MOVLW      232
	MOVWF      FARG_MSdelay_val+0
	MOVLW      3
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,367 :: 		}
L_entercoins52:
;MyProject.c,370 :: 		}
L_end_entercoins:
	RETURN
; end of _entercoins

_setPassword:

;MyProject.c,375 :: 		void setPassword()
;MyProject.c,377 :: 		LCD_String_xy(1,0,"Enter pass:");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy_row+0
	CLRF       FARG_LCD_String_xy_pos+0
	MOVLW      ?lstr14_MyProject+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,378 :: 		index = 0;
	CLRF       _index+0
	CLRF       _index+1
;MyProject.c,380 :: 		while (index < PASSWORD_LENGTH)
L_setPassword53:
	MOVLW      128
	XORWF      _index+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setPassword122
	MOVLW      4
	SUBWF      _index+0, 0
L__setPassword122:
	BTFSC      STATUS+0, 0
	GOTO       L_setPassword54
;MyProject.c,382 :: 		kp = key();
	CALL       _key+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;MyProject.c,383 :: 		pass[index] = kp;
	MOVF       _index+0, 0
	ADDLW      _pass+0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;MyProject.c,384 :: 		LCD_String_xy(2,index,"*");
	MOVLW      2
	MOVWF      FARG_LCD_String_xy_row+0
	MOVF       _index+0, 0
	MOVWF      FARG_LCD_String_xy_pos+0
	MOVLW      ?lstr15_MyProject+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,385 :: 		index++;
	INCF       _index+0, 1
	BTFSC      STATUS+0, 2
	INCF       _index+1, 1
;MyProject.c,386 :: 		MSdelay(500);
	MOVLW      244
	MOVWF      FARG_MSdelay_val+0
	MOVLW      1
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,387 :: 		}
	GOTO       L_setPassword53
L_setPassword54:
;MyProject.c,389 :: 		LCD_Clear();
	CALL       _LCD_Clear+0
;MyProject.c,390 :: 		LCD_String_xy(1,0,"Password set.");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy_row+0
	CLRF       FARG_LCD_String_xy_pos+0
	MOVLW      ?lstr16_MyProject+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,391 :: 		MSdelay(1000);
	MOVLW      232
	MOVWF      FARG_MSdelay_val+0
	MOVLW      3
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,392 :: 		LCD_Clear();
	CALL       _LCD_Clear+0
;MyProject.c,393 :: 		}
L_end_setPassword:
	RETURN
; end of _setPassword

_checkpass:

;MyProject.c,400 :: 		void checkpass()
;MyProject.c,403 :: 		while (attempts < 3) // Keep looping until three attempts are made
L_checkpass55:
	MOVLW      3
	SUBWF      _attempts+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_checkpass56
;MyProject.c,405 :: 		LCD_Clear();
	CALL       _LCD_Clear+0
;MyProject.c,406 :: 		LCD_String_xy(1, 0, "enter pass");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy_row+0
	CLRF       FARG_LCD_String_xy_pos+0
	MOVLW      ?lstr17_MyProject+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,407 :: 		MSdelay(1000);
	MOVLW      232
	MOVWF      FARG_MSdelay_val+0
	MOVLW      3
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,408 :: 		index = 0;
	CLRF       _index+0
	CLRF       _index+1
;MyProject.c,410 :: 		while (index < PASSWORD_LENGTH)
L_checkpass57:
	MOVLW      128
	XORWF      _index+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkpass124
	MOVLW      4
	SUBWF      _index+0, 0
L__checkpass124:
	BTFSC      STATUS+0, 0
	GOTO       L_checkpass58
;MyProject.c,412 :: 		kp = key();
	CALL       _key+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;MyProject.c,413 :: 		inputpass[index] = kp;
	MOVF       _index+0, 0
	ADDLW      _inputpass+0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;MyProject.c,414 :: 		LCD_String_xy(2, index, "*");
	MOVLW      2
	MOVWF      FARG_LCD_String_xy_row+0
	MOVF       _index+0, 0
	MOVWF      FARG_LCD_String_xy_pos+0
	MOVLW      ?lstr18_MyProject+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,415 :: 		index++;
	INCF       _index+0, 1
	BTFSC      STATUS+0, 2
	INCF       _index+1, 1
;MyProject.c,416 :: 		MSdelay(500);
	MOVLW      244
	MOVWF      FARG_MSdelay_val+0
	MOVLW      1
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,417 :: 		}
	GOTO       L_checkpass57
L_checkpass58:
;MyProject.c,419 :: 		LCD_Clear();
	CALL       _LCD_Clear+0
;MyProject.c,420 :: 		LCD_String_xy(1, 0, "checking..");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy_row+0
	CLRF       FARG_LCD_String_xy_pos+0
	MOVLW      ?lstr19_MyProject+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,421 :: 		MSdelay(1000);
	MOVLW      232
	MOVWF      FARG_MSdelay_val+0
	MOVLW      3
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,422 :: 		LCD_Clear();
	CALL       _LCD_Clear+0
;MyProject.c,426 :: 		for (index = 0; index < PASSWORD_LENGTH; index++)
	CLRF       _index+0
	CLRF       _index+1
L_checkpass59:
	MOVLW      128
	XORWF      _index+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkpass125
	MOVLW      4
	SUBWF      _index+0, 0
L__checkpass125:
	BTFSC      STATUS+0, 0
	GOTO       L_checkpass60
;MyProject.c,428 :: 		if (inputpass[index] != pass[index])
	MOVF       _index+0, 0
	ADDLW      _inputpass+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	MOVF       _index+0, 0
	ADDLW      _pass+0
	MOVWF      FSR
	MOVF       R1+0, 0
	XORWF      INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_checkpass62
;MyProject.c,430 :: 		match = 0; // Set match to 0 if any characters don't match
	CLRF       _match+0
	CLRF       _match+1
;MyProject.c,431 :: 		break; // Exit the loop, no need to continue checking
	GOTO       L_checkpass60
;MyProject.c,432 :: 		}
L_checkpass62:
;MyProject.c,426 :: 		for (index = 0; index < PASSWORD_LENGTH; index++)
	INCF       _index+0, 1
	BTFSC      STATUS+0, 2
	INCF       _index+1, 1
;MyProject.c,433 :: 		}
	GOTO       L_checkpass59
L_checkpass60:
;MyProject.c,435 :: 		if (match == 1)
	MOVLW      0
	XORWF      _match+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkpass126
	MOVLW      1
	XORWF      _match+0, 0
L__checkpass126:
	BTFSS      STATUS+0, 2
	GOTO       L_checkpass63
;MyProject.c,437 :: 		LCD_String_xy(1, 0, "CORRECT");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy_row+0
	CLRF       FARG_LCD_String_xy_pos+0
	MOVLW      ?lstr20_MyProject+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,442 :: 		break; // Exit the loop if the password is correct
	GOTO       L_checkpass56
;MyProject.c,443 :: 		}
L_checkpass63:
;MyProject.c,446 :: 		attempts++; // Increase the count of incorrect password attempts
	INCF       _attempts+0, 1
;MyProject.c,448 :: 		if (attempts == 3)
	MOVF       _attempts+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_checkpass65
;MyProject.c,450 :: 		LCD_String_xy(1, 0, "MAX ATTEMPTS");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy_row+0
	CLRF       FARG_LCD_String_xy_pos+0
	MOVLW      ?lstr21_MyProject+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,453 :: 		PORTC=PORTC | 0x01;
	BSF        PORTC+0, 0
;MyProject.c,454 :: 		MSdelay(5000);
	MOVLW      136
	MOVWF      FARG_MSdelay_val+0
	MOVLW      19
	MOVWF      FARG_MSdelay_val+1
	CALL       _MSdelay+0
;MyProject.c,456 :: 		break; // Exit the loop if maximum attempts reached
	GOTO       L_checkpass56
;MyProject.c,457 :: 		}
L_checkpass65:
;MyProject.c,460 :: 		LCD_String_xy(1, 0, "INCORRECT");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy_row+0
	CLRF       FARG_LCD_String_xy_pos+0
	MOVLW      ?lstr22_MyProject+0
	MOVWF      FARG_LCD_String_xy_str+0
	CALL       _LCD_String_xy+0
;MyProject.c,464 :: 		}
	GOTO       L_checkpass55
L_checkpass56:
;MyProject.c,465 :: 		}
L_end_checkpass:
	RETURN
; end of _checkpass

_MSdelay:

;MyProject.c,471 :: 		void MSdelay(unsigned int val)
;MyProject.c,473 :: 		for(i=0;i<val;i++)
	CLRF       _i+0
	CLRF       _i+1
L_MSdelay67:
	MOVF       FARG_MSdelay_val+1, 0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__MSdelay128
	MOVF       FARG_MSdelay_val+0, 0
	SUBWF      _i+0, 0
L__MSdelay128:
	BTFSC      STATUS+0, 0
	GOTO       L_MSdelay68
;MyProject.c,474 :: 		for(j=0;j<165;j++);  /*This count Provide delay of 1 ms for 8MHz Frequency */
	CLRF       _j+0
	CLRF       _j+1
L_MSdelay70:
	MOVLW      0
	SUBWF      _j+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__MSdelay129
	MOVLW      165
	SUBWF      _j+0, 0
L__MSdelay129:
	BTFSC      STATUS+0, 0
	GOTO       L_MSdelay71
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
	GOTO       L_MSdelay70
L_MSdelay71:
;MyProject.c,473 :: 		for(i=0;i<val;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,474 :: 		for(j=0;j<165;j++);  /*This count Provide delay of 1 ms for 8MHz Frequency */
	GOTO       L_MSdelay67
L_MSdelay68:
;MyProject.c,475 :: 		}
L_end_MSdelay:
	RETURN
; end of _MSdelay

_pwm_init:

;MyProject.c,480 :: 		void pwm_init() {
;MyProject.c,481 :: 		TRISC = TRISC & 0xF9;      // Set RC2 pin as output
	MOVLW      249
	ANDWF      TRISC+0, 1
;MyProject.c,484 :: 		CCP1CON = 0x0C;
	MOVLW      12
	MOVWF      CCP1CON+0
;MyProject.c,486 :: 		CCP2CON = 0x0C;
	MOVLW      12
	MOVWF      CCP2CON+0
;MyProject.c,488 :: 		T2CON = T2CON | 0x07;
	MOVLW      7
	IORWF      T2CON+0, 1
;MyProject.c,490 :: 		PR2 = 249; // Set period register for 50Hz frequency
	MOVLW      249
	MOVWF      PR2+0
;MyProject.c,491 :: 		}
L_end_pwm_init:
	RETURN
; end of _pwm_init

_Delay_us:

;MyProject.c,493 :: 		void Delay_us(unsigned int microseconds) {
;MyProject.c,496 :: 		while (microseconds--) {
L_Delay_us73:
	MOVF       FARG_Delay_us_microseconds+0, 0
	MOVWF      R0+0
	MOVF       FARG_Delay_us_microseconds+1, 0
	MOVWF      R0+1
	MOVLW      1
	SUBWF      FARG_Delay_us_microseconds+0, 1
	BTFSS      STATUS+0, 0
	DECF       FARG_Delay_us_microseconds+1, 1
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Delay_us74
;MyProject.c,497 :: 		for (i = 0; i < 12; i++) {
	CLRF       R2+0
	CLRF       R2+1
L_Delay_us75:
	MOVLW      0
	SUBWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Delay_us132
	MOVLW      12
	SUBWF      R2+0, 0
L__Delay_us132:
	BTFSC      STATUS+0, 0
	GOTO       L_Delay_us76
;MyProject.c,498 :: 		asm nop;
	NOP
;MyProject.c,497 :: 		for (i = 0; i < 12; i++) {
	INCF       R2+0, 1
	BTFSC      STATUS+0, 2
	INCF       R2+1, 1
;MyProject.c,499 :: 		}
	GOTO       L_Delay_us75
L_Delay_us76:
;MyProject.c,500 :: 		}
	GOTO       L_Delay_us73
L_Delay_us74:
;MyProject.c,501 :: 		}
L_end_Delay_us:
	RETURN
; end of _Delay_us

_Delay_ms:

;MyProject.c,503 :: 		void Delay_ms(unsigned int milliseconds) {
;MyProject.c,506 :: 		while (milliseconds--) {
L_Delay_ms78:
	MOVF       FARG_Delay_ms_milliseconds+0, 0
	MOVWF      R0+0
	MOVF       FARG_Delay_ms_milliseconds+1, 0
	MOVWF      R0+1
	MOVLW      1
	SUBWF      FARG_Delay_ms_milliseconds+0, 1
	BTFSS      STATUS+0, 0
	DECF       FARG_Delay_ms_milliseconds+1, 1
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Delay_ms79
;MyProject.c,507 :: 		for (i = 0; i < 238; i++) {
	CLRF       R2+0
	CLRF       R2+1
L_Delay_ms80:
	MOVLW      0
	SUBWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Delay_ms134
	MOVLW      238
	SUBWF      R2+0, 0
L__Delay_ms134:
	BTFSC      STATUS+0, 0
	GOTO       L_Delay_ms81
;MyProject.c,508 :: 		Delay_us(1000);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Delay_ms83:
	DECFSZ     R13+0, 1
	GOTO       L_Delay_ms83
	DECFSZ     R12+0, 1
	GOTO       L_Delay_ms83
	NOP
	NOP
;MyProject.c,507 :: 		for (i = 0; i < 238; i++) {
	INCF       R2+0, 1
	BTFSC      STATUS+0, 2
	INCF       R2+1, 1
;MyProject.c,509 :: 		}
	GOTO       L_Delay_ms80
L_Delay_ms81:
;MyProject.c,510 :: 		}
	GOTO       L_Delay_ms78
L_Delay_ms79:
;MyProject.c,511 :: 		}
L_end_Delay_ms:
	RETURN
; end of _Delay_ms

_set_servo_position:

;MyProject.c,513 :: 		void set_servo_position(int degrees) {
;MyProject.c,514 :: 		int pulse_width = (degrees + 90) * 8 + 500; // Calculate pulse width (500 to 2400)
	MOVLW      90
	ADDWF      FARG_set_servo_position_degrees+0, 0
	MOVWF      R3+0
	MOVF       FARG_set_servo_position_degrees+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R3+1
	MOVLW      3
	MOVWF      R2+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__set_servo_position136:
	BTFSC      STATUS+0, 2
	GOTO       L__set_servo_position137
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_servo_position136
L__set_servo_position137:
	MOVLW      244
	ADDWF      R0+0, 0
	MOVWF      R3+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDLW      1
	MOVWF      R3+1
;MyProject.c,515 :: 		CCPR1L = pulse_width >> 2; // Set CCPR1L register
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      CCPR1L+0
;MyProject.c,516 :: 		CCP1CON = (CCP1CON & 0xCF) | ((pulse_width & 0x03) << 4); // Set CCP1CON register
	MOVLW      207
	ANDWF      CCP1CON+0, 0
	MOVWF      R5+0
	MOVLW      3
	ANDWF      R3+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	IORWF      R5+0, 0
	MOVWF      CCP1CON+0
;MyProject.c,517 :: 		Delay_ms(50*4); // Delay for the servo to reach the desired position
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_set_servo_position84:
	DECFSZ     R13+0, 1
	GOTO       L_set_servo_position84
	DECFSZ     R12+0, 1
	GOTO       L_set_servo_position84
	DECFSZ     R11+0, 1
	GOTO       L_set_servo_position84
;MyProject.c,518 :: 		}
L_end_set_servo_position:
	RETURN
; end of _set_servo_position
