#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

char *input;  // Pointer to the input string

// Function prototypes for parsing grammar rules
int E(); // Expression
int T(); // Term
int F(); // Factor

void error() {
    printf("Parsing error!\n");
    exit(1);
}

// Helper function to consume expected character
void match(char expected) {
    if (*input == expected) {
        input++;
    } else {
        error();
    }
}

// Grammar: E -> T ('+' T)*
int E() {
    int value = T();
    while (*input == '+') {
        match('+');
        value += T();
    }
    return value;
}

// Grammar: T -> F ('*' F)*
int T() {
    int value = F();
    while (*input == '*') {
        match('*');
        value *= F();
    }
    return value;
}

// Grammar: F -> '(' E ')' | digit
int F() {
    if (*input == '(') {
        match('(');
        int value = E();
        match(')');
        return value;
    } else if (isdigit(*input)) {
        int value = *input - '0';
        match(*input);  // Match the digit
        return value;
    } else {
        error();
    }
    return 0; // Should not reach here
}

// Main function
int main() {
    char expression[100];
    printf("Enter an arithmetic expression: ");
    scanf("%s", expression);

    input = expression;
    int result = E();

    // Ensure no remaining characters in the input
    if (*input == '\0') {
        printf("Result: %d\n", result);
    } else {
        error();
    }
    return 0;
}
