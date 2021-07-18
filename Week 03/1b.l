%{
        #include <stdio.h>
        #include <stdlib.h>
%}

%option noyywrap

%%

[a-zA-Z]*([d | D]+[e | E][f | F])+[a-zA-Z]* {printf("%s\n",yytext);}

.|\n    ;

%%

int main(int argc,char* argv[])
{
        yyin=fopen(argv[1],"r");

        yylex();
        return 0;
}
