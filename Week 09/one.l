%{
        #include<stdio.h>
        #include<stdlib.h>
%}

%%

[0-9]+          {yylval=atoi(yytext);
                return (NUM);}

"+"|"-"|"*"|"/"|"\n"    {return yytext[0];}

%%
