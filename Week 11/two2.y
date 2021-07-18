%{
        #include<stdio.h>
        #include<stdlib.h>

        int yyerror();
        int yylex();
%}

%token  NUM
%left '+' '-'
%left '*' '/' '%'

%%

ST: E {printf("Valid expression.\nResult after evaluation: %d\n",$$);}


E : '+' E E  {$$=$2+$3;}
  | '-' E E  {$$=$2-$3;}
  | '*' E E  {$$=$2*$3;}
  | '/' E E  {$$=$2/$3;}
  | '%' E E  {$$=$2%$3;}
  | NUM
  ;

%%

#include "lex.yy.c"

int yyerror()
{}

void main()
{
        printf("Enter the prefix expression\n");
        yyparse();
}

int yywrap()
{}
