grammar Hello;

r : (ENCABEZADO|SEPARADORES|ENLACE|NEGRITA|CODIGO|CURSIVA|CITA|LISTAS|SALTOLINEA|IGNORE)+;

SALTOLINEA: '\n'{
    System.out.println("<BR>");
};

ENCABEZADO: '#'+ ~'\n'+ FINAL{
    String frase = getText();
    int numero_h = 0;
    while(frase.charAt(numero_h) == '#'){
        numero_h += 1;
    }
    if(numero_h > 6 || frase.charAt(numero_h) != ' '){
        System.out.print(frase);
        System.out.println("<BR>");
    }else{
        System.out.println("<H"+ numero_h +">" + frase.substring(numero_h+1, frase.length()-1) + "</H" + numero_h + ">" );
    }
};

NEGRITA: ('**' (~'*'|'*'~'*')+ '**' | '__' (~'_'|'_'~'_')+ '__'){
    String frase = getText();
    if(frase.charAt(2) == ' '){

    }
    System.out.print("<SPAN class=\"bold\">"+ getText().substring(2, getText().length()-2) +"</SPAN>");
};

CURSIVA: ('*' (~'*')+ '*'| '_' (~'_')+ '_'){
    System.out.print("<SPAN class=\"ital\">"+ getText().substring(1, getText().length()-1) +"</SPAN>");
};

CITA: '>'(~'\n')+ FINAL{
    String frase = getText();
    if(frase.charAt(1)!=' '){
        System.out.print(frase);
    }else{
        System.out.println("<blockquote>");
        System.out.print(frase.substring(2, frase.length()));
        System.out.println("</blockquote>");
    }
};

SEPARADORES: '\n'('---'|'___'|'***')FINAL{
    System.out.println();
    System.out.println("<HR/>");
};

fragment FINAL: '\n' | EOF;

CODIGO: '\n~~~\n' NOTRESVIRGULILLAS+ '\n~~~'FINAL{
    String frase = getText().replaceAll("~", "");
    System.out.println();
    System.out.println("<code> <pre>");
    System.out.println(frase.substring(2, frase.length()-2));
    System.out.println("</pre> </code>");
};
fragment NOTRESVIRGULILLAS: ~'\n' | '\n'~'~' | '\n~'~'~' | '\n~~'~'~';

ENLACE:'['(~']')+']('URL')'{
    String frase = getText().substring(getText().indexOf('[')+1, getText().indexOf(']'));
    String url = getText().substring(getText().indexOf('(')+1, getText().indexOf(')'));
    System.out.print("<A HREF=\"" + url + "\">" + frase +"</A>");
};

URL:('http'|'https')'://'PALABRA'.'(PALABRA'.'PALABRA)+;

LISTAS: ('- '(~'\n')+ '\n')+{
    String[] arrOfStr = getText().split("\n");

    if(arrOfStr.length >= 2){
        System.out.println("<UL>");
        for(String str:arrOfStr){
            System.out.println("<LI>" + str.substring(2) +"</LI>");
        }
        System.out.println("</UL>");

    }else{
        System.out.println("<UL><LI>" + arrOfStr[0].substring(2) + "</LI></UL>");
    }
};





fragment PALABRA : [a-zA-Z]+;

IGNORE : . {
System.out.print(getText());
};