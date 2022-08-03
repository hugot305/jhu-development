.text
.global main

main:
	# Push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]
	
	# prompt user for a value
	LDR r0, =prompt
	BL printf

	# Scanf value
	LDR r0, =input
	LDR r1, =num
	BL scanf
	LDR r1, =num
	LDR r1, [r1, #0]
	MOV r4, r1

	StartSentinelLoop:
		MOV r0, #-1
		CMP r4, r0
		BEQ EndSentinelLoop

		# checking if the entered value is valid
		CMP r4, #-1
		BLT Error
		CMP r4, #2
		BEQ Error
		CMP r4, #1
		BEQ Error
		CMP r4, #0
		BEQ Error

		# Checking for prime outer loop
		MOV r0, r4
		MOV r1, #2
		BL __aeabi_idiv
		MOV r5, r0
		
		# Counter loop
		MOV r6, #2

		StartCountingLoop:
			CMP r6, r5
			BGE EndCountingLoopIsPrime
			# Loop block
			MOV r0, r4
			MOV r1, r6

			BL __aeabi_idiv
			#reminder
			MUL r1, r0, r6
			SUB r7, r4, r1

			CMP r7, #0
			BEQ EndCountingLoopIsNotPrime

			# Next vaue for couning loop
			ADD r6, r6, #1 
			B StartCountingLoop
		
		EndCountingLoopIsPrime:
			LDR r0, =outputIsPrime
			MOV r1, r4
			BL printf
			B NextValue
		EndCountingLoopIsNotPrime:
			LDR r0, =outputIsNotPrime
			MOV r1, r4
			BL printf
			B NextValue
	Error:
		# Displaying error message
		LDR r0, =error
		BL printf
	NextValue:
		# Get Next value
		LDR r0, =prompt
		BL printf
		LDR r0, =input
		LDR r1, =num
		BL scanf
		LDR r1, =num
		LDR r1, [r1, #0]
		MOV r4, r1

		B StartSentinelLoop

	EndSentinelLoop:
		# Pop the stack
		LDR lr, [sp, #0]
		ADD sp, sp, #4
		MOV pc, lr
# End Main

.data
	prompt: .asciz "Please a number (-1 to end) \n"
	error: .asciz "Invalid number. Please enter another number.\n"
	outputIsPrime: .asciz "The number %d is prime \n"
	outputIsNotPrime: .asciz "The number %d is not prime \n"
	input: .asciz "%d"
	num: .word 0
