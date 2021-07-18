%{
#include<stdio.h>
#include<ctype.h>
#include<stdlib.h>

int yylex();
int yyerror();
int count=0;
%}


%token FOR RELOP NUM ID NL EQ OP INC KEY SEM S

%%

stmt:for_stmt NL {printf("Input accepted\n");printf("No of for statements nested :%d\n",count);exit(0);};
        for_stmt: FOR'('init cond incre')''{'for_stmt'}' {count++;}
        |S;
incre: x INC | x EQ x OP x;
          init: KEY x EQ x SEM;
cond: x RELOP x SEM;
        x: ID | NUM;
%%

void main() {
printf("Enter the expression:\n");
yyparse();
}
int yywrap()
{}
int yyerror()
{}
