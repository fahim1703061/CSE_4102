%{
    #include <stdio.h>
    void yyerror(char *s);
    int yylex();
%}

%token UNIVERSITY OF UniversityName 

%start s

%%

s: UNIVERSITY OF UniversityName 
    ;


%%

int main()
{
    int a = yyparse();
    if (a){
        printf("not accepted\n");
    }
    else{
        printf("accepted\n");
    }
    
    
}
void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n",s);
    
}