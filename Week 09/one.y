%{
        #include<stdio.h>
        #include<ctype.h>

        int i=0;
        int yylex();
        int yyerror();
%}

%token NUM
%left '+''-'
%left '*''/'

%%

S:E '\n' {printf("result =%d",(int)$$);} ;

E:E'+'E {$$=$1+$3;}

|E'-'E {$$=$1-$3;}

|E'*'E {$$=$1*$3;}

|E'/'E {$$=$1/$3;}

|NUM {$$=$1;} ;

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
