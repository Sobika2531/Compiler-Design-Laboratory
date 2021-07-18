%{
        #include<stdio.h>
        #include <stdlib.h>
%}

%option noyywrap

%%

[a-zA-Z]*([a | A][b | B])+[a-zA-Z]*     {printf("%s\n",yytext);}

.|\n    ;

%%

int main(int agrc,char* argv[])
{
        yyin=fopen(argv[1],"r");

        yylex();
        return 0;
}
