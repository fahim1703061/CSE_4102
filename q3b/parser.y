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

%token CHAR INT DOUBLE IF ELSE WHILE FOR CONTINUE BREAK VOID RETURN FUNCTION END BEG APT
%token ADDOP SUBOP MULOP DIVOP INCR DECR OROP ANDOP NOTOP EQUOP NEQUOP GTEQ GT LTEQ LT MOD
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN COMMA COLON
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
code: statements_optional ;

statements_optional: statements_optional statement | /* empty */ ;

// /* declarations */
declarations_optional: declarations_optional declaration | /* empty */ ;

declaration: ID COLON type;

type: INT | CHAR | DOUBLE | VOID ;

names: names COMMA ID | names COMMA init | ID | init ;

init: ID ASSIGN constant;

/* statements */
statement:
	RETURN exp SEMI|
    functions
    ;
for_statement: WHILE LPAREN exp RPAREN tail ; 

while_statement: WHILE LPAREN exp RPAREN tail ;

tail: LBRACE statements_optional RBRACE ;

exp:
    exp MOD exp |
    exp SUBOP exp |
    exp MULOP exp |
    exp DIVOP exp |
    INCR ID |
    ID INCR |
    DECR ID |
    ID DECR |
    exp OROP exp |
    exp ANDOP exp |
    NOTOP exp |
    exp EQUOP exp |
    exp NEQUOP exp |
    exp GTEQ exp |
    exp GT exp |
    exp LTEQ exp |
    exp LT exp |
    LPAREN exp RPAREN |
    ID |
    sign constant |
    function_call
    ;

sign: ADDOP | /* empty */ ; 

constant: ICONST | FCONST | CCONST ;

assigment: ID ASSIGN exp ; 

function_call: ID LPAREN call_params RPAREN;

call_params: call_params call_param | /* empty */;

call_param: call_param COMMA exp | call_param COMMA STRING | STRING | exp;

/* functions */
functions: functions function | function ;

function: function_head function_tail ;
		
function_head: FUNCTION ID LPAREN declaration RPAREN;

return_type: type;

parameters_optional: parameters | /* empty */ ;

parameters: parameters COMMA parameter | parameter ;

parameter : type ID ;

function_tail: BEG statements_optional END ;

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