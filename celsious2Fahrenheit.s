#
# Program name: celsius2Fahrenheit
# Author: Hugo Trinidad
# Date: 06/29/2022
# Purpose: Convert from Celsius to Fahrenheit
# Input:
#	- input: User entered Celsius value
# Output:
#	- output: Prints the conversion from Celsius to Fahrenheit
#

.text
.global main

main:
	# Push the stack
	sub sp, sp, #4
	str lr, [sp, #0]
	
	# Prompt the user a value
	ldr r0, =prompt
	BL printf

	# Reading the user input
	ldr r0, =input
	ldr r1, =celsius
	BL scanf

	# Converting from Celsius to Fahrenheit
	ldr r1, =celsius
	ldr r1, [r1, #0]
	mov r9, #9
	mul r0, r1, r9
	mov r1, #5
	BL __aeabi_idiv
	add r1, r0, #32

	# Printing calculated value
	ldr r0, =output
 	BL printf
	
	# Pop the stack
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

.data
	# Allocate spcae for a word-alined 4 byte value in the memory
	celsius: .word 0
	# Prompt the user for a value
	prompt: .asciz "Enter a value in Celsius\n"
	# Format of the user input
	input: .asciz "%d"
	# Format to print the converted value
	output: .asciz "The Fahrenheit value is %d\n"
