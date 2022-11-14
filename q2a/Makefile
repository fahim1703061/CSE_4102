input = input.txt
output = output.txt
# ./a < input.txt
main: lexer.l
	flex lexer.l
	gcc lex.yy.c
	./a < $(input) > $(output)
	


