%{
        #include <stdio.h>
        #include <stdlib.h>
%}

%option noyywrap

%%

[a-z]*[a]+[a-z]*[e]+[a-z]*[i]+[a-z]*[o]+[a-z]*[u]+[a-z]* {printf("%s\n",yytext);}

[a-zA-Z]* ;

.|\n    ;

%%

int main(int argc,char* argv[])
{
        yyin=fopen(argv[1],"r");

        printf("valid lines:\n");
        yylex();

        return 0;
}
