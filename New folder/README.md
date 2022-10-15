gcc -E hello.c > hello.i
assembly: gcc -S -masm-intel hello.i  
objectfile:as -o hello.o hello.s
objdump -d hello.o
