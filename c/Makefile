CC=gcc 
DEBUGFLAG=-g
CFLAGS=-std='gnu99' `pkg-config --cflags --libs glib-2.0` -W -Wall -pedantic $(DEBUGFLAG)
LDFLAGS= `pkg-config --cflags --libs glib-2.0`


trc.tab.c:	trc.y
	bison $<

.c.o:
	$(CC) -o $@ -c $< $(CFLAGS)

	
test:	test.o trc.o
	$(CC) -o $@ $^ $(LDFLAGS)


clean:
	rm -f *.o trc.tab.c test a.out trc.c lex.yy.c pic

.l.c:
	flex -o $@ $<

pic:	pic.o
	$(CC) -o $@ $^ $(LDFLAGS)
	
