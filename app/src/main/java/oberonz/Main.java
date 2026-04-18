package oberonz;

import oberonz.parser.OberonZeroSyntaxLexer;
import oberonz.parser.OberonZeroSyntaxParser;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;

public class Main {
    public static void main(String[] args) {
        try {
            var input = CharStreams.fromFileName(args[0]);
            var lexer = new OberonZeroSyntaxLexer(input);
            var tokens = new CommonTokenStream(lexer);
            var parser = new OberonZeroSyntaxParser(tokens);
            var tree = parser.module();

            System.out.println("----------------------------------------------------");
            System.out.println(tree.toStringTree(parser));
            System.out.println("----------------------------------------------------");
        }
        catch( Exception ex ) {
            System.err.println("Error: " + ex.getMessage());
        }
    }
}
