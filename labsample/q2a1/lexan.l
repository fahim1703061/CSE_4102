%option noyywrap

%{
    // comment here
%}

uni "UET"|"UET"|"UET"
dept "CSE"|"EEE"
series "17"|"18"|"19"
letter [A-Z]


delim [ \t\n]

%%

({letter})({uni}) {printf("University -> %s\n", yytext);}
{dept} {printf("Department -> %s\n", yytext);}
{series} {printf("Series -> %s\n", yytext);}


{delim} {}

%%

int main()
{

    yylex();
    return 0;

}

