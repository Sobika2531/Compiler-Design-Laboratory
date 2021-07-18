%{
        #include <stdio.h>
        #include <stdlib.h>
%}

%option noyywrap

%%

[a | b]*[a][b][b][a | b]* {printf("invalid %s\n",yytext);}

[a|b]* {printf("valid %s\n",yytext);}

.|\n    ;

%%

int main()
{
        yylex();

        return 0;
}
