%option noyywrap

%{
	#define INT_TYPE 1
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "parser.tab.h"
	
	int lineno = 1; // initialize to 1
	void yyerror();
%}

alpha     [a-zA-Z]
digit     [0-9]
alnum     {alpha}|{digit}
print     [ -~]

ID        {alpha}{alnum}*
ICONST    [0-9]{digit}*
FCONST    {digit}*"."{digit}+
CCONST    (\'{print}\')
STRING    \"{print}*\"
%%

"//".*        { } 

"INT"       {yylval.int_val=INT_TYPE; return INT; }
"real"   { return DOUBLE; }
"char"	   { return CHAR; }
"float"	   { return FLOAT; }
"var"	   { return VAR; }
"dim"	   { return DIM; }
"as"	   { return AS; }

"if"	   {return IF;}
"elif"	   {return ELIF;}
"else"	   {return ELSE;}
"while"    { return WHILE; }
"loop"      { return LOOP; }
"do" { return DO; }
"until"    { return UNTIL; }
"void"     { return VOID; }
"return"   { return RETURN; }


"temp1"    { return TEMP1; }
"temp2"     { return TEMP2; }
"temp3"   { return TEMP3; }

"+"       { return ADDOP; }
"-"       { return SUBOP; }
"*"       { return MULOP; }
"/"       { return DIVOP; }
"=="      { return EQUOP; }
">"       { return GT; }
"<"       { return LT; }

"("       { return LPAREN; }
")"       { return RPAREN; }
"{"       { return LBRACE; }
"}"       { return RBRACE; }
";"       { return SEMI; }
"="       { return ASSIGN; }
"output"       {yylval.int_val=INT_TYPE; return PRINT; }
"input"       { yylval.int_val=INT_TYPE;return SCAN; }

{ID}        {strcpy(yylval.str_val, yytext); return ID;}
{ICONST}    {yylval.int_val=atoi(yytext); return ICONST;}

{FCONST}    {strcpy(yylval.str_val, yytext); return FCONST;}
{CCONST}    {strcpy(yylval.str_val, yytext); return CCONST;}
{STRING}    {strcpy(yylval.str_val, yytext); return STRING;}


"\n"        { lineno += 1; }
[ \t\r\f]+  

.       { yyerror("Unrecognized character"); }
