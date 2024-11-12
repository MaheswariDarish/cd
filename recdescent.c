#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char ip_sym[15];
int ip_ptr = 0; // To track the position in the input
char op[50];    // To store the parsing operations

void advance();
void e();
void e_prime();
void t();
void t_prime();
void f();

void e() {
    strcpy(op, "TE'");
    printf("E = %-25s", op);
    printf("E -> TE'\n");
    t();
    e_prime();
}

void e_prime() {
    if (ip_sym[ip_ptr] == '+') {
        advance();
        strcpy(op, "TE' -> + TE'");
        printf("E' = %-25s", op);
        printf("E' -> +TE'\n");
        t();
        e_prime();
    } else {
        strcpy(op, "e");
        printf("E' = %-25s", op);
        printf("E' -> e\n");
    }
}

void t() {
    strcpy(op, "FT'");
    printf("T = %-25s", op);
    printf("T -> FT'\n");
    f();
    t_prime();
}

void t_prime() {
    if (ip_sym[ip_ptr] == '*') {
        advance();
        strcpy(op, "FT' -> * FT'");
        printf("T' = %-25s", op);
        printf("T' -> *FT'\n");
        f();
        t_prime();
    } else {
        strcpy(op, "e");
        printf("T' = %-25s", op);
        printf("T' -> e\n");
    }
}

void f() {
    if (ip_sym[ip_ptr] == 'i') {
        advance();
        strcpy(op, "i");
        printf("F = %-25s", op);
        printf("F -> i\n");
    } else if (ip_sym[ip_ptr] == '(') {
        advance();
        e();
        if (ip_sym[ip_ptr] == ')') {
            advance();
            strcpy(op, "(E)");
            printf("F = %-25s", op);
            printf("F -> (E)\n");
        } else {
            printf("\nSyntax error: Expected ')'\n");
            exit(1);
        }
    } else {
        printf("\nSyntax error: Unexpected symbol '%c'\n", ip_sym[ip_ptr]);
        exit(1);
    }
}

void advance() {
    ip_ptr++;
}

int main() {
    printf("\nGrammar without left recursion:\n");
    printf("  E  -> TE' \n  E' -> +TE' | e \n  T  -> FT' \n");
    printf("  T' -> *FT' | e \n  F  -> (E) | i\n");

    printf("\nEnter the input expression: ");
    scanf("%s", ip_sym);

    printf("\nParsing Steps:\n");
    e();

    if (ip_ptr == strlen(ip_sym)) {
        printf("\nInput expression is valid.\n");
    } else {
        printf("\nSyntax error at position %d\n", ip_ptr);
    }

    return 0;
}
