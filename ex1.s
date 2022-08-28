;For Example: Your Name, Student Number, what the program is for, and what it does 

	;;; Directives
	 PRESERVE8
	 THUMB 
	; Vector Table Mapped to Address 0 at Reset
	; Linker requires __Vectors to be exported
	 AREA RESET, DATA, READONLY
	 EXPORT __Vectors
__Vectors 
	 DCD 0x20001000 ; stack pointer value when stack is empty
	 DCD Reset_Handler ; reset vector
	 
	 ALIGN
	 
	;Your Data section
	;AREA DATA
SUM DCD 0
SUMP DCD SUM
N DCD 7
NUM DCD 3, -7, 2, -2, 10, 20, 30
POINTER DCD NUM
	; The program
	; Linker requires Reset_Handler
	 AREA MYCODE, CODE, READONLY
 ENTRY
	 EXPORT Reset_Handler
Reset_Handler

; Please complete the program to add up all the
; numbers in the array NUM1 that are greater than 5.
; Put the sum in the register R0.
    LDR R1, N ; load size of array -
; a counter for how many elements are left to process
    LDR R2, POINTER ; load base pointer of array
    MOV R0, #0 ; initialize 
	MOV R5, #5 ; initialize 
LOOP
    LDR R3, [R2], #4
	CMP R3,R5
	blt SKIP 
	ADD R0,R0,R3
SKIP
    SUBS R1,R1,#1
	BGT LOOP
    LDR R4,SUMP
	STR R0,[R4]
	LDR R6,[R4]
	
STOP
	B STOP
	
	END ; End of the program







