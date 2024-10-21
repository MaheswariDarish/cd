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

// Function to handle end of input
int yywrap() {
    return 1; // Indicates no more input
}

int main() {
    yylex(); // Start the lexer
    return 0;
}
