#
# Program name: fahrenheit2Celsius
# Author: Hugo Trinidad
# Date: 06/29/2022
# Purpose: Convert a Fahrenheit value to Celsius
# Input:
# 	- input: User Fahrenheit value entered
# Output:
#	- output: Calculated celsius value
#

.text
.global main

main:
	# Push the stack
	sub sp, sp, #4
	str lr, [sp, #0]
	
	# Prompt the user for a value
	ldr r0, =prompt
	BL printf

	# Reading user input
	ldr r0, =input
	ldr r1, =fahrenheit
	BL scanf

	# Converting Fahrenheit value to Celsius
	ldr r1, =fahrenheit
	ldr r1, [r1, #0]
	sub r1, r1, #32
	mov r2, #5
	mul r0, r1, r2
	mov r1, #9
	BL __aeabi_idiv
	mov r1, r0

	# Printing the result
	ldr r0, =output
	BL printf
	
	# Pop the stack
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

.data
	# Allocates space for a word-aligned 4-byte value in the memory
	fahrenheit: .word 0
	# Prompt the user to enter a Fahrenheit value
	prompt: .asciz "Enter a value in Fahrenheit\n"
	# Format the user input
	input: .asciz "%d"
	# Format to print the calculated value
	output: .asciz "The temperature in Celsius is %d\n"
