
%{
    #include "y.tab.h"
%}

%%

"do"                return DO;
"while"             return WHILE;
"("                 return LPAREN;
")"                 return RPAREN;
";"                 return SEMICOLON;
"=="|">="|     return op;
[a-zA-Z0-9]+        return STMT;
\n                  return NEWLINE;
[ \t]               ;   // Ignore whitespace
.                   ;   // Ignore other characters

%%

int yywrap() {
    return 1;
}