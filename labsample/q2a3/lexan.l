%option noyywrap

%{
    // comment here
%}


cas1 [0][0][1-9]
cas2 [01][1-7][0-9]
cas3 "180"



delim [ \t\n]

%%

{cas1}|{cas2}|{cas3} {printf("NUM -> %s\n", yytext);}


{delim} {}

%%

int main()
{

    yylex();
    return 0;

}

