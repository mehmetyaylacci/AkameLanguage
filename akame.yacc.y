%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex(void);
    void yyerror(char* s);
    extern int yylineno;
%}


%token INT_TYPE
%token FLOAT_TYPE
%token DOUBLE_TYPE
%token VOID
%token BOOLEAN_TYPE
%token CHAR_TYPE

%token STRING
%token MAIN
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

%token LOWERCASE
%token UPPERCASE
%token TRUE
%token FALSE
%token BOOLEAN
%token ALPHANUMERIC
%token IDENTIFIER
%token INTEGER
%token FLOAT
%token OUTPUT

%right ASSIGNMENT
%%




stmt_list:
                stmt
                | stmt_list stmt

stmt:
                input_stmt SEMICOLON
                | output_stmt SEMICOLON
		| assignment_stmt SEMICOLON
		| decl_stmt SEMICOLON
		| while_stmt
		| for_stmt
		| func_call SEMICOLON
		| func_def_stmt
		| return_stmt SEMICOLON
		| if_stmt
		| comment_sentence
		| primitive_func SEMICOLON


primitive_func:   ident DOT READINC LPAR RPAR
                | ident DOT READALT LPAR RPAR
                | ident DOT READTEMP LPAR RPAR
                | ident DOT READACCEL LPAR RPAR
                | ident DOT TOGGLECAMERA LPAR RPAR
                | ident DOT TAKEPIC LPAR RPAR
                | ident DOT READTS LPAR RPAR
                | ident DOT CONNECT LPAR RPAR

comment_sentence:
            	HASHTAG STRING HASHTAG

logic_exp:
                INTEGER LESS INTEGER
                | INTEGER GREATER INTEGER
                | INTEGER LTE INTEGER
                | INTEGER GTE INTEGER
                | IDENTIFIER LESS IDENTIFIER
                | IDENTIFIER GREATER IDENTIFIER
                | IDENTIFIER LTE IDENTIFIER
                | IDENTIFIER GTE IDENTIFIER
                | IDENTIFIER AND IDENTIFIER
		| IDENTIFIER LESS INTEGER
                | IDENTIFIER GREATER INTEGER
                | IDENTIFIER LTE INTEGER
                | IDENTIFIER GTE INTEGER
                | IDENTIFIER AND INTEGER
                | IDENTIFIER OR INTEGER
                | BOOLEAN AND BOOLEAN
                | BOOLEAN OR BOOLEAN
                | BOOLEAN IS_EQUAL BOOLEAN
                | BOOLEAN NOT_EQUAL BOOLEAN
                | IDENTIFIER IS_EQUAL IDENTIFIER
                | IDENTIFIER NOT_EQUAL IDENTIFIER

else_stmt:
                ELSE LBRACKET stmt_list RBRACKET


//ekleme yapılabilir
if_stmt:        IF LPAR logic_exp RPAR LBRACKET stmt_list RBRACKET else_stmt
            	//| IF LPAR logic_exp RPAR LBRACKET stmt_list RBRACKET else_stmt
            	| IF LPAR func_call RPAR LBRACKET stmt_list RBRACKET else_stmt


args:           type_ident ident
                | type_ident ident COMMA args
                | "" //empty

func_call:      ident LPAR args RPAR

return_stmt:	RETURN ident

func_def_stmt:  type_ident func_call LBRACKET stmt_list RBRACKET



while_stmt:
                WHILE LPAR logic_exp RPAR LBRACKET stmt_list RBRACKET
                | WHILE LPAR func_call RPAR LBRACKET stmt_list RBRACKET
                | WHILE LPAR primitive_func RPAR LBRACKET stmt_list RBRACKET



//for( int i = 0; i < 5 ) {}
for_stmt:	FOR LPAR assignment_stmt SEMICOLON logic_exp RPAR LBRACKET stmt_list RBRACKET

output_stmt:    OUTPUT LPAR STRING RPAR

input_stmt:     INPUT LPAR ident RPAR


decl_stmt:      type_ident ident_list




assignment_stmt:
		decl_stmt ASSIGNMENT ident
		| decl_stmt ASSIGNMENT INTEGER




ident_list:     ident
                | ident_list COMMA ident

ident:
                IDENTIFIER

type_ident:     INT_TYPE
                | FLOAT_TYPE
                | CHAR_TYPE
                | VOID
		| BOOLEAN_TYPE



%%




void yyerror(char *s) {
	fprintf(stdout, "line %d: %s\n", yylineno-1,s);
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
