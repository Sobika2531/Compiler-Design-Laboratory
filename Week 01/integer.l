%{
        #include <stdio.h>
%}

%option noyywrap

%%

[0-9]+ {printf("saw an integer: %s\n",yytext);}

.|\n  {}

%%
int main(void)
{
        yylex();
        return 0;
}
