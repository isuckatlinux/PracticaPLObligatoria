grammar Hello;

r : (IGNORE| IDENTIFIER| NUMERIC_INTEGER_CONST | NUMERIC_REAL_CONST)+;

IDENTIFIER: [a-zA-Z_][a-zA-Z0-9_]*{
    System.out.println(getText());
};

NUMERIC_INTEGER_CONST: [+-]?[0-9]+{
    System.out.println(getText());
};

NUMERIC_REAL_CONST: [+-]?( CONST_REAL_PUNTO_FIJO | CONST_REAL_EXPONENCIAL | CONST_REAL_MIXTO){
    System.out.println(getText());
};

fragment CONST_REAL_PUNTO_FIJO: [0-9]+'.'[0-9]+;
fragment CONST_REAL_EXPONENCIAL: [0-9]+[eE][+-]?[0-9]+;
fragment CONST_REAL_MIXTO: CONST_REAL_PUNTO_FIJO[eE][+-]?[0-9]+;


IGNORE: [\n\t\r ] -> skip;