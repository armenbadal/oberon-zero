package oberonz.ast;

public record Designator(Variable variable, Selector[] selectors) implements Expression {
}
