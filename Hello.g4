grammar Hello;

r : (IGNORE)+;

IDENTIFIER: [a-zA-Z_][a-zA-Z0-9_]*{
    System.out.println(getText());
};

IGNORE: [\n\t\r ]+;