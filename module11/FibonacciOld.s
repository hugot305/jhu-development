# Program name: Fibonacci.s
# Purpose: Calculate teh fibonacci sequence
# Author: Hugo Trinidad
# Date: 08/05/2022

.text
.global main

main:
	# push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	# Prompting the user 
	LDR r0, =prompt1
	BL printf

	# Scanf length value
	LDR r0, =format
	LDR r1, =number
	BL scanf

	# Printing the first term
	LDR r0, =output
	MOV r1, #0
	BL printf

	MOV r0, #0 // Sum
	LDR r1, =number
	LDR r1, [r1, #0]
	MOV r2, #0 // First value in the sequence
	MOV r3, #1 // Seconde value in the sequence
	MOV r4, #0 // i = 0



	BL Fib

	MOV r1, r0
	LDR r0, =output
	BL printf

	# pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt1: .asciz "Please enter the fibonacci sequence length\n"
	output: .asciz "%d "
	format: .asciz "%d"
	number: .word 0
# END main

.text
Fib:
	ADD r4, r4, #1
	CMP r1, r4
	BLE Return
	MOV r5, r0
	ADD r0, r2, r3

	MOV r6, r0
	MOV r7, r1
	MOV r1, r0

	LDR r0, =output
	BL printf

	MOV r0, r6
	MOV r1, r7

	MOV r2, r0
	MOV r3, r5
	BL Fib
.text
Return:
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
	
	
