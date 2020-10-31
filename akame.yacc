/* calculator.y */

%{
    #include <stdio.h>
%}

%token STRING
%token MAIN
%token ASSIGNMENT
%token NEWLINE
%token IS_EQUAL
%token MINUS
%token PLUS
%token IF
%token ELSE
%token ELSE_IF
%token COMMENT
%token HASHTAG
%token DIGIT
%token LPAR
%token RPAR
%token LBRACKET
%token RBRACKET
%token FOR
%token DO
%token WHILE
%token GREATER
%token LESS
%token GTE
%token LTE
%token NOT_EQUAL
%token SEMICOLON
%token DOT
%token COMMA
%token COLON
%token MULT
%token DIV
%token OR
%token AND
%token RETURN
%token PRINT
%token NOT
%token EXPONENT

%token READINC
%token READALT
%token READTEMP
%token READACCEL
%token TOGGLECAMERA
%token TAKEPIC
%token READTS
%token INPUT
%token OUTPUT
%token CONNECT

%token INT_TYPE
%token FLOAT_TYPE
%token DOUBLE_TYPE
%token VOID
%token BOOLEAN_TYPE
%token CHAR_TYPE

%token LOWERCASE
%token UPPERCASE
%token TRUE
%token FALSE
%token BOOLEAN
%token ALPHANUMERIC
%token IDENTIFIER
%token INTEGER
%token FLOAT


%start program
%%

program:
        main

main:
    MAIN LPAR RPAR LBRACKET stmt_list RBRACKET

stmt_list:
                stmt
                | stmt_list stmt


stmt:
                assignment_stmt SEMICOLON
                | if_stmt SEMICOLON
                | while_stmt SEMICOLON
                | for_stmt SEMICOLON
                | func_call SEMICOLON
                | decl_stmt SEMICOLON
                | func_def_stmt SEMICOLON
                | input_stmt SEMICOLON
                | output_stmt SEMICOLON

//statements:
assignment_stmt:
                ident_list IS_EQUAL expr
                | ident_list IS_EQUAL func_call
                | ident_list IS_EQUAL primitive_func


if_stmt:        matched_if
                | unmatched_if

matched_if:     IF logic_exp ELSE_IF matched_if ELSE matched_if
                | stmt

unmatched_if:   IF logic_exp ELSE_IF stmt
                | IF logic_exp ELSE_IF matched_if ELSE unmatched_if

while_stmt:     WHILE LPAR expr|logic_exp|func_call|primitive_func RPAR stmt_list //check syntax here!

for_stmt:       FOR LPAR expr SEMICOLON expr SEMICOLON expr RPAR stmt_list

func_call:      ident LPAR args RPAR

args:           type_ident ident
                | type_ident ident COMMA args
                | "" //empty

decl_stmt:      type_ident ident_list

func_def_stmt:  type_ident func_call stmt_list

input_stmt:     INPUT LPAR ident RPAR

output_stmt:    OUTPUT LPAR STRING|ident|func_call|primitive_func RPAR // ******** burayı da kontrol et ********
//end of statements

type_ident:     INT_TYPE
                | FLOAT_TYPE
                | CHAR_TYPE
                | VOID

ident_list:     ident
                | ident COMMA ident_list


primitive_func: ident DOT READINC LPAR RPAR SEMICOLON
                | ident DOT READALT LPAR RPAR SEMICOLON
                | ident DOT READTEMP LPAR RPAR SEMICOLON
                | ident DOT READACCEL LPAR RPAR SEMICOLON
                | ident DOT TOGGLECAMERA LPAR RPAR SEMICOLON
                | ident DOT TAKEPIC LPAR RPAR SEMICOLON
                | ident DOT READTS LPAR RPAR SEMICOLON
                | ident DOT CONNECT LPAR RPAR SEMICOLON
//end of statements



//expressions

logic_exp:      logic_exp_or
                | logic_exp IS_EQUAL logic_exp_or
                | logic_exp NOT_EQUAL logic_exp_or
                | logic_exp GREATER logic_exp_or
                | logic_exp LESS logic_exp_or
                | logic_exp GTE logic_exp_or
                | logic_exp LTE logic_exp_or

logic_exp_or:    logic_exp OR logic_exp_and
                | logic_exp_and

logic_exp_and:  logic_exp_and AND logic_exp_not
                | logic_exp_not

logic_exp_not:   NOT logic_exp_p | logic_exp_p

logic_exp_p:     LPAR logic_exp RPAR | BOOLEAN

expr:            expr PLUS term
                | expr MINUS term
                | term

term:            term MULT term
                | term DIV factor
                | factor

factor:         idc EXPONENT factor  //** is exponentiation
                |  idc

idc:            ident
                //| INT_CONST şimdilik kalsın
                | LPAR expr RPAR

//end of expressions


ident_list:
                ident
                | ident ident_list

ident:
                ALPHANUMERIC
                | ident ALPHANUMERIC



%%

#include "lex.yy.c"
int lineno;

main() {
  return yyparse();
}

yyerror( char *s ) { fprintf( stderr, "%s\n", s); };
