# Program name: PrintPrimeNumbers.s
# Program Purpose: Printing all prime numbers given a number
# Author: Hugo Trinidad
# Date: 08/03/2022

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

	MOV r5, #3
	CMP r4, r8 //checking if the number entered is less than 3 end the program
	BLT PrintError

	StartCountingOuterLoop:
		CMP r5, r4
		BGT EndCountingOuterLoop
		# Checking for prime outer loop
		MOV r0, r5
		MOV r1, #2
		BL __aeabi_idiv
		MOV r6, r0
		
		# Counter loop
		MOV r7, #2

		StartCountingInnerLoop:
			# Loop block
			MOV r0, r5
			MOV r1, r7

			BL __aeabi_idiv
			#reminder
			MUL r1, r0, r7
			SUB r1, r5, r1

			CMP r1, #0
			BEQ NextValueOuterLoop

			# Next vaue for counting inner loop
			CMP r7, r6
			BGT EndCountingInnerLoop
			ADD r7, r7, #1 
			
			B StartCountingInnerLoop
		
		EndCountingInnerLoop:
			# If we get here it is because the number is prime
			LDR r0, =outputIsPrime
			MOV r1, r5
			BL printf
	NextValueOuterLoop:
		ADD r5, r5, #1
		B StartCountingOuterLoop

	PrintError:
		LDR r0, =error
		BL printf
		
	EndCountingOuterLoop:
		# Pop the stack
		LDR lr, [sp, #0]
		ADD sp, sp, #4
		MOV pc, lr
# End Main

.data
	prompt: .asciz "Please a number \n"
	error: .asciz "The number entered is invalid. Enter a number >= 3\n"
	outputIsPrime: .asciz "%d "
	input: .asciz "%d"
	num: .word 0
