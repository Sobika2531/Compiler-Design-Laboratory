%{ 
        #include <stdio.h> 
%} 

%% 
ban(an)?(a)?    {printf("%s\n",yytext);} 
[a-zA-Z0-9]*ban(an)?(a)?[a-zA-Z0-9]*    {;} 
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
