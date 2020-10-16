ASSIGNMENT =
NEWLINE \n
IS_EQUAL ==
MINUS -
PLUS +
IF if
ELSE else
ELSE_IF elif
COMMENT {HASHTAG}([^\n])*\n
HASHTAG #
DIGIT [0-9]
LOWERCASE [a-z]
UPPERCASE [A-Z]
LPAR \(
RPAR \)
LBRACKET \{
RBRACKET \}
FOR for
DO do
WHILE while
GREATER >
LESS <
GTE >=
LTE <=
NOT_EQUAL !=
SEMICOLON \;
DOT \.
COMMA \,
COLON \:
MULT \*
DIV \/
OR \|\|
AND \&\&
RETURN return
PRINT print
FUNCTION function

TRUE true
FALSE false
BOOLEAN TRUE|FALSE
LOWERCASE [a-z]
VARIABLE {LOWERCASE}{NUMERIC}* ???


%%
{=} 		  			 printf("ASSIGNMENT");
{\n}					 printf("NEWLINE");
{VARIABLE}					 printf("VARIABLE");
{==} 					 printf("IS_EQUAL");
{-} 					 printf("MINUS");
{+}					 printf("PLUS");
{IF} 					 printf("IF");
{ELSE} 				 printf("ELSE");
{ELIF} 				 printf("ELSE_IF");
{#} 					 printf("COMMENT");
{FOR} 				 printf("FOR");
{DO}					 printf("DO");
{WHILE}				 printf("WHILE");
{!=}					 printf("NOT_EQUAL");
{RETURN}				 printf("RETURN");
{>}					 printf("GREATER");
{<}					 printf("LESS");
{>=}					 printf("GTE");
{<=}					 printf("LTE");
{\:}					 printf("SEMICOLON");
{\.}					 printf("DOT");
{\,}					 printf("COMMA");
{\:}					 printf("COLON");
{\*}					 printf("MULT");
{\/}					 printf("DIV");
{\|\|}				 printf("OR");
{\&\&}				 printf("AND");
{PRINT}				 printf("PRINT");
{FUNCTION}			 printf("FUNCTION");


%%
int yywrap(void) {
	return 1;
}

int main(void) {
	yylex();
	return 0;
}
