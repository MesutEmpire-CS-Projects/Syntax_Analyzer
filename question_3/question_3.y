%{
#include <stdio.h>
void yyerror(char *s);
int yylex(void);
%}

%token NUMBER

/* Define operator precedence and associativity */
%left '+' '-'       /* left associative, same precedence */

%%
program:
        program expr '\n'    { printf("%d\n", $2); }
        |
        ;

expr:   NUMBER              { $$ = $1; }
        | expr '+' expr     { $$ = $1 + $3; }
        | expr '-' expr     { $$ = $1 - $3; }
        | '(' expr ')'      { $$ = $2; }    /* Add support for parentheses */
        ;
%%

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Enter expressions (e.g., 5+3-2):\n");
    yyparse();
    return 0;
}