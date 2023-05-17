INCLUDE_DIRS = -I/opt/intel/compilers_and_libraries_2020.0.166/linux/mpi/intel64/include/
LIB_DIRS = -L/opt/intel/compilers_and_libraries_2020.0.166/linux/mpi/intel64/lib/debug -L/opt/intel/compilers_and_libraries_2020.0.166/linux/mpi/intel64/lib
MPICC = mpicxx
CC = gcc
CXX = g++


CDEFS=
CFLAGS= -g -fopenmp -Wall -O2 $(INCLUDE_DIRS) $(CDEFS)
MPIFLAGS= -g -Wall -O2 $(INCLUDE_DIRS) $(CDEFS)
LIBS=

PRODUCT= ompSobel ompSobelSingleFile

HFILES=
MPIFILES= 
CFILES= ompSobel.cpp ompSobelSingleFile.c

SRCS= ${HFILES} ${CFILES}
OBJS= ${CFILES:.c=.o}

all:	${PRODUCT}

clean:
	-rm -f *.o *.NEW *~
	-rm -f ${PRODUCT} ${DERIVED} ${GARBAGE}

ompSobel: ompSobel.cpp
	$(CXX) $(CFLAGS) -o $@ ompSobel.cpp $(LIB_DIRS) -lm

ompSobelSingleFile: ompSobelSingleFile.c
	$(CC) $(CFLAGS) -o $@ ompSobelSingleFile.c $(LIB_DIRS) -lm
