grammar OberonZeroSyntax;

@header{
package oberonz.parser;
}

program
    : module EOF
    ;

module
    : KW_MODULE IDENT ';' declarations (KW_BEGIN sequence)? KW_END IDENT '.'
    ;

declarations
    : constants? types? variables? procedures?
    ;

constants
    : KW_CONST (IDENT '=' expression ';')+
    ;

types
    : KW_TYPE (IDENT '=' type ';')+
    ;

type
    : IDENT
    | KW_ARRAY expression? KW_OF type
    | KW_RECORD (fields (';' fields)*)? KW_END
    ;

fields
    : identlist ':' type
    ;

variables
    : KW_VAR (identlist ':' type ';')+
    ;

procedures
    : (procedure ';')+
    ;

procedure
    : KW_PROCEDURE IDENT (parameters (':' type)?)? ';'
      declarations (KW_BEGIN sequence)? KW_END IDENT
    ;

parameters
    : '(' (parameter (',' parameter)*)? ')'
    ;

parameter
    : KW_VAR? identlist ':' type
    ;

sequence
    : statement (';' statement)*
    ;

statement
    : IDENT selector? ':=' expression
    | IDENT selector? arguments?
    | KW_IF expression KW_THEN sequence
      (KW_ELSIF expression KW_THEN sequence)*
      (KW_ELSE sequence)? KW_END
    | KW_WHILE expression KW_DO sequence KW_END
    ;

selector
    : ('.' IDENT | '[' expression ']')+
    ;

arguments
    : '(' (expression (',' expression)*)? ')'
    ;

identlist
    : IDENT (',' IDENT)*
    ;

expression
    : simple (('='|'#'|'<'|'<='|'>'|'>=') simple)?
    ;

simple
    : ('+'|'-')? term (('+'|'-'|KW_OR) term)*
    ;

term
    : factor (('*'|'/'|KW_DIV|KW_MOD|KW_AND) factor)*
    ;

factor
    : IDENT selector?
    | IDENT selector? arguments?
    | INTEGER
    | '(' expression ')'
    | '~' factor
    ;

KW_MODULE: 'MODULE';
KW_BEGIN: 'BEGIN';
KW_END: 'END';
KW_PROCEDURE: 'PROCEDURE';
KW_CONST: 'CONST';
KW_TYPE: 'TYPE';
KW_VAR: 'VAR';
KW_ARRAY: 'ARRAY';
KW_OF: 'OF';
KW_RECORD: 'RECORD';
KW_IF: 'IF';
KW_THEN: 'THEN';
KW_ELSIF: 'ELSIF';
KW_ELSE: 'ELSE';
KW_WHILE: 'WHILE';
KW_DO: 'DO';
KW_AND: 'AND';
KW_OR: 'OR';
KW_DIV: 'DIV';
KW_MOD: 'MOD';

INTEGER: [0-9]+;
IDENT : [a-zA-Z][a-zA-Z0-9]*;
SPACES: [ \t\n\r] -> skip;
COMMENT: '{' '}' -> skip;