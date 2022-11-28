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
%token SUP TEMP2 TEMP3

%token<str_val> ID
%token<str_val> CCONST
%token<str_val> STRING
%token<str_val> FCONST

%token<int_val> ICONST
%token<int_val> INT DOUBLE CHAR
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

declaration: DIM ID AS INT
            {
                insert($2, $4);
            }
            ;

assignment_print_scan: SCAN LPAREN ID RPAREN SEMI
                {
                    insert($3, 1);
                    int address = idcheck($3);

                    if(address != -1)
                    {
                        gen_code(SCAN_INT_VALUE, address);
                        gen_code(STORE, address);


                    }
                    else
                        yyerror();
                }
                
                
                | SUP ID AS INT ASSIGN PRINT LPAREN ICONST ADDOP SCAN LPAREN RPAREN SUBOP ID RPAREN SEMI
                {
                    gen_code(LD_INT, $8);
                    insert($2, $4);
                    int address = idcheck($2);

                    if(address != -1)
                    {
                        gen_code(SCAN_INT_VALUE, address);
                        gen_code(STORE, address);


                    }
                    else
                        yyerror();
                    
                    gen_code(ADD, -1);
                    
                    
                    address = idcheck($14);

                    if(address != -1)
                    {
                        gen_code(LD_VAR, address);
                    }
                    else
                        yyerror();

        

                    gen_code(SUB, -1);
                    address = idcheck($2);

                    if(address != -1)
                    {
                        gen_code(STORE, address);
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
        
        gen_code(ADD, -1); 

         
    }
    | exp SUBOP exp
     { 
        
        gen_code(SUB, -1); 

         
    }
    | exp MULOP exp
    
    { 
        
        gen_code(MUL, -1); 

         
    }
    | exp DIVOP exp
    
    { 
        
        gen_code(DIV, -1); 

         
    }
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
