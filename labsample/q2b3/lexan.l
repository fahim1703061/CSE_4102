%option noyywrap

%{
    // comment here
    #include "lexan.tab.h"
%}

cas1 [0][0][1-9]
cas2 [01][1-7][0-9]
cas3 "180"


delim [ \t\n]

%%


{cas1}|{cas2}|{cas3} {yylval = atoi(yytext);return(NUM);}


{delim} {}

%%


