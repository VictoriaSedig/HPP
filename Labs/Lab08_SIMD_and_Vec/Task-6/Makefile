#
# Makefile for lab7 in High Performance Computing.
#
# Author: Marcus Holm <marcus.holm@it.uu.se>, Andreas Sandberg <andreas.sandberg@it.uu.se>
#
#

SSE_ARCH_FLAGS=-msse3

CC=gcc 
ARCH=-m64 $(SSE_ARCH_FLAGS)
CFLAGS=-std=gnu99 -O2 $(ARCH) -g -Wall -ffast-math -ftree-vectorizer-verbose=2
LDFLAGS=$(ARCH)
LIBS=-lrt

all: matmul

matmul: matmul.o util.o
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

matmul.o: matmul.c
	$(CC) -c -o $@  $(CFLAGS) $<

matmul.c: util.h

util.c: util.h

clean:
	$(RM) *.o matmul

.PHONY: clean all
