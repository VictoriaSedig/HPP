make:
	gcc onlycsr.c -g -fopenmp -o onlycsr
	gcc onlycsr.c -g -fopenmp -O3 -ffast-math -o onlycsroptimized
	gcc sparsematrix.c -g -fopenmp -o sparsematrix
	gcc sparsematrix.c -g -fopenmp -Ofast -ffast-math -mavx -ftree-vectorizer-verbose=2 -fopt-info-vec -o sparsematrixoptimized 
