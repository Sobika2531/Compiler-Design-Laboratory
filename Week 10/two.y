%{
        #include<stdio.h>
        #include<ctype.h>
        #include <stdlib.h>

        int yylex();
        int yyerror();
%}

%token NUM
%left '&''|''x'
%right '!'

%%

S:E {printf("\nresult =%d\n",(int)$$);exit(0);};

E:E'&'E {$$=$1&$3;}
|E'|'E {$$=$1|$3;}
|'!'E {$$=!$2;}
|E'x'E {$$=($1&(!$3))|((!$1)&$3);}
|NUM {$$=$1;};

%%

#include "lex.yy.c"

void main()
{
        printf("Enter the expression\n");
        yyparse();
}

int yywrap()
{}

int yyerror()
{}
