grammar Hello;

/*
 1.hacer gramatica ll1
    X : Xa | b;
    --------
    X : b X'
    X': a X' | lambda;

 2.eliminar dir conjuntos

*/

prg: PROGRAM ID PUNTO_COMA blq PUNTO;
blq : dcllist BEGIN sentlist END;
dcllist : dclist_prima ;
dclist_prima: dcl dclist_prima | ;
//sentlist : sentlist sent | sent;
sentlist: sent sentlistprima;
sentlistprima: sent sentlistprima | ;
dcl : defcte | defvar | defproc | deffun;

defcte : CONST ctelist;
//ctelist : ctelist ID IGUAL simpvalue PUNTO_COMA | ID IGUAL simpvalue PUNTO_COMA;
ctelist : ID IGUAL simpvalue PUNTO_COMA ctelistprima;
ctelistprima : ctelist ID IGUAL simpvalue PUNTO_COMA ctelistprima | ;

simpvalue : NUMERIC_INTEGER_CONST | NUMERIC_REAL_CONST | STRING_CONST;
defvar : VAR defvarlist PUNTO_COMA;
//defvarlist : defvarlist PUNTO_COMA varlist DOS_PUNTOS tbas | varlist DOS_PUNTOS tbas;
defvarlist: varlist DOS_PUNTOS tbas defvarlistprima;
defvarlistprima: PUNTO_COMA varlist DOS_PUNTOS tbas defvarlistprima | ;

//varlist : ID | ID COMA varlist;
varlist : ID varlistprima;
varlistprima: COMA varlist | ;

defproc : PROCEDURE ID formal_paramlist PUNTO_COMA blq PUNTO_COMA;
deffun : FUNCTION ID formal_paramlist DOS_PUNTOS tbas PUNTO_COMA blq PUNTO_COMA;
formal_paramlist : | PARENTESIS_ABIERTO formal_param PARENTESIS_CERRADO;
//formal_param : varlist DOS_PUNTOS tbas | varlist DOS_PUNTOS tbas PUNTO_COMA formal_param;
formal_param : varlist DOS_PUNTOS tbas formal_paramprima;
formal_paramprima:  PUNTO_COMA formal_param | ;
tbas : INTEGER | REAL;

/*
sent : asig PUNTO_COMA | proc_call PUNTO_COMA
| IF expcond THEN blq ELSE blq
| WHILE expcond DO blq
| REPEAT blq UNTIL expcond PUNTO_COMA
| FOR ID ASIGNACION exp inc exp DO blq;
*/
sent : ID sentprima
| IF expcond THEN blq ELSE blq
| WHILE expcond DO blq
| REPEAT blq UNTIL expcond PUNTO_COMA
| FOR ID ASIGNACION exp inc exp DO blq;

sentprima: ASIGNACION exp | subpparamlist;
/*
sent: ID (asigprima | proccallprima) PUNTOCOMA |...

asigprima ASIGNACION exp;
proccallprima subparamlist;
*/

asig : ID ASIGNACION exp;

//exp : exp op exp | factor;
exp : factor expprima;
expprima : exp op exp expprima | ;

op : MAS | MENOS | ASTERISCO | DIV | MOD;
factor : simpvalue | PARENTESIS_ABIERTO exp PARENTESIS_CERRADO | ID subpparamlist;
subpparamlist : PARENTESIS_ABIERTO explist PARENTESIS_CERRADO | ;
//explist : exp | exp COMA explist;
explist : exp explistprima;
explistprima: COMA explist | ;
proc_call : ID subpparamlist;

// PARTE OPCIONAL

inc : TO | DOWNTO;
//expcond : expcond oplog expcond | factorcond;
expcond : factorcond expcondprima;
expcondprima : expcond oplog expcond expcondprima | ;

oplog : OR | AND;
//factorcond : exp opcomp exp | PARENTESIS_ABIERTO exp PARENTESIS_CERRADO | NOT factorcond| TRUE | FALSE;
factorcond : PARENTESIS_ABIERTO exp PARENTESIS_CERRADO | NOT factorcond| TRUE | FALSE |  simpvalue expprima | ID subpparamlist expprima;

opcomp : MENOR_QUE | MAYOR_QUE | MENOR_IGUAL_QUE | MAYOR_IGUAL_QUE | IGUAL;


// PALABRAS RESERVADAS

PROGRAM: 'PROGRAM'{ System.out.println(getText()); };
BEGIN: 'BEGIN'{ System.out.println(getText()); };
END: 'END'{ System.out.println(getText()); };
CONST: 'CONST'{ System.out.println(getText()); };
VAR: 'VAR'{ System.out.println(getText()); };
PROCEDURE: 'PROCEDURE'{ System.out.println(getText()); };
FUNCTION: 'FUNCTION'{ System.out.println(getText()); };
IF: 'IF'{ System.out.println(getText()); };
THEN: 'THEN'{ System.out.println(getText()); };
ELSE: 'ELSE'{ System.out.println(getText()); };
WHILE: 'WHILE'{ System.out.println(getText()); };
DO: 'DO'{ System.out.println(getText()); };
REPEAT: 'REPEAT'{ System.out.println(getText()); };
UNTIL: 'UNTIL'{ System.out.println(getText()); };
FOR: 'FOR'{ System.out.println(getText()); };
TO: 'TO'{ System.out.println(getText()); };
DOWNTO: 'DOWNTO'{ System.out.println(getText()); };
OR: 'OR'{ System.out.println(getText()); };
AND: 'AND'{ System.out.println(getText()); };
NOT: 'NOT'{ System.out.println(getText()); };
TRUE: 'TRUE'{ System.out.println(getText()); };
FALSE: 'FALSE'{ System.out.println(getText()); };
MENOR_QUE: '<'{ System.out.println(getText()); };
MAYOR_QUE: '>'{ System.out.println(getText()); };
MENOR_IGUAL_QUE: '<='{ System.out.println(getText()); };
MAYOR_IGUAL_QUE: '>='{ System.out.println(getText()); };

// TIPOS DE DATOS

INTEGER: 'integer'{ System.out.println(getText()); };
REAL: 'real'{ System.out.println(getText()); };

// SIMBOLOS

COMA: ','{ System.out.println(getText()); };
PUNTO_COMA: ';'{ System.out.println(getText()); };
PUNTO: '.'{ System.out.println(getText()); };
IGUAL: '='{ System.out.println(getText()); };
PARENTESIS_ABIERTO: '('{ System.out.println(getText()); };
PARENTESIS_CERRADO: ')'{ System.out.println(getText()); };
DOS_PUNTOS: ':'{ System.out.println(getText()); };

// OPERADORES

ASIGNACION: ':='{ System.out.println(getText()); };
MAS: '+'{ System.out.println(getText()); };
MENOS: '-'{ System.out.println(getText()); };
ASTERISCO: '*'{ System.out.println(getText()); };
DIV: 'DIV'{ System.out.println(getText()); };
MOD: 'MOD'{ System.out.println(getText()); };

// TOKENS IDENTIFICADORES

ID: [a-zA-Z_][a-zA-Z0-9_]*{
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


IGNORE: [\n\t\r ] -> skip;