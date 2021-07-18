%{
        #include <stdio.h>
%}

%%

if|else|for|while|do|switch|int|float|double|real|then    {printf("keyword\n");}

[0-9]* {printf("number\n");}

[a-z]+([a-z][0-9])*     {printf("identifier\n");}

[0-9]*(.[0-9]+)?(E[+|-]?[0-9]+)?        {printf("unsigned number\n");}

\n ;

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
