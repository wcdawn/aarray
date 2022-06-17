# Makefile


FC=gfortran
FFLAGS=-Wall -Wextra -O3 -std=f95

LD=gfortran
LDFLAGS=-O3

EXEC=aarray.x

default : all

all : $(EXEC)

$(EXEC) : main.o
	$(LD) $(LDFLAGS) -o $(EXEC) $^

main.o : main.f90
	$(FC) $(FFLAGS) -c $<

clean :
	$(RM) main.o $(EXEC)
