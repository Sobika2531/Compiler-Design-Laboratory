%option noyywrap
%{
        #include<stdio.h>
        #include<string.h>
        #include<stdlib.h>

        char condition1[200], condition2[200];
        char statement1[200], statement2[200], statement3[200];
        char stuff_inside_loop[500];

        int i,j;

        void removeChar(char* str, char rem)
        {
                for(i=0; i<strlen(str); i++)
                {
                        if(str[i] == rem)
                        {
                                for(j = i; j<= strlen(str); j++)
                                {
                                        str[j] = str[j+1];
                                }
                        }
                }
        }
%}

%s S1
%s S2
%s S3
%s S4
%s S5
%s S6


%%
<INITIAL>("if(") {
        BEGIN S1;
}

<S1>([^)]*) {
        strcpy(condition1, yytext);
        printf("do{\n");
        BEGIN S2;
}

<S2>("{".*"}") {
        strcpy(statement1, yytext);
        printf("\t%s\n",statement1);
        BEGIN S3;
}

<S3>("(".*")") {
        strcpy(condition2, yytext);
        printf("\tdo{\n");
        BEGIN S4;
}

<S4>("{".*"}") {
        strcpy(statement2, yytext);
        printf("\t%s\n",statement2);
        BEGIN S5;
}

<S5>("else") {
        printf("\t}while(%s);\n",condition2);
        BEGIN S6;
}

<S6>("{".*"}") {
        strcpy(statement3, yytext);
        printf("\n\t%s\n",statement3);
        printf("\n}while(%s);\n",condition1);
}

. ;

%%
int main()
{
        yyin = fopen("2.txt","r");

        yylex();

        return 0;
}
