# Program name: Final.s
# Program purpose: loop until -1 is entered. Count all numbers entered, add them and calculate the average
# Author: Hugo Trinidad
# Date: 08/23/2022

.text
.global main

main:
	# Push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]
	
	# prompt user for a value
	LDR r0, =prompt
	BL printf

	# Scanf value
	LDR r0, =input
	LDR r1, =num
	BL scanf
	LDR r1, =num
	LDR r1, [r1, #0]
	MOV r4, r1

	MOV r5, #0 //Register used to count how many numbers were entered
	MOV r6, #0 //Sum of all values entered

	StartSentinelLoop:
		MOV r0, #-1
		CMP r4, r0
		BEQ EndSentinelLoop
		ADD r5, r5, #1 //Counter
		ADD r6, r6, r4
		
	NextValue:
		# Get Next value
		LDR r0, =prompt
		BL printf
		LDR r0, =input
		LDR r1, =num
		BL scanf
		LDR r1, =num
		LDR r1, [r1, #0]
		MOV r4, r1

		B StartSentinelLoop

	EndSentinelLoop:

		CMP r5, #0
		BEQ End //If a number was not entered we don't print and end the program

		MOV r1, r5
		LDR r0, =counter
		BL printf

		MOV r1, r6
		LDR r0, =sum
		BL printf

		MOV r0, r6
		MOV r1, r5

		BL __aeabi_idiv	
		MOV r1, r0
		LDR r0, =average
		BL printf

	End:
		# Pop the stack
		LDR lr, [sp, #0]
		ADD sp, sp, #4
		MOV pc, lr
# End Main

.data
	prompt: .asciz "Please a number (-1 to end) \n"
	counter: .asciz "Numbers entered %d \n"
	sum: .asciz "Sum %d \n"
	average: .asciz "Average %d \n"
	input: .asciz "%d"
	num: .word 0
