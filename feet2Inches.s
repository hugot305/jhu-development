#
# Program Name: feet2Inches
# Author: Hugo Trinidad
# Date: 06/28/2022
# Purpose: Convert feet to inches
# Input: 
#	- input: User entered numbers
# Output: 
#	- format: print the number of inches

.text
.global main

main:
	# Push stack
	SUB sp, sp, #4
	STR lr, [sp, #0]
	
	# Prompt the user to input the feet
	LDR r0, =promptFeet
	BL printf

	# Scanf for feet
	LDR r0, =input
	LDR r1, =feet
	BL scanf

	# Prompt user to input the inches
	LDR r0, =promptInches
	BL printf

	# Scanf for inches
	LDR r0, =input
	LDR r1, =inches
	BL scanf
	
	# Converting feet to inches
	LDR r1, =feet
	LDR r1, [r1, #0]
	LDR r2, =inches
	LDR r2, [r2, #0]
	MOV r3, #12
	MUL r1, r1, r3
	ADD r1, r1, r2

	# Printing the number of inches
	LDR r0, =output
	BL printf
	
	# Pop stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	# Allocates space for a word-alined 4-byte value in the memory
	feet: .word 0
	inches: .word 0
	# Prompt the user to enter the values
	promptFeet: .asciz "Enter the feet\n"
	promptInches: .asciz "Enter the inches\n"
	# Format the user input
	input: .asciz "%d"
	# Format to print the result
	output: .asciz "The total number of inches is %d\n"
