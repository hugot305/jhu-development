# Program name: LargestNumber.s
# Purpose: Compares 3 numbers and return the larges
# Author: Hugo Trinidad
# Date: 07/30/2022
# Input:
#	- input: the user to enter 3 values
# Output:
#	- format: prints the largest value

.text
.global main

main:
	# Push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	# Prompt for the first value
	LDR r0, =promptFirstValue
	BL  printf
	
	# Scanf first value
	LDR r0, =input
	LDR r1, =value
	BL  scanf
	LDR r1, =value
	LDR r1, [r1, #0]
	MOV r4, r1

	# Prompt for the second value
	LDR r0, =promptSecondValue
	BL  printf

	# Scanf second value
	LDR r0, =input
	LDR r1, =value
	BL  scanf
	LDR r1, =value
	LDR r1, [r1, #0]
	MOV r5, r1
	
	# Prompt for 3rd value
	LDR r0, =promptThirdValue
	BL  printf

	# Scanf for the third value
	LDR r0, =input
	LDR r1, =value
	BL scanf
	LDR r1, =value
	LDR r1, [r1, #0]
	MOV r6, r1

	# Calling findMAxOf3 function
	MOV r0, r4
	MOV r1, r5
	MOV r2, r6

	BL  findMaxOf3

	# Printing the output
	MOV r1, r0
	LDR r0, =output
	BL printf

	# Pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp , #4
	MOV PC, lr

.data
	# Allocates space for a word-aligned 4 bite values in the memory
	value: .word 0
	# Prompt the user for the values
	promptFirstValue: .asciz "Enter the first value:\n"
	promptSecondValue: .asciz "Enter the second value:\n"
	promptThirdValue: .asciz "Enter the third value:\n"
	# Format the user input
	input: .asciz "%d"
	# Format the output
	output: .asciz "The largest value is %d\n"


