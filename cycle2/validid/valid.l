%{
#include <stdio.h>
%}

%%
[a-zA-Z][_a-zA-Z0-9]* {
    printf("valid id\n");
}
[0-9][_a-zA-Z0-9]* {
    printf("invalid id\n");
}
%%

int yywrap() {
    return 1; 
}

int main() {
    yylex(); 
    return 0;
}
