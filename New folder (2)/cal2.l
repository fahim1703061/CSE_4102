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
{digit}{digit}* {return(NUM);}
"int" {printf("%s -> INT\n",yytext);}
"+" {return(ADD);}
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
