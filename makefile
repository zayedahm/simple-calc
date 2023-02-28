

INCLUDE_PATH := /usr/local/Cellar/criterion/2.4.1_1/include/
LIB_PATH := /usr/local/Cellar/criterion/2.4.1_1/lib/
CC = gcc
CFLAGS = -Wall -std=c11
DEBUG = -g

code.o: code.h code.c
		$(CC) -c $(DEBUG) $(CFLAGS) code.c

runner.o: runner.c
		$(CC) -c $(DEBUG) $(CFLAGS) runner.c

runner: code.o runner.o
		$(CC) $(DEBUG) $(CFLAGS) -o runner code.o runner.o

tests.o: tests.c code.h
	$(CC) -c $(DEBUG) $(CFLAGS) -I $(INCLUDE_PATH) tests.c

tests:  code.o tests.o
	$(CC) $(DEBUG) $(CFLAGS) -L $(LIB_PATH) -I $(INCLUDE_PATH) -o tests code.o tests.o -lcriterion

clean:
	rm -rf *~ *.o tests runner *.dSYM