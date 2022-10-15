input = input.txt
output = output.txt

main: lexan.l
	flex lexan.l
	gcc lex.yy.c
	./a < $(input) > $(output)
	# a <input.txt