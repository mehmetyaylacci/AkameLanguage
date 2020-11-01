LEX = lex
YACC = yacc -d

CC = gcc


all: parser clean

parser: y.tab.o lex.yy.o
	$(CC) -o parser y.tab.o lex.yy.o
	./parser < CS315f20_team39.test


lex.yy.o: lex.yy.c y.tab.h
lex.yy.o y.tab.o: y.tab.c


y.tab.c y.tab.h: CS315f20_team39.yacc
	$(YACC) -v CS315f20_team39.yacc


lex.yy.c: CS315f20_team39.lex
	$(LEX) CS315f20_team39.lex

clean:
	-rm -f *.o lex.yy.c *.tab.* parser *.output
