%{
        #include<stdio.h>
        #include<ctype.h>

        int i=0;
        int yyerror();
        int yylex();
%}

%token NUM
%left '&''|''x'
%right '!'

%%

S:E '\n' {printf("result =%d",(int)$$);};

E:E'&'E {$$=$1&$3;}
|E'|'E {$$=$1|$3;}
|'!'E {$$=!$2;}
|E'x'E {$$=($1&(!$3))|((!$1)&$3);}
|NUM {$$=$1;};

%%

#include "lex.yy.c"

int main()
{
yyparse();
}

int yywrap()
{}

int yyerror()
{}
