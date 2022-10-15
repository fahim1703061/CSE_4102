input = input.txt
output = output.txt

main:
	flex cal.l
	gcc lex.yy.c 
	./a < $(input) > $(output)
	