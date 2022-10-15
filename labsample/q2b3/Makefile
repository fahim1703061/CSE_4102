input = input.txt
output = output.txt

main: lexan.l lexan.y
	bison -d lexan.y
	flex lexan.l
	gcc lexan.tab.c lex.yy.c
	./a < $(input) > $(output)