# Program: lib.s
# Library holding different functions
# Author: Hugo Trinidad
# Date: 07/25/2022

.global Ft2Inches
.global F2C
.global Miles2Kilometers
.global kph
.global C2F
.global Inches2Feet

.text
Inches2Feet:
	# push the stack
	SUB sp, sp, #4
	STR lr, [sp]

	# Convert from inches to feet
	# Moving the inches to another register for later to calculate the reminder
	MOV r4, r0
	MOV r1, #12
	BL  __aeabi_idiv
	MUL r1, r0, r1
	SUB r1, r4, r1
	# pop the stack
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr

.data

# End Inches2Ft
.text
C2F:
	# push the stack
	SUB sp, sp, #4
	STR lr, [sp]
	
	# convert Celcius to Farenheit
	MOV r1, #9
	MUL r0, r0, r1
	MOV r1, #5
	BL  __aeabi_idiv
	MOV r1, #32
	ADD r0, r0, r1

	# pop the stack
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr


.data

# End C2F

.text
kph:
	# push stack
	SUB sp, sp, #4
	STR lr, [sp]

	# convert miles to kilometers
	MOV r4, r0
	MOV r5, r1
	MOV r0, r5
	BL  Miles2Kilometers
	MOV r1, r4
	BL  __aeabi_idiv

	# pop stack
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr
	
.data

# End kph

.text
Miles2Kilometers:
	# push stack
	SUB sp, sp, #4
	STR lr, [sp]

	# convert miles to kilometers
	# r0 = r0 * 16/10
	MOV r1, #16
	MUL r0, r0, r1
	MOV r1, #10
	BL __aeabi_idiv

	# pop the stack
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr

.data
# End Miles2Kilometers

.text
F2C:
	# push stack
	SUB sp, sp, #4
	STR lr, [sp]

	# convert Farenheit to Celcius
	# r0 = (r0 - 32)*5/9
	MOV r1, #-32
	ADD r0, r0, r1
	MOV r1, #5
	MUL r0, r0, r1
	MOV r1, #9
	BL  __aeabi_idiv

	# Pop stack
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr

	
.data

#END F2C
.text

Ft2Inches:

	# push stack
	SUB sp, sp, #4
	STR lr, [sp]

	# Convert feet to inches
	MOV r1, #12
	MUL r0, r0, r1
	
	# pop stack
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr

.data

#END Ft2Inches

