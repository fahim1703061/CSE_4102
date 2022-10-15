%option noyywrap

%{
    // comment here
    #include "lexan.tab.h"
%}

uni "Dhaka"|"Rajshahi"|"Chittagong"


delim [ \t\n]

%%

({uni}) {yylval = atoi(yytext);return(UniversityName);}
"University" {yylval = atoi(yytext);return(UNIVERSITY);}
"of" {yylval = atoi(yytext);return(OF);}


{delim} {}

%%


