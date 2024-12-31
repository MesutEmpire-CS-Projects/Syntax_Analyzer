%{
#include <stdio.h>
#include "question_2.tab.h"
extern int yylex(void);
extern int a_count;
void yyerror(const char *s);
%}

%token A B

%%

S:   A S    { a_count++; }
   | B      { printf("Number of 'a's: %d\n", a_count); }

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}
