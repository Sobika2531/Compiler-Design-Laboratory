%{
    #include<stdio.h>
    #include<string.h>
    char stack[100], expr[100], output[100], c;
    int priority[256], top =0, i = 0, j = 0;
    void incomingOperator(char);
    void popInBetween();
%}

id [a-zA-Z][a-zA-Z0-9]*

%%

{id} {output[j++] = yytext[0]; }

\( {stack[top++] = yytext[0]; }

[-+*/] {incomingOperator(yytext[0]);}

\) {popInBetween(); }

%%

void incomingOperator(char a)
 {
    if(top == 0) {
        stack[top++] = a;
        return;
    }

    while(priority[a] <= priority[stack[top - 1]]) {
        output[j++] = stack[--top];

    }

    stack[top++] = a;
    return;
}

void popInBetween()
{
    while(stack[top - 1] != '(') {
        output[j++] = stack[--top];
    }

    top--;
    return;
}

int main()
{
    priority['('] = 0;
    priority['-'] = 1;
    priority['+'] = 2;
    priority['*'] = 3;
    priority['/'] = 4;

    FILE* fd = fopen("input3pre.txt","r");

    while((c = getc(fd)) != EOF)
        expr[i++] = c;

    expr[i] = '\0';

    fclose(fd);

    fd = fopen("output3pre.txt","w");

    for(int k = strlen(expr) - 1; k >= 0;k--)
    {
        if(expr[k] == '(')
                expr[k] = ')';

        else if(expr[k] == ')')
                expr[k] = '(';

        putc(expr[k],fd);
    }

    fclose(fd);

    yyin = fopen("output3pre.txt","r");
    yylex();

     while(top != 0) {
        output[j++] = stack[--top];
    }

    output[j] = '\0';
    printf("prefix expression:\n");

    for(int k = strlen(output) - 1; k >= 0; k--) {
        printf("%c",output[k]);
    }

    printf("\n");
    return 0;
}
