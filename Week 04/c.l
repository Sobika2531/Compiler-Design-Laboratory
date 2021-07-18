%{ 
        #include <stdio.h> 
%} 

%% 
[bceg-zBCEG-Z]    {printf("%s\n",yytext);} 
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
