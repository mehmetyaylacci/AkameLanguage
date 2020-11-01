/* calculator.y */

%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex(void);
    void yyerror(char* s);
    extern int yylineno;
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
%token IDENTIFIER_S

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
    | comment_sentence 

stmt_list:
                stmt
                | stmt_list stm

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
                | comment_sentence

comment_sentence:
	COMMENT sentence COMMENT
  | comment_sentence COMMENT sentence COMMENT

sentence:
	IDENTIFIER_S sentence
	|IDENTIFIER_S

//statements:
assignment_stmt:
                ident_list ASSIGNMENT expr SEMICOLON
                | ident_list ASSIGNMENT func_call SEMICOLON
                | ident_list ASSIGNMENT primitive_func SEMICOLON

if_stmt:        IF LPAR logic_exp RPAR LBRACKET stmt_list RBRACKET else_stmt
            	//| IF LPAR logic_exp RPAR LBRACKET stmt_list RBRACKET else_stmt
            	| IF LPAR func_call RPAR LBRACKET stmt_list RBRACKET else_stmt

else_stmt:
                ELSE LBRACKET stmt_list RBRACKET

while_stmt:     WHILE LPAR expr RPAR stmt_list
                | WHILE LPAR logic_exp RPAR stmt_list
                | WHILE LPAR func_call RPAR stmt_list
                | WHILE LPAR primitive_func RPAR stmt_list

for_stmt:       FOR LPAR expr SEMICOLON expr SEMICOLON expr RPAR stmt_list

func_call:      ident LPAR args RPAR

args:           type_ident ident
                | type_ident ident COMMA args
                | "" //empty

decl_stmt:      type_ident ident_list

// func_def_stmt:  type_ident func_call stmt_list
func_def_stmt:  type_ident func_call LBRACKET stmt_list RBRACKET

input_stmt:     INPUT LPAR ident RPAR

output_stmt:    OUTPUT LPAR STRING RPAR
                | OUTPUT LPAR ident RPAR
                | OUTPUT LPAR func_call RPAR
                | OUTPUT LPAR primitive_func RPAR

//end of statements

type_ident:     INT_TYPE
                | FLOAT_TYPE
                | CHAR_TYPE
                | VOID

ident_list:     ident
                | ident_list COMMA ident

ident:
                ALPHANUMERIC
                | ident ALPHANUMERIC


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
logic_exp:
                // 4 < 89
                // true && false
                // a >= b
                INTEGER LESS INTEGER
                |INTEGER GREATER INTEGER
                |INTEGER LTE INTEGER
                |INTEGER GTE INTEGER
                |IDENTIFIER LESS IDENTIFIER
                |IDENTIFIER GREATER IDENTIFIER
                |IDENTIFIER LTE IDENTIFIER
                |IDENTIFIER GTE IDENTIFIER
                |IDENTIFIER AND IDENTIFIER
                |IDENTIFIER OR IDENTIFIER
                |BOOLEAN AND BOOLEAN
                |BOOLEAN OR BOOLEAN
                |BOOLEAN IS_EQUAL BOOLEAN
                |BOOLEAN NOT_EQUAL BOOLEAN
                |IDENTIFIER IS_EQUAL IDENTIFIER
                |IDENTIFIER NOT_EQUAL IDENTIFIER

expr:            expr PLUS term
                | expr MINUS term
                | term

term:            term MULT factor
                | term DIV factor
                | factor

factor:         idc EXPONENT factor
                |  idc

idc:            ident
                //| <int_const>
                | LPAR expr RPAR

//end of expressions



%%

void yyerror(char *s) {
	fprintf(stdout, "line %d: %s\n", yylineno,s);
}

int main(void) {

  yyparse();
  if( yynerrs < 1 ) {
    printf("Parsing SUCCESSFUL.\n");
  } else {
    printf("Parsing UNSUCCESSFUL.\n");
  }
  return 0;
}
