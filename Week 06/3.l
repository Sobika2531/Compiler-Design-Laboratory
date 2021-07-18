%{
        #include <stdio.h>
        #include <string.h>

        int init=0,cond=0,step=0,buff_flag=0;
        int sccount=0,close_flag=0,paran_flag=1;
        char init_buff[25],cond_buff[25],step_buff[25],buffer[250];
%}

%option noyywrap

%%

"for("|"for ("  {printf("for found");
                init=1;
                buffer[0]='\0';
                }


;       {sccount++;
        if(sccount==1){
                printf("\ninitiation found\n");
                init=0;
                cond=1;
        }
        else if(sccount==2){
                printf("condition found\n");
                cond=0;
                step=1;
        }
        else
                strcat(buffer,";");
        }


")"     {if(paran_flag==1){
                printf("iteration found\n");
                step=0;buff_flag=1;
                paran_flag=0;
        }
        else
                REJECT;
        }


"{"     {close_flag++;
        if(close_flag=1)
                printf("BODY:\n");
        else
                REJECT;
        }


"}"     {close_flag--;
        if(close_flag==0){
                printf("end of the body\n");
                strcat(buffer,step_buff);
                strcat(buffer,";");
        }
        else
                REJECT;
        }


.       {if(init)
                strcat(init_buff,yytext);
        else if(cond)
                strcat(cond_buff,yytext);
        else if(step)
                strcat(step_buff,yytext);
        else if(buff_flag)
                strcat(buffer,yytext);
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

        FILE* fp=fopen("output3.txt","w");

        fprintf(fp,"%s;\ndo{\n%s\n}while(%s);\n",init_buff,buffer,cond_buff);
        fclose(fp);

        return 0;
}
