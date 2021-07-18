%{
        #include <stdio.h>
        #include <stdlib.h>
        int count=0,i=0,j=0;
%}

digit[0-9]

%%

{digit}+ { for(i=0;i<yyleng;i++){
                for(j=i+1;j<yyleng;j++){
                        if(yytext[i]==yytext[j])
                                count++;
                        }
                }
                if(count<=1)
                {
                        printf("dup=%d\n",count);
                        printf("%s\n","valid");
                        count=0;
                }
                else{
                        printf("dup=%d\n",count);
                        printf("%s\n","invalid");
                        count=0;
                }
}

. {;}

%%
int yywrap()
{}
int main()
{

        yylex();

        return 1;
}
