%{
        #include <stdio.h>
        int vow=0,cons=0;
%}

%%

[aeiouAEIOU]    {vow++;}

[a-zA-Z]        {cons++;}

%%

int yywrap()
{
        return 1;
}

int main(void)
{
        yylex();
        printf("number of vowels=%d\nnumber of consonants=%d\n",vow,cons);
        return 0;
}
