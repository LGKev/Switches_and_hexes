	.text
	.equ	LEDs,			0xFF200000
	.equ	SWITCHES,		0xFF200040
	.equ 	HEX_DISPLAY,	0XFF200020
	.global _start
_start:
	movia	r2, LEDs		# Address of LEDs         
	movia	r3, SWITCHES	# Address of switches
	movia 	r5, HEX_DISPLAY	# Address of the 0th hex display.
	movi 	r21, 1
	movi 	r22, 2
	movi 	r23, 3




LOOP:
	ldwio	r4, 0(r3)		# Read the state of switches
	#//need to parse the value from the switch
	beq 	r4, r0, L_Zero 	# Compare the swtich value to r6, the value of 0, if true go to L_Zero
	beq 	r4, r21, L_One 	# Compare the swtich value to r6, the value of 0, if true go to L_Zero
	beq 	r4, r22, L_Two 	# Compare the swtich value to r6, the value of 0, if true go to L_Zero
	#//stwio 	r4, 0(r5)		# put the binary value and put into r5. 	
	br		LOOP

L_Zero: 
	movia r10, 0b0011111
	stwio 	r10, 0(r5) 		#move the display pattern to register 10, load to the hex.
	br LOOP					#start loop over

L_One:
	movia r10, 0b00000110
	stwio 	r10, 0(r5) 		#move the display pattern to register 10, load to the hex.
	br LOOP

L_Two:
	movia r10, 0b001011011
	stwio 	r10, 0(r5) 		#move the display pattern to register 10, load to the hex.
	br LOOP


	.end
