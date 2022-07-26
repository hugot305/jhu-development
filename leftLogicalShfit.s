#
# Program Name: leftLogicalShift.s
# Author: Hugo Trinidad
# Date: 06/28/2022
# Purpose: Multiply a given number by 10 using left logical shift
# Input:
# 	- input: user entered value
# output: 
#	- format: prints the number multiplied by 10

.text
.global main

main:
	# Push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	# Prompt the user for a number
	LDR r0, =prompt
	BL printf

	# Scanf
	LDR r0, =input
	LDR r1, =num
	BL scanf

	# Left shift logicali
	LDR r1, =num
	LDR r1, [r1, #0]
	LSL r3, r1, #1
	LSL r4, r1, #3

	# Adding one time the original value
	ADD r1, r3, r4

	# Printing the result
	LDR r0, =format
	BL printf

	# Pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data
	# Allocates space for a word-alined 4-bytes value in the memory
	num: .word 0
	# Prompt the user for a number
	prompt: .asciz "Enter a number\n"
	# Format of the user input
	input: .asciz "%d"
	# Output
	format: .asciz "The result is %d \n"
