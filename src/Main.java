import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.*;
public class Main {
    public static void main(String[] args) {
        try{
            PrintStream o = new PrintStream(new File("output.html"));
            System.setOut(o);

            mostrarPrincipio();
            CharStream input = CharStreams.fromFileName(args[0]);
            HelloLexer analex = new HelloLexer(input);
            CommonTokenStream tokens = new CommonTokenStream(analex);
            HelloParser anasint = new HelloParser(tokens);
            anasint.r();
            mostrarFinal();
        } catch (org.antlr.v4.runtime.RecognitionException e) {
            System.err.println("REC " + e.getMessage());
        } catch (IOException e) {
            System.err.println("IO " + e.getMessage());
        } catch (java.lang.RuntimeException e) {
            System.err.println("RUN " + e.getMessage());
        }
    }

    public static void mostrarPrincipio(){
        System.out.println("<!DOCTYPE html>\n" +
                "<html>\n" +
                "<head>\n" +
                "   <title>MarkDown2HTML</title>\n" +
                "<style>\n" +
                "   .bold {font-weight: bold;}\n" +
                "   .ital {font-style: italic;} </style>\n" +
                "</head>\n" +
                "<body>");
    }

    public static void mostrarFinal(){
        System.out.println("</body>\n" +
                "</html>");
    }

}
