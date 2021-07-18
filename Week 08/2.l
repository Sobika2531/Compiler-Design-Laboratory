%{
        #include<stdio.h>
%}

%option noyywrap

%%

[a-z] {printf("%s",yytext);}

"+" {printf(" || ");}

"*" {printf(" && ");}

%%

int main(){
        FILE* fptr;
        fptr = fopen("2.txt","r");
        if(fptr)
                yyin = fptr;

        yylex();

        return 0;
}
