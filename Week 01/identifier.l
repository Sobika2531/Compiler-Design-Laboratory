%{

  #include <stdio.h>

%}


%%

^[a-zA-Z_][a-zA-Z0-9_]* {printf("valid identifier\n");}

^[^a-zA-Z_]     {printf("invalid identifier\n");}

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
