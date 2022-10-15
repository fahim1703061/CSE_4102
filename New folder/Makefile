CC=gcc
OBJ=hellomake.o hellofunc.o
FLAGS=-I.
DEPS=hellomake.h


all:
	gcc -o hello hello.c

hellomake: hellomake.c hellofunc.c
	gcc -o hellomake hellomake.c hellofunc.c -I.

%.o: %.c $(DEPS)
	gcc -c -o $@ $< -I.

hellomake2: hellomake.o hellofunc.o
	gcc -o hellomake hellomake.o hellofunc.o -I.

hellomake3: $(OBJ)
	$(CC) -o $@ $^ $(FLAGS)