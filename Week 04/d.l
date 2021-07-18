//d.Matches all characters except “ a, b, or c”, including all special or control characters

%{ 
        #include <stdio.h> 
%} 

%% 
[^abcABC]    {printf("%s\n",yytext);} 
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
