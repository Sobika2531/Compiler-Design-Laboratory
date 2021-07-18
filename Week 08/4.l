%{
        #include<stdio.h>
        #include<stdlib.h>
        char result[300],stat1[50],inc2[10];
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

<INITIAL>("if(") {
                  BEGIN S1;
                  }

<S1>([a-z]*"!""="[a-z]*")") {
        strcat(result,"if(");
        strcat(result,yytext);
        result[strlen(result)-1] = '\0';
        BEGIN S2;
         }

<S2>(.*";") {
        BEGIN S3;
        }

<S3>("if(") {
        strcat(result," && ");
        BEGIN S4;
        }

<S4>([a-z]*[==|!=|>|<|>=|<=][a-z0-9]*")""{") {
        strcat(result,yytext);
        BEGIN S5; }

<S5>(.*";") {
        strcat(result,"\n\t");
        strcat(result,yytext);
        strcat(result,"\n}\n");
        BEGIN S6; }

<S6>("else{") {
        strcat(result,yytext);
        BEGIN S7;
          }

<S7>(.*";") {
        strcat(result,"\n\t");
        strcat(result,yytext);
        strcat(result,"\n}\n");
        BEGIN INITIAL;
        }

.|\n ;

%%

int main() {
        FILE *fptr = fopen("4.txt","r");
        if(fptr){
                yyin=fptr;
        }

        yylex();

        printf("%s\n",result);
        return 0;
}
