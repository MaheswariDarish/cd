%{
#include <stdio.h>
%}

%%
[a-zA-Z0-9]*[Mm][Aa][Hh][Ii][a-zA-Z0-9]* { 
    printf("substring mahi present\n"); 
}
.* { 
    printf("nopeeeeeee :)\n"); 
}

%%

int yywrap() {
    return 1; 
}

int main() {
    yylex(); 
    return 0;
}
