#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int CmpString(const void * p1, const void * p2)
{
return strcmp(*(char**)p1,*(char**)p2);
}


int main()
{

char *arrStr[] = {"daa", "cbab", "bbbb", "bababa", "ccccc", "aaaa"};
int arrStrLen = sizeof(arrStr) / sizeof(char *);
qsort(arrStr, arrStrLen, sizeof(char *), CmpString);

for (int n=0; n<6; n++){
     printf ("%s ",arrStr[n]);
}
}



