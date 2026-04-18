package oberonz.ast;

public sealed interface Expression
        extends Node
        permits IntegerLiteral, Variable, Designator {
}
