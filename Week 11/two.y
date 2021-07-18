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

ST: E {printf("Valid expression.\nResult after evaluation: %d\n",$1);}


E : E E '+' {$$=$1+$2;}
  | E E '-' {$$=$1-$2;}
  | E E '*' {$$=$1*$2;}
  | E E '/' {$$=$1/$2;}
  | E E '%' {$$=$1%$2;}
  | NUM
  ;

%%

#include "lex.yy.c"

int yyerror()
{}

void main()
{
        printf("Enter the postfix expression\n");
        yyparse();
}

int yywrap()
{}
