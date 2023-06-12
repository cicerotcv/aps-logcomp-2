
PROGRAM       = { FUNCTION_DECLARATION | STATEMENT } ;

VARIABLE_DECLARATION = "seja" , IDENTIFIER , "=" , EXPRESSION , ";" ;

CONST_DECLARATION = "constante" , IDENTIFIER, "=", EXPRESSION , ";" ;

FUNCTION_DECLARATION = "funcao" , IDENTIFIER , "(" , [ PARAMETER { "," , PARAMETER } ] , ")" , "{" , [ STATEMENT ] , "}" ;

PARAMETER      = IDENTIFIER ;

STATEMENT      = ( ASSIGNMENT | VARIABLE_DECLARATION | CONST_DECLARATION | FUNCTION_DECLARATION | CONDITIONAL | LOOP | FUNCTION_CALL | BLOCK | RETURN ) , ";" ;

BLOCK          = "{" , { STATEMENT } , "}" ;

ASSIGNMENT     = IDENTIFIER , "=" , EXPRESSION ;

REL_EXPRESSION = EXPRESSION { COMPARISON, EXPRESSION } ;
EXPRESSION     = TERM , { OPERATOR , TERM } ;
TERM           = FACTOR , { PRIORITY_OP, FACTOR } ;
FACTOR         = NUMBER | BOOLEAN | STRING | OPERATOR , { FACTOR } | IDENTIFIER | "(" , FACTOR, ")" ;

OPERATOR       = "+" | "-" ;

PRIORITY_OP    = "\*" | "/" ;

COMPARISON     = "==" | "<" | ">" ;

CONDITIONAL    = "se" , "(" , REL_EXPRESSION , ")" , BLOCK , [ "senao" , BLOCK ] ;

LOOP           = "enquanto" , "(" , REL_EXPRESSION, ")" , BLOCK ;

FUNCTION_CALL  = IDENTIFIER , "(" , \[ REL_EXPRESSION { "," , REL_EXPRESSION } \] , ")" ;

IDENTIFIER     = CHARACTER , { CHARACTER | DIGIT | "\_" } ;

NUMBER         = DIGIT , { DIGIT } ;

BOOLEAN        = "verdadeiro" | "falso" ;

STRING         = '"' , { CHARACTER }, '"' ;

CHARACTER      = "a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" ;

DIGIT          = "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" ;
