ASSIGNMENT =
NEWLINE \n
IS_EQUAL ==
MINUS \-
PLUS \+
IF if
ELSE else
ELSE_IF elif
COMMENT {HASHTAG}([^\n])*\n
HASHTAG #
DIGIT [0-9]
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
NOT :!
BUILTIN_FUNC (readInclination|readAlt|readTemp|readAccel|toggleCamera|takePic|readTs|connect)

INT_TYPE int
FLOAT_TYPE float
DOUBLE_TYPE double
VOID void
BOOLEAN_TYPE bool

FUNCTION function
LOWERCASE [a-z]
UPPERCASE [A-Z]
TRUE true
FALSE false
BOOLEAN {TRUE}|{FALSE}
ALPHANUMERIC ({UPPERCASE}|{LOWERCASE}|{DIGIT})
IDENTIFIER {LOWERCASE}{ALPHANUMERIC}*
INTEGER [-+]?{DIGIT}+
FLOAT [-+]?{DIGIT}*(\.{DIGIT}+)
INPUT input()
STRING \"[^\"]*\"




%%
{NOT}						printf("NOT ");
{INT_TYPE}					printf("INT_TYPE ");
{FLOAT_TYPE}				printf("FLOAT_TYPE ");
{DOUBLE_TYPE}				printf("DOUBLE_TYPE ");
{VOID}						printf("VOID ");
{BOOLEAN_TYPE}				printf("BOOLEAN_TYPE ");
{BUILTIN_FUNC}				printf("BUILTIN_FUNC");

{ASSIGNMENT} 		  	 	printf("ASSIGNMENT ");
{NEWLINE}					printf("\n ");
{IS_EQUAL} 					printf("IS_EQUAL ");
{MINUS} 					printf("MINUS ");
{PLUS}						printf("PLUS ");
{IF} 						printf("IF ");
{ELSE} 						printf("ELSE ");
{ELSE_IF}	 				printf("ELSE_IF ");
{COMMENT} 					printf("COMMENT ");
{HASHTAG}					printf("HASHTAG ");
{INTEGER}					printf("INTEGER ");
{FLOAT}						printf("FLOAT ");
{LPAR}						printf("LPAR ");
{RPAR}						printf("RPAR ");
{LBRACKET}		 	 		printf("LBRACKET ");
{RBRACKET}				   	printf("RBRACKET ");
{FOR} 				 		printf("FOR ");
{DO}					 	printf("DO ");
{WHILE}				 	 	printf("WHILE ");
{GREATER}					printf("GREATER ");
{LESS}					 	printf("LESS ");
{GTE}					 	printf("GTE ");
{LTE}					 	printf("LTE ");
{NOT_EQUAL}					printf("NOT_EQUAL ");
{SEMICOLON}					printf("SEMICOLON ");
{DOT}					 	printf("DOT ");
{COMMA}					 	printf("COMMA ");
{COLON}					 	printf("COLON ");
{MULT}					 	printf("MULT ");
{DIV}					 	printf("DIV ");
{OR}				 		printf("OR ");
{AND}				 		printf("AND ");
{RETURN}				 	printf("RETURN ");
{PRINT}				 		printf("PRINT ");
{FUNCTION}					printf("FUNCTION ");

{IDENTIFIER}				printf("IDENTIFIER ");
{STRING}					printf("STRING ");

%%

int yywrap(void) {
	return 1;
}

int main(void) {
	yylex();
	return 0;
}
