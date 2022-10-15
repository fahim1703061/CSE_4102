%option noyywrap

%{
    // comment here
%}


cas1 [0][0][1-9]
cas2 [01][1-7][0-9]
cas3 "180"
deptc [01][0-9]
series "17"|"18"|"19"|"20"



delim [ \t\n]

%%

({series})({deptc})({cas1}|{cas2}|{cas3})({delim}) {printf("acceptedRoll -> %s\n", yytext);}


{delim} {}

%%

int main()
{

    yylex();
    return 0;

}

