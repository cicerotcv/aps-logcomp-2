%{
#include <stdio.h>

void yyerror(char *c);
int yylex(void);
%}

/* separators */
%token COMMA SEMICOLON

/* special tokens */
%token NUMBER RETURN IDENTIFIER IDENTIFIER_DESCRIPTOR

/* operations */
%token PLUS MINUS MULT DIV ASSIGN

/* delimiters */
%token OPENING_BRACKET CLOSING_BRACKET 
%token OPENING_CURLY_BRACKET CLOSING_CURLY_BRACKET

/* logical operations */
%token LOG_GT LOG_GE LOG_LT LOG_LE
%token LOG_AND LOG_OR 
%token LOG_EQ LOG_NEQ LOG_NOT

/* reserved words */
%token WRITE READ WHILE IF ELSE FUNCTION


%start TOP_LEVEL

%%
empty: ;

TOP_LEVEL : STATEMENT;

statement_options : empty
                  | FUNCTION_DECLARATION
                  | IDENTIFIER_DECLARATION
                  | FUNCTION_CALL
                  | ASSIGNMENT
                  | BLOCK
                  | WHILE_STATEMENT
                  | IF_STATEMENT 
                  ;

STATEMENT : statement_options SEMICOLON ;

BLOCK : OPENING_CURLY_BRACKET STATEMENT CLOSING_CURLY_BRACKET ;

IDENTIFIER_DECLARATION  : IDENTIFIER_DESCRIPTOR IDENTIFIER ;

function_params : empty
                | IDENTIFIER
                | COMMA function_params
                ;

function_return : RETURN EXPRESSION ;

function_body : OPENING_CURLY_BRACKET STATEMENT CLOSING_CURLY_BRACKET 
              | OPENING_BRACKET STATEMENT function_return CLOSING_CURLY_BRACKET
              ;

FUNCTION_DECLARATION : FUNCTION IDENTIFIER OPENING_BRACKET function_params CLOSING_BRACKET function_body ;

function_args : empty
              | EXPRESSION
              | COMMA function_args
              ;
 
FUNCTION_CALL : IDENTIFIER OPENING_BRACKET function_args CLOSING_BRACKET ;

FACTOR  : NUMBER
        | IDENTIFIER
        | UN_OP FACTOR
        | OPENING_BRACKET CONDITIONAL CLOSING_BRACKET
        ;

TERM  : FACTOR 
      | TERM PRIOR_BIN_OP FACTOR ;

EXPRESSION  : TERM 
            | EXPRESSION BIN_OP TERM ;

CONDITIONAL : EXPRESSION 
            | CONDITIONAL LOGICAL_OP EXPRESSION ;

WHILE_STATEMENT : WHILE OPENING_BRACKET CONDITIONAL CLOSING_BRACKET BLOCK ;

IF_STATEMENT  : IF OPENING_BRACKET CONDITIONAL CLOSING_BRACKET BLOCK ELSE BLOCK
              | IF OPENING_BRACKET CONDITIONAL CLOSING_BRACKET BLOCK
              ;

ASSIGNMENT  : IDENTIFIER ASSIGN CONDITIONAL ;

PRIOR_BIN_OP  : MULT
              | DIV
              | LOG_AND
              ;

BIN_OP  : LOG_OR
        | MINUS
        | PLUS
        ;

UN_OP : LOG_NOT 
      | MINUS
      | PLUS
      ;

LOGICAL_OP  : LOG_AND
            | LOG_OR
            | LOG_EQ
            | LOG_NEQ
            | LOG_GE
            | LOG_GT
            | LOG_LE
            | LOG_LT
            ;

%%

void yyerror(char *c) {
    printf("Erro: %s\n", c);
}

int main() {
    yyparse();
    return 0;
}