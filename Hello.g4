grammar Hello;

r : (IGNORE| IDENTIFIER| NUMERIC_INTEGER_CONST | NUMERIC_REAL_CONST| STRING_CONST | COMENTARIO)+;

IDENTIFIER: [a-zA-Z_][a-zA-Z0-9_]*{
    System.out.println(getText());
};

NUMERIC_INTEGER_CONST: [+-]?[0-9]+{
    System.out.println(getText());
};

NUMERIC_REAL_CONST: [+-]?( CONST_REAL_PUNTO_FIJO | CONST_REAL_EXPONENCIAL | CONST_REAL_MIXTO){
    System.out.println(getText());
};

STRING_CONST: (COMILLAS_DOBLES|COMILLAS_SIMPLES) {
    String frase = getText();
    frase = frase.substring(1, frase.length()-1);
    frase = frase.replaceAll("\"\"", "\"");
    frase = frase.replaceAll("''", "'");
    System.out.println(frase);
};

COMENTARIO: (COMENTARIO_UNILINEA | COMENTARIO_MULTILINEA){
    System.out.println(getText());

};

fragment COMENTARIO_UNILINEA: '{'~[\r\n]+'}';
fragment COMENTARIO_MULTILINEA: '(*'(~'*' | '*'~')')+'*)';

fragment COMILLAS_DOBLES:'"'('""'| ~'"')+'"';
fragment COMILLAS_SIMPLES:'\''('\'\''| ~'\'')+'\'';

fragment CONST_REAL_PUNTO_FIJO: [0-9]+'.'[0-9]+;
fragment CONST_REAL_EXPONENCIAL: [0-9]+[eE][+-]?[0-9]+;
fragment CONST_REAL_MIXTO: CONST_REAL_PUNTO_FIJO[eE][+-]?[0-9]+;


IGNORE: [\n\t\r .] -> skip;