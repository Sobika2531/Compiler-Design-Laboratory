

%{
        #include <stdio.h>
        int count=0;
%}

digit [0-9]
letter [a-zA-Z]

%%

{letter}({letter}|{digit})*   {
                count++;
}


%%

int yywrap(void)
{
        return 1;
}

int main()
{
        yylex();

        printf("number of identifiers: %d\n",count);
        return 0;
}
