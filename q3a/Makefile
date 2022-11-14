input = input.txt
output = output.txt

main: lexer.l
	flex lexer.l
	gcc lex.yy.c
	./a < $(input) > $(output)


