akame: y.tab.c lex.yy.c
	cc -o akame y.tab.c
y.tab.c: akame.y lex.yy.c
	yacc akame.y
lex.yy.c: akame.l
	lex akame.l
clean:
	rm -f lex.yy.c y.tab.c akame