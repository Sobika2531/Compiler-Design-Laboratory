%{
        #include<stdio.h>
        #include<stdlib.h>
        char result[300],dec1[10],dec2[10],con1[10],con2[10],inc1[10],inc2[10];
%}

%s S1
%s S2
%s S3
%s S4
%s S5
%s S6
%s S7

%option noyywrap

%%

<INITIAL>("for(") {
                  BEGIN S1;
                  }

<S1>([a-z]*"="[0-9]*";") {
        strcat(result,"for(int ");
        strcpy(dec1,yytext);
        BEGIN S2;
              }

<S2>([a-z]*[<|<=|>|>=|==|!=][0-9]*";") {
        strcpy(con1,yytext);
        BEGIN S3;
        }


<S3>([a-z]*"++""){") {
        strcpy(inc1,yytext);
        BEGIN S4;
        }

<S3>("for(") {
        BEGIN S4;
        }

<S4>([a-z]*"="[0-9]*";") {
        strcpy(dec2,yytext);
        BEGIN S5; }

<S5>([a-z]*[<|<=|>|>=|==|!=][0-9]*";") {
        strcpy(con2,yytext);
        BEGIN S6; }

<S6>([a-z]*"++""){") {
        strcat(result,dec1);
        result[strlen(result)-1] = ',';
        strcat(result,dec2);
        strcat(result,con1);
        result[strlen(result)-1] = '\0';
        strcat(result," && ");
        strcat(result,con2);
        strcat(result,inc1);
        result[strlen(result)-2] = ',';
        result[strlen(result)-1] = '\0';
        strcat(result,yytext);
        BEGIN S7;
          }

<S7>(.*";") {
        strcat(result,"\n\t");
        strcat(result,yytext);
        strcat(result,"\n}\n");
        BEGIN INITIAL;
        }
. ;

\n ;

%%

int main() {
        FILE *fp = fopen("3.txt","r");
        if(fp){
                yyin=fp;
        }

        yylex();

        printf("%s\n",result);
        return 0;
}
