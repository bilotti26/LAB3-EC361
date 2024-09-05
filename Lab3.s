; NAMES: Andrew Bilotti, Josh Wynn
; TEAM NAME: Team Skibidi Toilet

		AREA mycode, CODE, READONLY
		EXPORT __main
		ALIGN
		ENTRY
__main	PROC
		; Enable GPIO Clock (Power on) DO NOT CHANGE
		movw r1, #0x104C
		movt r1, #0x4002
		ldr r0, [r1]
		orr r0, #4
		str r0, [r1]
		; DO NOT CHANGE CODE ABOVE THIS LINE

		; Configure pins PC0-PC3 and PC8-PC11 as outputs
		
		LDR R1, =0x48000800 ; Load 32-bit GPIOC addr into R1
		
		LDR R0, =0x00550055 ; Put bitmap for MODER with pins PC0-PC3 and PC8-PC11 as output (01, 2 bits per pin) into R0
		STR R0, [R1]     ; Store bitmap into address for GPIOC_MODER
		
		; Start our code for LAB3
		
		; TODO: Output number N (in R0) to LEDs
		; Extract the bits of the 8-bit number and organize them such that they can be used with the selected GPIO pins on the board
		
		MOV r0, #0xAA ; r0 = N
		; 0000 0000 0000 0000 0000 0000 XXXX XXXX
		; SHIFT TO left4:     0000 XXXX 0000 XXXX
		; 0000 0000 0000 0000 0000 XXXX XXXX 0000
		;						      8
		;						   \--/ width 4
		;shift 4 to left
		LSL R2, R0, #4
		;                    0000 XXXX DCDC 0000
		ORR R2, R0
		;                    0000 XXXX DCDC XXXX
		
		STR R2, [R1, #0x14]
		
		
		; Your code goes above this line
here	b		here ; This line is an infinite loop
		ENDP
		END