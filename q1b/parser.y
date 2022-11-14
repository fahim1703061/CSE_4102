%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	void yyerror();
	extern int lineno;
	extern int yylex();
%}

%union
{
    char str_val[100];
    int int_val;
}

%token CHAR INT DOUBLE IF ELSE WHILE FOR CONTINUE BREAK VOID RETURN FLOAT ELIF
%token ADDOP SUBOP MULOP DIVOP INCR DECR OROP ANDOP NOTOP EQUOP NEQUOP GTEQ GT LTEQ LT
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN COMMA COLON TAB ENDLL
%token ID
%token ICONST
%token FCONST
%token CCONST
%token STRING

%right ASSIGN /*ASSIGN has lowest precedence*/
%left OROP
%left ANDOP
%left EQUOP NEQUOP
%left GTEQ GT LTEQ LT
%left ADDOP SUBOP
%left MULOP DIVOP
%right NOTOP INCR DECR
%left LPAREN RPAREN /*LPAREN has highest precedence*/

%start code

%%
code: statements_optional;

statements_optional: statements_optional statement | /* empty */ ;

// /* declarations */
declarations_optional: declarations_optional declaration | /* empty */ ;

declaration: type ID ASSIGN function_call ;

type: INT | CHAR | DOUBLE | VOID |FLOAT;

names: names COMMA ID | names COMMA init | ID | init ;

init: ID ASSIGN constant;
constant: ICONST | FCONST | CCONST ;
/* statements */
statement:
	declarations_optional |
    if_statement 
    ;

if_statement:
	IF exp COLON tail {printf("tail no print\n")}ELIF exp COLON tail ELSE COLON tail
    ;



tail: tail TAB exp|;

exp:
    ID EQUOP constant |
    ID GT constant |
    function_call
    ;


function_call: ID LPAREN STRING RPAREN;


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
	return 0;
}
