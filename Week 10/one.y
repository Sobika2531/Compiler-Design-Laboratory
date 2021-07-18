%{
        #include<stdio.h>
        #include<stdlib.h>
        #include<ctype.h>

        int yylex();
        int yyerror();
%}

%token NUM LT LE GT GE EQ NE
%left EQ NE
%left LT LE GT GE

%%

S : E  {printf("\nThe result is = %d ",$$);
        if($$==1)
                printf("(true)\n");
        else
                printf("(false)\n");

        exit(0);
        };


 E:NUM LT NUM {$$=$1<$3;}
  |NUM LE NUM {$$=$1<=$3;}
  |NUM GT NUM {$$=$1>$3;}
  |NUM GE NUM {$$=$1>=$3;}
  |NUM EQ NUM {$$=$1==$3;}
  |NUM NE NUM {$$=$1!=$3;}
  ;

%%

#include "lex.yy.c"

void main(){
        printf("Enter the expression\n");
        yyparse();
}

int yywrap()
{}

int yyerror()
{}
