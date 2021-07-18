%{
        #include <stdio.h>
        int id=0,key=0,num=0,unum=0,assign=0,op=0,deli=0,spl=0;
%}

%%

if|else|while|int|switch|for|char|float|double|then|real        {printf("keyword\n");
                                                                        key++;}

[a-z]+([a-z][0-9])*     {printf("identifier\n");
                                id++;}

[0-9]+  {printf("number\n");
                num++;}

[0-9]+(.[0-9]+)?(E[+|-]?[0-9]+)?        {printf("unsigned number\n");
                                                unum++;}

"="|"+="|"-="|"*="|"/="|"%="|"<<="|">>="|"&="|"^="|"|="|":="    {printf("assignment operator\n");
                                                                        assign++;}

"+"|"-"|"*"|"/"         {printf("operator\n");
                                op++;}

" "|\t|\n               {printf("delimiter\n"); deli++;}

"#"|"!"|"@"|"$"|"%"|"^"|"&"|\"|"("|")"|";"      {printf("special character\n"); spl++;}


%%

int yywrap()
{
        return 1;
}

int main(void)
{
        yylex();
        printf("no. of keywords=%d\n no. of identifiers=%d\n no. of numbers=%d\n no. of unsigned numbers=%d\n no. of assignment operators=%d\n no. of operators=%d\n no. of delimiters=%d\n no. of special characters=%d\n",key,id,num,unum,assign,op,deli,spl);
        return 0;
}
