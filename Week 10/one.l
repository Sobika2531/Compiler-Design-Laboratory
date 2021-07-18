%{
        #include<stdio.h>
        #include<stdlib.h>

        extern int yylval;
%}

%%

[0-9]+ {yylval = atoi(yytext);
        return NUM;
        }

"<=" return LE;

">=" return GE;

"<" return LT;

">" return GT;

"==" return EQ;

"!=" return NE;

%%
