%{
        #include <stdio.h>
        #include <string.h>
%}

%%

[a-z]+  { fprintf(yyout,"lowercase letter: %s",yytext);
        fprintf(yyout,"\nstart of 1st yymore\n");
        yymore();
        fprintf(yyout,"end of 1st yymore\n\n");
        }

[A-Z]+  { fprintf(yyout,"uppercase letter: %s",yytext);
        fprintf(yyout,"\nstart of 2nd yymore\n");
        yymore();
        fprintf(yyout,"end of 2nd yymore\n\n");
        }

%%

int main(int argc,char* argv[])
{
        if(argc>1){
                FILE* fp=fopen(argv[1],"r");
                if(fp)
                        yyin=fp;
        }

        FILE* op=fopen("output1.txt","w");
        if(op)
                yyout=op;

        yylex();
        return 0;
}
