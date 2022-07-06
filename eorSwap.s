#
# Program Name: eorSwap
# Author: Hugo Trinidad
# Date: 06/28/2022
# Purpose: Swap two registers using eor
# Input:
#	- input: User enters 2 numbers
# Output:
#	- format: Prints the numbers swapped

.text
.global main

main:
	# Push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	# Prompt for an input for X
	LDR r0, =prompt1
	BL  printf

	# Scanf X
	LDR r0, =input
	LDR r1, =x
	BL scanf

	# Moving first value entered by the user  to another register
	MOV r4, r12

	# Prompt for an input for Y
	LDR r0, =prompt2
	BL printf

	# Scanf Y
	LDR r0, =input
	LDR r1, =y
	BL scanf

	# loading user input
	LDR r1, =x
	LDR r1, [r1, #0]
	LDR r2, =y
	LDR r2, [r2, #0]

	# Swaping the values
	EOR r1, r1, r2
	EOR r2, r1, r2
	EOR r1, r1, r2
	
	# Prining the swapped values
	LDR r0, =output
	BL printf

	# Pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV PC, lr

.data
	# Allocates space for a word-aligned 4 bite value in the memory
	x: .word 0
	y: .word 0
	# Propmt the user for values
	prompt1: .asciz "Enter the value for X:\n"
	prompt2: .asciz "Enter the value for Y:\n"
	# Format the user input
	input: .asciz "%d"
	# Format to print the output
	output: .asciz "The new value of X is %d, the new value of Y is %d\n"
