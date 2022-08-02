.text
.global main

main:
	# push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	# Prompt the user for a value
	LDR r0, =prompt
	BL  printf

	# Read the value
	LDR r0, =input1
	LDR r1, =charInput
	BL scanf

	# Checking if value entered is a character
	# r0 >= 0x61 && r0 <= 0x7a || r0 >= 0x41 && r0 <= 0x5a
	# Charater set from a..z and A..Z
	LDR r1, =charInput
	LDR r1, [r1, #0]
	MOV r0, r1

	# Check if value is a character
	BL isCharacterLogical

	# Pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt: .asciz "Enter a value: \n"
	input1: .asciz "%c"
	charInput: .word 0
