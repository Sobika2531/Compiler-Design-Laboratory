%{
        #include <stdio.h>
        #include <string.h>

        int init=1,cond=0,step=0;
        char init_buff[25],cond_buff[25],step_buff[25];
%}

%option noyywrap

%%

"while("|"while ("  {printf("while found\n");
                init=0;
                cond=1;
                }


";"     {}

")"     {printf("condition found\n");}

"}"     {printf("end of the body\n");}


"{"     {printf("BODY:\n");
        cond=0;
        step=1;
        }


.       {if(init)
                strcat(init_buff,yytext);
        else if(cond)
                strcat(cond_buff,yytext);
        else if(step)
                strcat(step_buff,yytext);
        else{
                printf("ERROR!\n");
                return -1;
        }
        }

%%

int main(int argc,char* argv[])
{
        if(argc>1){
                FILE* fp=fopen(argv[1],"r");
                if(fp)
                        yyin=fp;
        }

        yylex();

        FILE* fp=fopen("output4.txt","w");

        fprintf(fp,"for(%s;%s;%s)\n{\n}\n",init_buff,cond_buff,step_buff);
        fclose(fp);

        return 0;
}
