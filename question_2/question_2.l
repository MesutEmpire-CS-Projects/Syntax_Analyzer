%{
#include "question_2.tab.h"
extern int yylex(void);

int a_count = 0;
%}

%%

a       { a_count++; return A; }
b       { return B; }
.       { /* Ignore other characters */ }

%%

int yywrap() {
    return 1;
}