# Ft2Inches.s
# An assembly program to calculate Feet to Inches
# Author: Hugo Trinidad
# Date: 07/25/2022
.global main
.text

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
	BL  Ft2Inches
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
	prompt1: .asciz "Enter the length in feet you want in inches: \n"
	format1: .asciz "\nThe length in inches is %d\n"
	input1: .asciz "%d"
	num1: .word 0
