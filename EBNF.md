
PROGRAM       = { FUNCTION_DECLARATION | VARIABLE_DECLARATION | STATEMENT } ;

VARIABLE_DECLARATION = "seja" , IDENTIFIER , [ "=" , EXPRESSION ] , ";" ;

CONST_DECLARATION = "constante" , IDENTIFIER, "=", EXPRESSION , ";" ;

FUNCTION_DECLARATION = "funcao" , IDENTIFIER , "(" , [ PARAMETER { "," , PARAMETER } ] , ")" , "{" , [ STATEMENT ] , "}" ;

PARAMETER      = IDENTIFIER ;

STATEMENT      = ( ASSIGNMENT | CONDITIONAL | LOOP | FUNCTION_CALL | BLOCK ) , ";" ;

BLOCK          = "{" , { STATEMENT } , "}" ;

ASSIGNMENT     = IDENTIFIER , "=" , EXPRESSION ;

EXPRESSION     = OPERAND , { OPERATOR , OPERAND } ;

OPERAND        = IDENTIFIER | NUMBER ;

OPERATOR       = "+" | "-" | "*" | "/" ;

COMPARISON     = "==" | "!=" | "<" | ">" | "<=" | ">=" ;

CONDITIONAL    = "se" , "(" , EXPRESSION , COMPARISON , EXPRESSION , ")" , STATEMENT , [ "senao" , STATEMENT ] ;

LOOP           = ( "enquanto" | "para" ) , "(" , IDENTIFIER , "=" , EXPRESSION , COMPARISON , EXPRESSION , [ INCREMENT ] , ")" , STATEMENT ;

INCREMENT     = ( "++" | "--" ) ;

FUNCTION_CALL = IDENTIFIER , "(" , [ EXPRESSION { "," , EXPRESSION } ] , ")" ;

IDENTIFIER  = CHARACTER , { CHARACTER | DIGIT | "_" } ;

NUMBER         = DIGIT , { DIGIT } ;

CHARACTER          = "a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" ;

DIGIT         = "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" ;