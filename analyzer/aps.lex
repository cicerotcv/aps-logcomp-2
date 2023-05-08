%{
#include <stdio.h>
#include <string.h>
%}

%%

","             { return COMMA; }
";"             { return SEMICOLON; }

"+"             { return PLUS; }
"-"             { return MINUS; }
"/"             { return DIV; }
"*"             { return MULT; }
"="             { return ASSIGN; }

"("             { return OPENING_BRACKET; }
")"             { return CLOSING_BRACKET; }
"{"             { return OPENING_CURLY_BRACKET; }
"}"             { return CLOSING_CURLY_BRACKET; }

">"                       { return LOG_GT; }
">="                      { return LOG_GE; }
"<"                       { return LOG_LT; }
"<="                      { return LOG_LE; }
"&&"                      { return LOG_AND; }
"!"                       { return LOG_NOT; }
"||"                      { return LOG_OR; }
"=="                      { return LOG_EQ; }
"!="                      { return LOG_NEQ; }

"entrada"                   { return READ; }
"saida"                     { return WRITE; }
"enquanto"                  { return WHILE; }
"se"                        { return IF; }
"senao"                     { return ELSE; }
"funcao"                     { return FUNCTION; }


[ "seja", "constante" ]   { return IDENTIFIER_DESCRIPTOR }
[1-9][0-9]*               { return NUMBER; }
[A-z_][0-9A-z_]+          { return IDENTIFIER; }


%%
