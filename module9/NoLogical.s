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
	MOV r4, r1
	MOV r5, #0x7a
	CMP r4, r5
	BGT NoCharacter
	MOV r5, #0x61
	CMP r4, r5
	BGE IsCharacter
	MOV r5, #0x5a
	CMP r4, r5
	BGT NoCharacter
	MOV r5, #0x41
	CMP r4, r5
	BGE IsCharacter
	B NoCharacter
	IsCharacter:
		LDR r0, =itIsCharacter
		BL printf
		B EndProgram
	NoCharacter:
		LDR r0, =isNotCharacter
		BL printf
		B EndProgram

	EndProgram:
		# Pop the stack
		LDR lr, [sp, #0]
		ADD sp, sp, #4
		MOV pc, lr

.data
	prompt: .asciz "Enter a value: \n"
	input1: .asciz "%c"
	charInput: .word 0
	isNotCharacter: .asciz "No a character \n"
	itIsCharacter: .asciz "It is a character\n"
