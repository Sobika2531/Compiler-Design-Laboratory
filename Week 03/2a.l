%{
        #include <stdio.h>
        #include <stdlib.h>
%}

%option noyywrap

%%

[a-zA-Z]        ;

"\/""\*"[a-zA-Z0-9" "]*"\*""\/"         {printf("%s\n",yytext);}

\n    ;

%%

int main(int argc,char* argv[])
{
        yyin=fopen(argv[1],"r");

        printf("valid lines:\n");
        yylex();

        return 0;
}
