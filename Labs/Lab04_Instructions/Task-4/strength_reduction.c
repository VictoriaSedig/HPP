#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
   int i;
   int a = 1, b = 2, c = 3, d = 1;
   float x = 0.1, y = 0.5, z = 0.33;
   printf("%d %d %d %d, %f %f %f\n", a, b, c, d, x, y, z);
	var = 1/1.33;
   for (i=0; i<50000000; i++)
   {
      c = d<<1;
      b = c*15;//c<<4 -c
      a = b>>4;
      d =(unsigned)b/(unsigned)a; 

      z = 0.33;
      y = z*2;//z<<1
      x = y* var;
      z = x *var;
   }
   printf("%d %d %d %d, %f %f %f\n", a, b, c, d, x, y, z);
   return 0;
}
