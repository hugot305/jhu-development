#
# Program Name: Two complement
# Author: Hugo Trinidad
# Date: 06/29/2022
# Purpose: Calculate two complement
# Input: 
#	- input: User entered number
# Output:
#	- format: Prints a negative number

.text
.global main

main:
	# Push the stack
	sub sp, sp, #4
	str lr, [sp, #0]
	
	# Prompt the user for input
	ldr r0, =prompt
	BL printf

	# Read user input
	ldr r0, =input
	ldr r1, =num
	BL scanf

	# Calculating two complement
	ldr r1, =num
	ldr r1, [r1, #0]
	mvn r1, r1
	add r1, r1, #1	
	
	# Printing two complement
	ldr r0, =output
	BL printf

	# Pop the stack
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

.data
	# Allocate space for a word-aligned 4-byte value in the memory
	num: .word 0
	# Prompt the user to enter a number
	prompt: .asciz "Enter a number\n"
	# Format of the user input
	input: .asciz "%d"
	# Format for the output
	output: .asciz "The two complement value is %d \n"
