ASSIGNMENT =
NEWLINE \n
INT int
CHAR char
BOOLEAN boolean
FLOAT float
IS_EQUAL ==
MINUS -
PLUS +
IF if
ELSE else
ELSEIF elif
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
NOTEQUAL !=
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


%%


%%
int yywrap(void) {
	return 1;
}

int main(void) {
	yylex();
	return 0;
}
