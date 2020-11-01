LEX = lex
YACC = yacc -d

CC = gcc


all: parser clean

parser: y.tab.o lex.yy.o
	$(CC) -o parser y.tab.o lex.yy.o
	./parser < example_code.txt


lex.yy.o: lex.yy.c y.tab.h
lex.yy.o y.tab.o: y.tab.c


y.tab.c y.tab.h: akame.yacc
	$(YACC) -v akame.yacc


lex.yy.c: akame.l
	$(LEX) akame.l

clean:
	-rm -f *.o lex.yy.c *.tab.* parser *.output
