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
%%

"//".*        { } 

"integer"       {yylval.int_val=INT_TYPE; return INT; }

"jodi"	   {return IF;}

"tachara"	   {return ELSE;}
"while"    { return WHILE; }

"main"    { return MAIN; }
"function"    { return FUNCTION; }
"ar"    { return AR; }
"suru"    { return SHURU; }
"dhori"    { return DHORI; }
"akta"    { return AKTA; }
"sesh"    { return SHESH; }
"abar jodi"	   {return ELIF;}
"kori"    { return KORI; }


"jog"       { return ADDOP; }
"-"       { return SUBOP; }
"*"       { return MULOP; }
"/"       { return DIVOP; }
"soman"      { return EQUOP; }
"boro"       { return GT; }
"choto"       { return LT; }

"k_ak_barai"       { return INCI; }
"--"       { return DECI; }

"("       { return LPAREN; }
")"       { return RPAREN; }
"{"       { return LBRACE; }
"}"       { return RBRACE; }
";"       { return SEMI; }
"soman"       { return ASSIGN; }
"print"       { return PRINT; }
"scan"       { return SCAN; }

{ID}        {strcpy(yylval.str_val, yytext); return ID;}
{ICONST}    {yylval.int_val=atoi(yytext); return ICONST;}

"\n"        { lineno += 1; }
[ \t\r\f]+  

.       { yyerror("Unrecognized character"); }
