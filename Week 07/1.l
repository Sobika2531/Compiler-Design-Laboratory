%{
        #include <stdio.h>
        #include <stdlib.h>
        char init1[20],init2[20],cond1[20],cond2[20],incre1[20],incre2[20],state1[100],state2[100];
        int init=1,cond=0,incre=0,sccount=0,state=0;
%}

%%

"for ("|"for("  {if(init==1){
                        printf("outer for loop found\n");
                        init1[0]='\0';
                        cond1[0]='\0';
                        incre1[0]='\0';
                }
                else{
                        printf("\ninner for loop found\n");
                        init2[0]='\0';
                        cond2[0]='\0';
                        incre2[0]='\0';
                }
                }

;               {sccount++;
                switch(sccount){
                case 1:printf("initiation 1 found;");
                        init=0;
                        cond=1;
                        break;
                case 2:printf("condition 1 found;");
                        cond=0;
                        incre=1;
                        break;
                case 3:printf("initiation 2 found;");
                        init=0;
                        cond=2;
                        break;
                case 4:printf("condition 2 found;");
                        cond=0;
                        incre=2;
                        break;
                case 5:state=2;
                        break;
                case 6:state=0;
                        break;
                default: printf("error");
                }
                }

") {"|"){"      {if(incre==1){
                        printf("increment 1 found;");
                        incre=0;
                        init=2;
                }
                if(incre==2){
                        printf("increment 2 found;");
                        incre=0;
                        state=1;
                }
                }

"}"             {if(state==2)
                        printf("\n\nbody of inner loop found");
                else
                        printf("\nbody of outer loop found\n");
                }

\n|\t           {}

.               {if(init==1)
                        strcat(init1,yytext);
                else if(cond==1)
                         strcat(cond1,yytext);
                else if(incre==1)
                         strcat(incre1,yytext);
                else if(init==2)
                        strcat(init2,yytext);
                else if(cond==2)
                         strcat(cond2,yytext);
                else if(incre==2)
                         strcat(incre2,yytext);
                else if(state==1)
                        strcat(state1,yytext);
                else if(state==2)
                        strcat(state2,yytext);
                else{
                        printf("error..\n");
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

        FILE* fp=fopen("output1.txt","w");

        fprintf(fp,"%s;\n%s;\nwhile(%s){\nwhile(%s){\n%s;\n%s;\n}\n%s;\n%s;}\n",init1,init2,cond1,cond2,state1,incre1,state2,incre2);

        fclose(fp);
        return 0;
}
