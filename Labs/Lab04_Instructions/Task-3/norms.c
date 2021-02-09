#include <stdio.h>
#include <stdlib.h>
//// I did not notice time difference on my computer
int main(int argc, char **argv)
{
   int i;
   float tiny = 1e-35; /// It just prints zeros when it gets to small

   printf("%e\n", tiny);

   /* Inside the loop we do some computations modifying the "tiny"
      variable in such a way that it is (almost) restored to the same
      value again in each loop iteration. The value will probably
      change slightly due to rounding errors. */
   for (i=0; i<5000000; i++)
   {
      tiny += tiny/2.0;
      tiny *= 0.666667;
      tiny += tiny/2.0;
      tiny *= 0.666667;
      tiny += tiny/2.0;
      tiny *= 0.666666;
   }
   printf("%e\n", tiny);

   return 0;
}
