All: LargestValue IsCharacterLogical
LIB=libConditionals.o
CC=gcc

LargestValue: LargestValue.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

IsCharacterLogical: IsCharacterLogical.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s .o:
	$(CC) $(@:.o=.s) -g -c -o $@
