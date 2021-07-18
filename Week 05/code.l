%{
        #include <stdio.h>
%}

%%

if|else|while|int|switch|for|char|float|double|then|real|print|def|return        {printf("keyword:%s\n",yytext);}

[a-zA-Z]+([a-z][0-9])*     {printf("identifier:%s\n",yytext);}

[0-9]+  {printf("number:%s\n",yytext);}

[0-9]+(.[0-9]+)?(E[+|-]?[0-9]+)?        {printf("unsigned number:%s\n",yytext);}

"="|"+="|"-="|"*="|"/="|"%="|"<<="|">>="|"&="|"^="|"|="|":="    {printf("assignment operator:%s\n",yytext);}

"++"    {printf("increment operator:%s\n",yytext);}

"--"    {printf("decrement operator:%s\n",yytext);}

"+"|"-"|"*"|"/"|">"|"<"|"%"         {printf("operator:%s\n",yytext);}

" "|\t|\n               {printf("delimiter:%s\n",yytext);}

"#"|"!"|"@"|"$"|"{"|"}"|"["|"]"|"^"|"&"|\"|"("|")"|";"|":"      {printf("special character:%s\n",yytext);}

.       {;}

%%

int yywrap()
{
        return 1;
}

int main(int argc,char*argv[])
{
        yyin=fopen(argv[1],"r");
        yylex();
        return 0;
}
