%{

#include <stdio.h>

%}


%%

^[0-9]+    { printf("This is an unsigned number\n");}

^(-[0-9]*)     {printf("not an unsigned number\n");}

.|\n;

%%
int yywrap()
{
        return 1;
}

int main(void)
{
        yylex();
        return 0;
}
