# Makefile


CC=gcc
CFLAGS=-Wall -Wextra -O3 -ansi -pedantic

LD=gcc
LDFLAGS=-O3

EXEC=aarray.x

default : all

all : $(EXEC)

$(EXEC) : main.o
	$(LD) $(LDFLAGS) -o $(EXEC) $^

main.o : main.c
	$(CC) $(CFLAGS) -c $<

clean :
	$(RM) main.o $(EXEC)
