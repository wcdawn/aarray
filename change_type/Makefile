# Makefile


FC=gfortran

FFLAGS=-O0 -g -Wall -Wextra -Werror -std=f2008

default : exec run

exec : test.x

test.x : main.f90
	$(FC) $(FFLAGS) -o $@ $<

run : ./test.x
	valgrind ./test.x

clean : 
	$(RM) test.x
