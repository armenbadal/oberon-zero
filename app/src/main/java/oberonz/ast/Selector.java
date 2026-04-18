package oberonz.ast;

public sealed interface Selector extends Node {
    record Field(String name) implements Selector {}
    record Index(Expression value) implements Selector {}
}
