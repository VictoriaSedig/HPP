#
# Makefile for lab in High Performance Programming.
#
# Author: Marcus Holm <marcus.holm@it.uu.se>, Andreas Sandberg <andreas.sandberg@it.uu.se>
#
#

SSE_ARCH_FLAGS=-msse3

CC=gcc 
ARCH=-m64 $(SSE_ARCH_FLAGS)
CFLAGS=-std=gnu99 -O3 $(ARCH) -g -Wall -ftree-vectorizer-verbose=2 -fopt-info-vec -fopt-info-vec-missed 
LDFLAGS=$(ARCH)
LIBS=-lrt

all: matvec

matvec: matvec.o util.o
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

matvec.o: matvec.c
	$(CC) -c -o $@  $(CFLAGS) $< 

clean:
	$(RM) *.o matvec

.PHONY: clean all
