* calculator.y */

%{
    #include <stdio.h>
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

%token READINC
%token READALT
%token READTEMP
%token READACCEL
%token TOGGLECAMERA
%token TAKEPIC
%token READTS
%token INPUT
%token CONNECT

%token INT_TYPE
%token FLOAT_TYPE
%token DOUBLE_TYPE
%token VOID
%token BOOLEAN_TYPE

%token LOWERCASE
%token UPPERCASE
%token TRUE
%token FALSE
%token BOOLEAN
%token ALPHANUMERIC
%token IDENTIFIER
%token INTEGER
%token FLOAT

%union{ double   real; /* real value */
        int   integer; /* integer value */
      }

%token <real> REAL
%token <integer> INTEGER
%token PLUS MINUS TIMES DIVIDE LP RP NL

%type <real> rexpr
%type <integer> iexpr

%left PLUS MINUS
%left TIMES DIVIDE
%left UMINUS

%%

lines: /* nothing */
     | lines line
     ;

line:  NL
     | iexpr NL
       { printf("%d) %d\n", lineno, $1);}
     | rexpr NL
       { printf("%d) %15.8lf\n", lineno, $1);}
     ;

iexpr: INTEGER
     | iexpr PLUS iexpr
       { $$ = $1 + $3;}
     | iexpr MINUS iexpr
       { $$ = $1 - $3;}
     | iexpr TIMES iexpr
       { $$ = $1 * $3;}
     | iexpr DIVIDE iexpr
       { if($3) $$ = $1 / $3;
         else { yyerror("divide by zero");
	      }
       }
     | MINUS iexpr %prec UMINUS
       { $$ = - $2;}
     | LP iexpr RP
       { $$ = $2;}
     ;

rexpr: REAL
     | rexpr PLUS rexpr
       { $$ = $1 + $3;}
     | rexpr MINUS rexpr
       { $$ = $1 - $3;}
     | rexpr TIMES rexpr
       { $$ = $1 * $3;}
     | rexpr DIVIDE rexpr
       { if($3) $$ = $1 / $3;
         else { yyerror( "divide by zero" );
	      }
       }
     | MINUS rexpr %prec UMINUS
       { $$ = - $2;}
     | LP rexpr RP
       { $$ = $2;}
     | iexpr PLUS rexpr
       { $$ = (double)$1 + $3;}
     | iexpr MINUS rexpr
       { $$ = (double)$1 - $3;}
     | iexpr TIMES rexpr
       { $$ = (double)$1 * $3;}
     | iexpr DIVIDE rexpr
       { if($3) $$ = (double)$1 / $3;
         else { yyerror( "divide by zero" );
	      }
       }
     | rexpr PLUS iexpr
       { $$ = $1 + (double)$3;}
     | rexpr MINUS iexpr
       { $$ = $1 - (double)$3;}
     | rexpr TIMES iexpr
       { $$ = $1 * (double)$3;}
     | rexpr DIVIDE iexpr
       { if($3) $$ = $1 / (double)$3;
         else { yyerror( "divide by zero" );
	      }
       }
     ;

%%
#include "lex.yy.c"
int lineno;

main() {
  return yyparse();
}

yyerror( char *s ) { fprintf( stderr, "%s\n", s); };


#########################
lex:
/* calculator.l */

integer      [0-9]+
dreal        ([0-9]*\.[0-9]+)
ereal        ([0-9]*\.[0-9]+[Ee][+-]?[0-9]+)
real         {dreal}|{ereal}
nl           \n

%%
[ \t]        ;
{integer}    { sscanf(yytext, "%d", &yylval.integer);
               return INTEGER;
             }
{real}       { sscanf(yytext, "%lf", &yylval.real);
               return REAL;
             }
\+           { return PLUS;}
\-           { return MINUS;}
\*           { return TIMES;}
\/           { return DIVIDE;}
\(           { return LP;}
\)           { return RP;}

{nl}         { extern int lineno; lineno++;
               return NL;
             }
.            { return yytext[0]; }
%%
int yywrap() { return 1; }
