# kph.s
# Author: Hugo Trinidad
# An assembly program to convert from Miles to Kiloneters per hour
# Date: 07/25/2022

.global main

.text

main:
# Save return to os on stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

# Prompt for an input in miles
	LDR r0, =promptMiles
	BL  printf

# Scanf miles
	LDR r0, =input1
	SUB sp, sp, #4
	MOV r1, sp
	BL  scanf
	LDR r0, [sp, #0]
	ADD sp, sp, #4
	MOV r4, r0

# Prompt for an input in hours
	LDR r0, =promptHours
	BL  printf

# Scanf hours
	LDR r0, =input1
	SUB sp, sp, #4
	MOV r1, sp
	BL scanf
	LDR r0, [sp, #0]
	ADD sp, sp, #4

# Convert
	MOV r1, r4
	BL  kph
	MOV r1, r0
	
# Print Kilometers
	LDR r0, =format1
	BL  printf

# Return to the OS
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	promptMiles: .asciz "Enter the number of miles: \n"
	promptHours: .asciz "Enter the number of hours: \n"
	format1: .asciz "\nThe object was moving at %d kph\n"
	input1: .asciz "%d"
	num1: .word 0
