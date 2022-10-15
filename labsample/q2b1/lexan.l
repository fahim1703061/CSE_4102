%option noyywrap

%{
    // comment here
    #include "lexan.tab.h"
%}

uni "UET"|"UET"|"UET"
dept "CSE"|"EEE"
series "17"|"18"|"19"
letter [A-Z]


delim [ \t\n]

%%

({letter})({uni})({delim}) {yylval = atoi(yytext);return(University);}
{dept}{delim} {yylval = atoi(yytext);return(Department);}
{series}{delim} {yylval = atoi(yytext);return(Series);}


{delim} {}

%%


