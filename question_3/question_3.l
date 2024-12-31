%{
#include "question_3.tab.h"
#include <stdlib.h>
extern int yylex(void);
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[-+]        { return *yytext; }
[ \t]       ; /* skip whitespace */
\n          { return '\n'; }
.           { return *yytext; }
%%

int yywrap(void) {
    return 1;
}