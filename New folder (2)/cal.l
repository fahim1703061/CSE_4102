%option noyywrap


%{

%}

digit [0-9]

INT [int]
letter [a-zA-Z]
under [_]

delim [ \t]

assign [=]
semi [;]


%%
{digit}{digit}* {printf("%s -> digit\n",yytext);}
"int" {printf("%s -> INT\n",yytext);}
"+" {printf("%s -> INT\n",yytext);}
{delim} {}
{assign} {printf("%s -> assign\n",yytext);}
{semi} {printf("%s -> semi\n",yytext);}
({under}|{letter})({under}|{letter}|{digit})* {printf("%s -> ID\n",yytext);}
%%

int main()
{
    yylex();
    return 0;
}
