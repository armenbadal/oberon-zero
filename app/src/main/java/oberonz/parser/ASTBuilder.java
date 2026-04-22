package oberonz.parser;

import oberonz.ast.Node;

public class ASTBuilder extends OberonZeroBaseVisitor<Node> {
    @Override
    public Node visitVariable(OberonZeroParser.VariableContext ctx) {
        return null;
    }
}
