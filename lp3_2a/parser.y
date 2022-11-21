%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
    #include "symtab.c"
    #include "codeGen.c"
	void yyerror();
	extern int lineno;
	extern int yylex();
%}

%union
{
    char str_val[100];
    int int_val;
}

%token PRINT SCAN
%token CHAR INT DOUBLE IF ELSE WHILE FOR CONTINUE BREAK VOID RETURN FLOAT ELIF VAR DO LOOP UNTIL DIM AS
%token ADDOP SUBOP MULOP DIVOP INCR DECR OROP ANDOP NOTOP EQUOP NEQUOP GTEQ GT LTEQ LT
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN COMMA COLON TAB ENDLL
%token TEMP1 TEMP2 TEMP3

%token<str_val> ID
%token<str_val> CCONST
%token<str_val> STRING
%token<str_val> FCONST

%token<int_val> ICONST
%token<int_val> INT
%token<int_val> PRINT
%token<int_val> SCAN

%left LT GT /*LT GT has lowest precedence*/
%left ADDOP 
%left MULOP /*MULOP has lowest precedence*/

%type<int_val> exp assignment_print_scan

%start program

%%
program: {gen_code(START, -1);} code {gen_code(HALT, -1);}
code: statements;

statements: statements statement | ;

statement:  declaration
            |assignment_print_scan
            ;

declaration: INT ID SEMI
            {
                insert($2, $1);
            }
            ;

assignment_print_scan: INT ID ASSIGN SCAN LPAREN RPAREN 
                {
                    insert($2, $1);
                    int address = idcheck($2);

                    if(address != -1 && typecheck(gettype($2),$4))
                    {
                        gen_code(SCAN_INT_VALUE, address);
                        gen_code(STORE, address);


                    }
                    else
                        yyerror();
                }
                ADDOP exp
                    {gen_code(ADD, -1);}
                |INT ID ASSIGN SCAN LPAREN RPAREN 
                {
                    insert($2, $1);
                    int address = idcheck($2);

                    if(address != -1 && typecheck(gettype($2),$4))
                    {
                        gen_code(SCAN_INT_VALUE, address);
                        gen_code(STORE, address);


                    }
                    else
                        yyerror();
                }
                SUBOP exp
                    {gen_code(SUB, -1);}
                | PRINT LPAREN ID RPAREN
                {
                    int address = idcheck($3);

                    if(address != -1)
                    {
                        gen_code(PRINT_INT_VALUE, address);
                    }
                    else
                        yyerror();
                }
                |SCAN LPAREN ID RPAREN
                {
                    int address = idcheck($3);

                    if(address != -1)
                    {
                        gen_code(SCAN_INT_VALUE, address);
                    }
                    else
                        yyerror();
                }
                ;

exp: ICONST
    {
        gen_code(LD_INT, $1);
    }
    | ID 
      {
            int address = idcheck($1);

            if(address != -1)
            {
                gen_code(LD_VAR, address);
            }
            else
                yyerror();

      }
    | exp ADDOP exp
    
    { 
        if(typecheck($1,$3))
            {
                
                gen_code(ADD, -1); 

            }
    }
    | exp MULOP exp
    | exp GT exp
    |exp LT exp
    ;

%%

void yyerror ()
{
	printf("Syntax error at line %d\n", lineno);
	exit(1);
}

int main (int argc, char *argv[])
{
	yyparse();
	printf("Parsing finished!\n");

    printf("============= INTERMEDIATE CODE===============\n");
    print_code();

    printf("============= ASM CODE===============\n");
    print_assembly();

	return 0;
}
