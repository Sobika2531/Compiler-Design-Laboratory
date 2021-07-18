%{
        #include<stdio.h>
        #include<stdlib.h>
%}

%%

(0|1)+ {yylval=atoi(yytext);
        return (NUM);}

"&"|"|"|"!"|"x"|"\n" {return yytext[0];}

%%
