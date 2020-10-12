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
COMMENT {HASHTAG}([^\n])*\n
HASHTAG #

%%


%%
int yywrap(void) {
	return 1;
}

int main(void) {
	yylex();
	return 0;
}