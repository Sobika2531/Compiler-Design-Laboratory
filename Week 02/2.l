%{
        #include <stdio.h>
        int chars=0,lines=0;
%}

%%

\n      { ++lines;}

.       {++chars;}

end return 0;

%%

int yywrap()
{
        return 1;
}
int main(void)
{
        yylex();
        printf("no. of lines=%d\n no.of chars=%d\n",lines,chars);
        return 0;
}
