# Inches2Feet.s
# An assembly program to convert inches to feet
# Author: Hugo Trinidad
# Date: 07/25/2022

.text
.global main

main:
# Save return to os on stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

# Prompt for an input in feet
	LDR r0, =prompt1
	BL  printf

# Scanf
	LDR r0, =input1
	SUB sp, sp, #4
	MOV r1, sp
	BL  scanf
	LDR r0, [sp, #0]
	ADD sp, sp, #4

# Convert
	BL  Inches2Feet
	MOV r2, r1
	MOV r1, r0
	
# Print inches
	LDR r0, =format1
	BL  printf

# Return to the OS
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt1: .asciz "Enter the length in inches: \n"
	format1: .asciz "\nThere are %d feet and %d inch(es)\n"
	input1: .asciz "%d"
	num1: .word 0
