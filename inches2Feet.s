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
	
	# Prompt user to input the inches
	LDR r0, =promptInches
	BL printf

	# Scanf for inches
	LDR r0, =input
	LDR r1, =inches
	BL scanf
	LDR r1, =inches
	LDR r1, [r1, #0]

	# Moving the inches to another register
	MOV r3, r1
	
	# Converting inches to feet
	LDR r0, =inches
	LDR r0, [r0, #0]	
	MOV r1, #12
	BL __aeabi_idiv

	#reminder
	MUL r1, r0, r1
	LDR r3, =inches
	LDR r3, [r3, #0]
	SUB r2, r3, r1

	# Printing the number of feets and inches
	MOV r1, r0
	LDR r0, =output
	BL printf
	
	# Pop stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	# Allocates space for a word-alined 4-byte value in the memory
	inches: .word 0
	# Prompt the user to enter the values
	promptInches: .asciz "Enter the inches\n"
	# Format the user input
	input: .asciz "%d"
	# Format to print the result
	output: .asciz "The result is %d feet and %d inch(es)\n"
