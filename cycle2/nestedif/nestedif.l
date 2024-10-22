%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%


[\t ]+       ;   

\n           ;  


if           return IF;
else         return ELSE;
"<="         return LE;
">="         return GE;
"=="         return EQ;
"&&"         return AND;
"||"         return OR;
"!="         return NE;
[0-9]+       return NUM;             
[a-zA-Z][a-zA-Z0-9]* return ID;     
.            return yytext[0];      

%%

int yywrap() {
    return 1;
}


/*TO RUN
flex nestedif.l
yacc -d nestedif.y
gcc y.tab.c lex.yy.c -lfl
./a.out*/