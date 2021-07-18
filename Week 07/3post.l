%{
        #include <stdio.h>
        char stack[100],x;
        int top=-1;
        void push(char c);
        int pop();
        int priority(char c);
%}

%%

[a-zA-Z0-9]+    {printf("%s",yytext);}

"("     {push(yytext[0]);}

")"     {while((x=pop())!='(')
                printf("%c",x);
        }

"*"|"/"|"%"|"+"|"-"|"^" {x=yytext[0];
                        while(priority(stack[top])>=priority(x))
                                printf("%c",pop());

                        push(x);
                        }

\n      { while(top!=-1)
                printf("%c",pop());
        printf("\n\n");
        }
%%

int main(int argc,char* argv[])
{
        if(argc>1){
                FILE* fp=fopen(argv[1],"r");
                if(fp)
                        yyin=fp;
        }

        printf("infix to postfix:\n");
        yylex();
        return 0;
 }

int priority(char c)
{
        if(c=='(')
                return 0;
        if(c=='^')
                return 3;
        if(c=='+'||c=='-')
                return 1;
        if(c=='*'||c=='/'||c=='%')
                return 2;
}

void push(char c)
{
        stack[++top]=c;
}

int pop()
{
        return stack[top--];
}
