# Program name: libConditionals.s
# Purpose: Module used  for practicing conditions and branching
# Author: Hugo Trinidad
# Date: 07/30/2022

.global findMaxOf3
.global isCharacterLogical

.text
isCharacterLogical:

	# push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	# conditional check
	MOV r4, #0
	MOV r1, #0x7a
	CMP r0, r1
	MOVLE r4, #1

	MOV r5, #0
	MOV r1, #0x61
	CMP r0, r1
	MOVGE r5, #1

	AND r6, r4, r5

	MOV r4, #0
	MOV r1, #0x5a
	CMP r0, r1
	MOVLE r4, #1

	MOV r5, #0
	MOV r1, #0x41
	CMP r0, r1
	MOVGE r5, #1

	AND r7, r4, r5

	ORR r0, r6, r7

	CMP r0, #1
	BEQ Else_Logical
		LDR r0, =outputNoCharacter
		BL printf
		B EndIf_Logical
	Else_Logical:
		LDR r0, =outputCharacter
		BL printf
	EndIf_Logical:
		# pop the stack
		LDR lr, [sp, #0]
		ADD sp, sp, #4
		MOV pc, lr
.data
	outputNoCharacter: .asciz "It is Not a character\n"
	outputCharacter: .asciz "It is a character\n"

.text
findMaxOf3:
	# push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	# Moving values to preserved registeres
	MOV r4, r0
	MOV r5, r1
	MOV r6, r2
	
	# find max of 3
	CMP r4, r5
	BLT Else
		CMP r4, r6
		MOVLT r4, r6
		MOV r0, r4
		B EndIf 
		
	Else:
		CMP r5, r6
		MOVLT r5, r6
		MOV r0, r5
	
	EndIf:

		#Pop the stack
		LDR lr, [sp, #0]
		ADD sp, sp, #4
		MOV pc, lr
	
.data

# end findMaxOf3
