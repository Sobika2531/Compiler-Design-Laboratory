%{
        #include <stdio.h>
        #include <string.h>
%}

%%

[a-z]+  {fprintf(yyout,"\nlower: %s",yytext);
        yyless(4);
        fprintf(yyout,"\nthe word after yyless: ");
        ECHO;
        }

[A-Za-z]+       {fprintf(yyout,"\nmixed letters: %s",yytext);}


%%

int main(int argc,char* argv[])
{
        if(argc>1){
                FILE* fp=fopen(argv[1],"r");
                if(fp)
                        yyin=fp;
        }

        FILE* op=fopen("output2.txt","w");
        if(op)
                yyout=op;

        yylex();
        return 0;
}
