
%{
    #include <stdio.h>
    int valid = 1;
%}

%token DO WHILE LPAREN RPAREN STMT SEMICOLON NEWLINE

%%

start: do_while NEWLINE;

do_while:
    DO stmt WHILE LPAREN condition RPAREN SEMICOLON  // do-while syntax
    ;

condition:
    STMT op STMT
    ;
stmt:
STMT op STMT SEMICOLON
;

%%

int yyerror() {
    valid = 0;
    printf("Invalid syntax.\n");
    return 1;
}

void main() {
    printf("Enter the do-while loop:\n");
    yyparse();

    if (valid) {
        printf("Valid syntax.\n");
    }
}