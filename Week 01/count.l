%{
        #include <stdio.h>
        int characters=0, lines=0, words=0;
%}

%%

[\n] {lines++;}

[^ \t \n]+ { words++;
           characters+=yyleng;
        }
%%

int yywrap()
{
        return 1;
}

int main()
{
        yylex();
        printf("no. of lines: %d \n no. of words: %d \n no. of characters: %d \n",lines,words,characters);
        return 0;
}
