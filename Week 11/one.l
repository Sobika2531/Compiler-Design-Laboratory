%{
        #include <stdio.h>
        #include <stdlib.h>

        extern int yylval;
%}

alpha [A-Za-z]
digit [0-9]

%%

[\t\n]|" "  {return DELIMITER;}

"int"   {ECHO; yylval=*yytext; return INT;}
"float"   {ECHO; yylval=*yytext; return FLOAT;}
"double"   {ECHO; yylval=*yytext; return DOUBLE;}
"if"   {ECHO; yylval=*yytext; return IF;}
"else"   {ECHO; yylval=*yytext; return ELSE;}
"for"   {ECHO; yylval=*yytext; return FOR;}
"while"   {ECHO; yylval=*yytext; return WHILE;}
"do"   {ECHO; yylval=*yytext; return DO;}
"switch"   {ECHO; yylval=*yytext; return SWITCH;}
"auto"   {ECHO; yylval=*yytext; return AUTO;}
"const"   {ECHO; yylval=*yytext; return CONST;}
"short"   {ECHO; yylval=*yytext; return SHORT;}
"struct"   {ECHO; yylval=*yytext; return STRUCT;}
"unsigned"   {ECHO; yylval=*yytext; return UNSIGNED;}
"break"   {ECHO; yylval=*yytext; return BREAK;}
"continue"   {ECHO; yylval=*yytext; return CONTINUE;}
"long"   {ECHO; yylval=*yytext; return LONG;}
"signed"   {ECHO; yylval=*yytext; return SIGNED;}
"void"   {ECHO; yylval=*yytext; return VOID;}
"case"   {ECHO; yylval=*yytext; return CASE;}
"default"   {ECHO; yylval=*yytext; return DEFAULT;}
"enum"   {ECHO; yylval=*yytext; return ENUM;}
"goto"   {ECHO; yylval=*yytext; return GOTO;}
"register"   {ECHO; yylval=*yytext; return REGISTER;}
"sizeof"   {ECHO; yylval=*yytext; return SIZEOF;}
"typedef"   {ECHO; yylval=*yytext; return TYPEDEF;}
"volatile"   {ECHO; yylval=*yytext; return VOLATILE;}
"char"   {ECHO; yylval=*yytext; return CHAR;}
"extern"   {ECHO; yylval=*yytext; return EXTERN;}
"return"   {ECHO; yylval=*yytext; return RETURN;}
"static"   {ECHO; yylval=*yytext; return STATIC;}
"union"   {ECHO; yylval=*yytext; return UNION;}

{digit}+   {ECHO; return UNUM;}
{digit}+("."{digit}+)?([Ee][+\-]?{digit}+)?     {ECHO; return RNUM;}
[+\-]?{digit}+  {ECHO; return SNUM;}
{alpha}+[{digit}_]*   {ECHO; return ID;}

";"     {ECHO; return SEMICOLON;}
"{"     {ECHO; return OPENBRACE;}
"}"     {ECHO; return CLOSEBRACE;}
"("     {ECHO; return OPENPARAN;}
")"     {ECHO; return CLOSEPARAN;}
"["     {ECHO; return OPENSQUARE;}
"]"     {ECHO; return CLOSESQUARE;}
"'"     {ECHO; return SINGLEQ;}
"\""     {ECHO; return DOUBLEQ;}
"="     {ECHO; return EQUAL;}
"++"     {ECHO; return INCRE;}
"--"     {ECHO; return DECRE;}
"|"     {ECHO; return BOR;}
"&"     {ECHO; return BAND;}
"!"     {ECHO; return NOT;}
"^"     {ECHO; return XOR;}
"+"     {ECHO; return PLUS;}
"-"     {ECHO; return MINUS;}
"*"     {ECHO; return ASTERISK;}
"/"     {ECHO; return SLASH;}
"%"     {ECHO; return MODULUS;}
"~"     {ECHO; return TILDE;}
"<<"     {ECHO; return LEFTS;}
">>"     {ECHO; return RIGHTS;}
"+="     {ECHO; return ADDAS;}
"-="     {ECHO; return SUBAS;}
"*="     {ECHO; return MULAS;}
"/="     {ECHO; return DIVAS;}
"%="     {ECHO; return MODAS;}
"<<="     {ECHO; return LSAS;}
">>="     {ECHO; return RSAS;}
"&="     {ECHO; return ANDAS;}
"^="     {ECHO; return XORAS;}
"|="     {ECHO; return ORAS;}
"?:"     {ECHO; return CONDOP;}
"<"     {ECHO; return LT;}
">"     {ECHO; return GT;}
"<="     {ECHO; return LE;}
">="     {ECHO; return GE;}
"=="     {ECHO; return EQ;}
"!="     {ECHO; return NE;}
"&&"     {ECHO; return LAND;}
"||"     {ECHO; return LOR;}

.       {return yytext[0];}

%%
