%{
	#include <stdio.h>
	#include "y.tab.h"
	void yyerror(char *);
%}

STRING \"[^\"]*\"
MAIN main
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
EXPONENT \*\*

READINC readInclination
READALT readAlt
READTEMP readTemp
READACCEL readAccel
TOGGLECAMERA toggleCamera
TAKEPIC takePic
READTS readTs
INPUT input
CONNECT connect

INT_TYPE int
FLOAT_TYPE float
DOUBLE_TYPE double
VOID void
BOOLEAN_TYPE bool
CHAR_TYPE char

LOWERCASE [a-z]
UPPERCASE [A-Z]
TRUE true
FALSE false
BOOLEAN {TRUE}|{FALSE}
ALPHANUMERIC ({UPPERCASE}|{LOWERCASE}|{DIGIT})
IDENTIFIER {LOWERCASE}{ALPHANUMERIC}*
INTEGER [-+]?{DIGIT}+
FLOAT [-+]?{DIGIT}*(\.{DIGIT}+)


%option yylineno
%%
{TRUE}						{
								//printf("TRUE ");
				               	return TRUE;
				            }

{FALSE}						{
								//printf("FALSE ");
				               	return FALSE;
				            }

{NOT}						{
								//printf("NOT ");
				               	return NOT;
				            }

{INT_TYPE}					{
								//printf("INT_TYPE ");
				               	return INT_TYPE;
				            }

{FLOAT_TYPE}				{
								//printf("FLOAT_TYPE ");
				               	return FLOAT_TYPE;
				            }

{DOUBLE_TYPE}				{
								//printf("DOUBLE_TYPE ");
				               	return DOUBLE_TYPE;
				            }

{VOID}						{
								//printf("VOID ");
				               	return VOID;
				            }

{BOOLEAN_TYPE}				{
								//printf("BOOLEAN_TYPE ");
				               	return BOOLEAN_TYPE;
				            }

{READINC}					{
								//printf("READINC ");
				               	return READINC;
				            }

{READTS}					{
								//printf("READTS ");
				               	return READTS;
				            }

{READALT}					{
								//printf("READALT ");
				               	return READALT;
				            }

{READTEMP}					{
								//printf("READTEMP ");
				               	return READTEMP;
				            }

{READACCEL}					{
								//printf("READACCEL ");
				               	return READACCEL;
				            }

{TOGGLECAMERA}				{
								//printf("TOGGLECAMERA ");
				               	return TOGGLECAMERA;
				            }

{TAKEPIC}					{
								//printf("TAKEPIC ");
				               	return TAKEPIC;
				            }

{ASSIGNMENT} 		  	 	{
								//printf("ASSIGNMENT ");
				               	return ASSIGNMENT;
				            }

{NEWLINE}		         	{
								//printf("\n ");
				               	return NEWLINE;
				             }

{IS_EQUAL} 					{
								//printf("IS_EQUAL ");
				               	return IS_EQUAL;
				            }

{MINUS} 					{
								//printf("MINUS ");
				               	return MINUS;
				            }

{PLUS}						{
								//printf("PLUS ");
				               	return PLUS;
				            }

{IF} 						{
								//printf("IF ");
				               	return IF;
				            }

{ELSE} 						{
								//printf("ELSE ");
				               	return ELSE;
				            }

{ELSE_IF}	 				{
								//printf("ELSE_IF ");
				               	return ELSE_IF;
				            }

{COMMENT} 					{
								//printf("COMMENT ");
				               	return COMMENT;
				            }

{HASHTAG}					{
								//printf("HASHTAG ");
				               	return HASHTAG;
				            }

{INTEGER}					{
								//printf("INTEGER ");
				               	return INTEGER;
				            }

{FLOAT}						{
								//printf("FLOAT ");
				               	return FLOAT;
				            }

{LPAR}						{
								//printf("LPAR ");
				               	return LPAR;
				            }

{RPAR}						{
								//printf("RPAR ");
				               	return RPAR;
				            }

{LBRACKET}		 	 		{
								//printf("LBRACKET ");
				               	return LBRACKET;
				            }

{RBRACKET}				   	{
								//printf("RBRACKET ");
				               	return RBRACKET;
				            }

{FOR} 				 		{
								//printf("FOR ");
				               	return FOR;
				            }

{DO}					 	{
								//printf("DO ");
				               	return DO;
				            }

{WHILE}				 	 	{
								//printf("WHILE ");
				               	return WHILE;
				            }

{GREATER}					{
								//printf("GREATER ");
				               	return GREATER;
				            }

{LESS}					 	{
								//printf("LESS ");
				               	return LESS;
				            }

{GTE}					 	{
								//printf("GTE ");
				               	return GTE;
				            }

{LTE}					 	{
								//printf("LTE ");
				               	return LTE;
				            }

{NOT_EQUAL}					{
								//printf("NOT_EQUAL ");
				               	return NOT_EQUAL;
				            }

{SEMICOLON}					{
								//printf("SEMICOLON ");
				               	return SEMICOLON;
				            }

{DOT}					 	{
								//printf("DOT ");
				               	return DOT;
				            }

{COMMA}					 	{
								//printf("COMMA ");
				               	return COMMA;
				            }

{COLON}					 	{
								//printf("COLON ");
				               	return COLON;
				            }

{MULT}					 	{
								//printf("MULT ");
				               	return MULT;
				            }

{DIV}					 	{
								//printf("DIV ");
				               	return DIV;
				            }

{OR}				 		{
								//printf("OR ");
				               	return OR;
				            }

{AND}				 		{
								//printf("AND ");
				               	return AND;
				            }

{RETURN}				 	{
								//printf("RETURN ");
				               	return RETURN;
				            }

{PRINT}				 		{
								//printf("PRINT ");
				               	return PRINT;
				            }

{MAIN}						{
								//printf("MAIN ");
				               	return MAIN;
				            }

{IDENTIFIER}				{
								//printf("IDENTIFIER ");
				               	return IDENTIFIER;
				            }

{STRING}					{
								//printf("STRING ");
				               	return STRING;
				            }
%%

int yywrap(void) {
	return 1;
}
