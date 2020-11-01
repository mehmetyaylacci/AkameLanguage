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
    MAIN LPAR RPAR LBRACKET stmt_list RBRACKET SEMICOLON
    //| comment_sentence main

stmt_inside: return_stmt SEMICOLON
                | stmt

stmt_list:    stmt
                | stmt_list stmt

stmt:
                assignment_stmt
                | if_stmt 
                | while_stmt 
                | for_stmt 
                | func_call 
                | decl_stmt
                | func_def_stmt
                | input_stmt 
                | output_stmt
                | comment_sentence
                

comment_sentence:
	COMMENT sentence COMMENT
  | comment_sentence COMMENT sentence COMMENT

sentence:
	IDENTIFIER_S sentence
	|IDENTIFIER_S

//statements:
assignment_stmt:
                ident ASSIGNMENT stmt SEMICOLON
                | ident ASSIGNMENT func_call SEMICOLON
                | ident ASSIGNMENT primitive_func SEMICOLON

if_stmt:        IF LPAR logic_exp RPAR LBRACKET stmt_list RBRACKET else_stmt
            	//| IF LPAR logic_exp RPAR LBRACKET stmt_list RBRACKET else_stmt
            	| IF LPAR func_call RPAR LBRACKET stmt_list RBRACKET else_stmt

else_stmt:
                ELSE LBRACKET stmt_list RBRACKET

while_stmt:     WHILE LPAR stmt RPAR stmt_list
                | WHILE LPAR logic_exp RPAR stmt_list
                | WHILE LPAR func_call RPAR stmt_list
                | WHILE LPAR primitive_func RPAR stmt_list

for_stmt:       FOR LPAR assignment_stmt SEMICOLON logic_exp SEMICOLON expr RPAR stmt_list

return_stmt:    RETURN stmt SEMICOLON

func_call:      ident LPAR args RPAR SEMICOLON

args:           ident
                | ident COMMA args
                | "" //empty

decl_stmt:      ident_list SEMICOLON

// func_def_stmt:  func_call stmt_list
func_def_stmt:  func_call LP args RP LBRACKET stmt_inside RBRACKET SEMICOLON

input_stmt:     INPUT LPAR ident RPAR SEMICOLON

output_stmt:    OUTPUT LPAR STRING RPAR SEMICOLON
                | OUTPUT LPAR ident RPAR SEMICOLON
                | OUTPUT LPAR func_call RPAR SEMICOLON
                | OUTPUT LPAR primitive_func RPAR SEMICOLON

//end of statements

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
                | INTEGER GREATER INTEGER
                | INTEGER LTE INTEGER
                | INTEGER GTE INTEGER
                | IDENTIFIER LESS IDENTIFIER
                | IDENTIFIER GREATER IDENTIFIER
                | IDENTIFIER LTE IDENTIFIER
                | IDENTIFIER GTE IDENTIFIER
                | IDENTIFIER AND IDENTIFIER
                | IDENTIFIER OR IDENTIFIER
                | BOOLEAN AND BOOLEAN
                | BOOLEAN OR BOOLEAN
                | BOOLEAN IS_EQUAL BOOLEAN
                | BOOLEAN NOT_EQUAL BOOLEAN
                | IDENTIFIER IS_EQUAL IDENTIFIER
                | IDENTIFIER NOT_EQUAL IDENTIFIER

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
