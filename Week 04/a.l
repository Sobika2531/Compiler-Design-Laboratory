%{ 
        #include <stdio.h> 
%} 

%% 
[a-zA-Z0-9]+    {printf("%s\n",yytext);} 
.|\n    {;} 
%% 

int yywrap() 
{ 
        return 1; 
} 

int main() 
{ 
        yyin=fopen("sample.txt","r"); 
        printf("valid strings:\n"); 
        yylex(); 
        return 0; 
} 
