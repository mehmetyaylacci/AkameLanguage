%{
#include <stdio.h>
#include "y.tab.h"
void yyerror(char *);
%}

MAIN main
ASSIGNMENTOP =
NEWLINE \n
COMMENT #([^\n])*\n
VAR var
AND \&\&
OR \|\|
XOR \^
ELSE else
NOT '|!
CONSTANTIDENTIFIER ~
PREDICATEID \$
ARRAYID @
IMPLIES ->
IFF <==>
LP \(
RP \)
LB \{
RB \}
LSB \[
RSB \]
COMMA ,
ENDSTMT \;
UNDERSCORE _
IF if
DO do
WHILE while
FOR for
RUN run
RETURN return
CAYYOUT cayyout
CAYYIN cayyin
TRUE true|1
FALSE false|0
DONTCARE dontcare|X
BOOLEAN {TRUE}|{FALSE}|{DONTCARE}
INT [+-]?({DIGIT})+
DIGIT [0-9]
LETTER[a-zA-Z]
STRING \"([^\\\"]|\\\"|\\\n|\\\\)*\"
IDENTIFIER {LETTER}({LETTER}|{DIGIT}|{UNDERSCORE})*
CONSTANT {CONSTANTIDENTIFIER}{IDENTIFIER}
PREDICATE {PREDICATEID}{IDENTIFIER}
ARRAY {ARRAYID}{IDENTIFIER}

%option yylineno
%%
{MAIN} return MAIN;
{ASSIGNMENTOP} return ASSIGNMENTOP;
{VAR} return VAR;
{AND} return AND;
{XOR} return XOR;
{OR} return OR;
{ELSE} return ELSE;
{IMPLIES} return IMPLIES;
{IFF} return IFF;
{LP} return LP;
{RP} return RP;
{LB} return LB;
{RB} return RB;
{LSB} return LSB;
{RSB} return RSB;
{COMMA} return COMMA;
{DIGIT} return DIGIT;
{INT} return INT;
{IF} return IF;
{DO} return DO;
{WHILE} return WHILE;
{FOR} return FOR;
{BOOLEAN} return BOOLEAN;
{RUN} return RUN;
{RETURN} return RETURN;
{CAYYOUT} return CAYYOUT;
{CAYYIN} return CAYYIN;
{STRING} return STRING;
{IDENTIFIER} return IDENTIFIER;
{CONSTANT} return CONSTANT;
{PREDICATE} return PREDICATE;
{ARRAY} return ARRAY;
{COMMENT} return COMMENT;
{ENDSTMT} return ENDSTMT;
{NEWLINE} ;
[ \t] ;
%%

int yywrap(void){
	return 1;
}