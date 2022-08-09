# Program Name: RecursiveMultiplication.s
# Purpose: Multiplication as addition using recursion
# Author: Hugo Trinidad
# Date: 08/04/2022

.text
.global main

main:
	# Push the stack
	SUB sp, sp, #4
	STR lr, [sp]

	# Prompt the user to enter a value
	LDR r0, =prompt1
	BL printf

	# Scanf first value
	LDR r0, =format
	LDR r1, =number1
	BL scanf

	# Prompt the user for a 2nd value
	LDR r0, =prompt2
	BL printf

	# scanf 2nd value
	LDR r0, =format
	LDR r1, =number2
	BL scanf

	# Call sum function
	LDR r0, =number1
	LDR r0, [r0]
	LDR r1, =number2
	LDR r1, [r1]
	BL Mult

	# Print result
	MOV r1, r0
	LDR r0, =output
	BL printf

	# Pop the stack
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt1: .asciz "\nEnter a value to multiply: "
	prompt2: .asciz "\nEnter a 2nd value: "
	output: .asciz "\nThe result is %d\n"
	format: .asciz "%d"
	number1: .word 0
	number2: .word 0

#End main

.text
Mult:
	SUB sp, sp, #12
	STR lr, [sp, #0]
	STR r4, [sp, #4]
	STR r5, [sp, #8]

	# Save arguments in r4, r5
	MOV r4, r0
	MOV r5, r1

	# if (n == 0) return m
	CMP r1, #0
	BNE Else
	MOV r0, #0
	B Return
	
	# else return n + Sum(n)
	Else:
		SUB r1, r1, #1
		BL Mult
		ADD r0, r0, r4
		B Return
	EndIf:

	Return:
	LDR lr, [sp, #0]
	LDR r4, [sp, #4]
	LDR r5, [sp, #8]
	ADD sp, sp, #12
	MOV pc, lr
