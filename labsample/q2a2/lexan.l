%option noyywrap

%{
    // comment here
%}

uni "Dhaka"|"Rajshahi"|"Chittagong"



delim [ \t\n]

%%

({uni}) {printf("UniversityName -> %s\n", yytext);}
"University" {printf("UNIVERSITY -> %s\n", yytext);}
"of" {printf("OF -> %s\n", yytext);}


{delim} {}

%%

int main()
{

    yylex();
    return 0;

}

