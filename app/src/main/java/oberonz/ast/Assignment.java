package oberonz.ast;

public record Assignment(Designator designator, Expression value) implements Statement {
}
