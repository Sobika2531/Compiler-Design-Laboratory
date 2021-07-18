%{

        #include<stdio.h>
        #include <string.h>

%}

%option noyywrap

%%

[a-z]+ {printf("%s\n",yytext);}

[a-zA-Z]+ ;

.|\n    ;

%%

int main(int agrc,char* argv[])
{
        yyin=fopen(argv[1],"r");

        yylex();
        return 0;
}
