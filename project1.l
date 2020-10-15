ASSIGNMENT =
NEWLINE \n
VAR var
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


%%
= 		  			 printf("ASSIGNMENT");
\n					 printf("NEWLINE");
var					 printf("VAR");
== 					 printf("IS_EQUAL");
- 					 printf("MINUS");
+ 					 printf("PLUS");
if 					 printf("IF");
else 				 printf("ELSE");
elif 				 printf("ELSEIF");
# 					 printf("COMMENT");
for 				 printf("FOR");
do					 printf("DO");
while				 printf("WHILE");
!=					 printf("NOT_EQUAL");
return				 printf("RETURN");
>					 printf("GREATER");
<					 printf("LESS");
>=					 printf("GTE");
<=					 printf("LTE");
\:					 printf("SEMICOLON");
\.					 printf("DOT");
\,					 printf("COMMA");
\:					 printf("COLON");
\*					 printf("MULT");
\/					 printf("DIV");
\|\|				 printf("OR");
\&\&				 printf("AND");
return				 printf("RETURN");
print				 printf("PRINT");
function			 printf("FUNCTION");


%%
int yywrap(void) {
	return 1;
}

int main(void) {
	yylex();
	return 0;
}
