# F2C.s
# An assembly program to convert from Farenheit to Celcius
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
	BL  F2C
	MOV r1, r0
	
# Print inches
	LDR r0, =format1
	BL  printf

# Return to the OS
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt1: .asciz "Enter the temp in F: \n"
	format1: .asciz "\nThe temp in C is %d\n"
	input1: .asciz "%d"
	num1: .word 0
