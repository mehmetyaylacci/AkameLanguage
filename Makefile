project1: y.tab.c lex.yy.c
	cc -o project1 y.tab.c
y.tab.c: project1.y lex.yy.c
	yacc project1.y
lex.yy.c: project1.l
	lex project1.l
clean:
	rm -f lex.yy.c y.tab.c project1