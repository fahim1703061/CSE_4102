%option noyywrap

%{
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

"//".*     { } 

"int"      { return INT; }
"function"	   { return FUNCTION; }
"char"	   { return CHAR; }
"begin"    { return BEG; }
"if"	   {return IF;}
"else"	   {return ELSE;}
"while"    { return WHILE; }
"For"      { return FOR; }
"end" { return END; }

"void"     { return VOID; }
"return"   { return RETURN; }
"as"	   {return APT;}

"+"        { return ADDOP; }
"-"        { return SUBOP; }
"*"        { return MULOP; }
"/"        { return DIVOP; }
"++"       { return INCR; }
"--"       { return DECR; }
"||"       { return OROP; }
"&&"       { return ANDOP; }
"!"        { return NOTOP; }
"=="       { return EQUOP; }
"!="       { return NEQUOP; }
">="       { return GTEQ; }
">"        { return GT; }
"<="       { return LTEQ; }
"<"        { return LT; }

"("        { return LPAREN; }
")"        { return RPAREN; }
"{"        { return LBRACE; }
"}"        { return RBRACE; }
";"        { return SEMI; }
","        { return COMMA; }
"="        { return ASSIGN; }
":"        { return COLON; }
"%"        { return MOD; }

{ID}        {return ID;}
{ICONST}    {return ICONST;}
{FCONST}    {return FCONST;}
{CCONST}    {return CCONST;}
{STRING}    {return STRING;}

"\n"        { lineno += 1; }
[ \t\r\f]+  

.           { yyerror("Unrecognized character"); }
