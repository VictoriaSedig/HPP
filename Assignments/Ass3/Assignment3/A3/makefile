CFLAGS=-Wall
INCLUDES=-I/opt/X11/include
LDFLAGS=-L/opt/X11/lib -lX11 -lm
galsim: graphics/graphics.h graphics/graphics.c
	gcc $(CFLAGS) $(INCLUDES) -c graphics/graphics.c -o graphics/graphics.o
	gcc -c galsim.c -o galsim.o -lm -Ofast -march=native -ffinite-math-only -fno-signed-zeros 
	gcc graphics/graphics.o galsim.o -o galsim -lX11 -lm -Ofast -march=native -ffinite-math-only -fno-signed-zeros
clean:
	rm galsim
	rm galsim.o
	rm ./graphics/graphics.o
