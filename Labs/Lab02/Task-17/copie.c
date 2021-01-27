#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
int main(int argc, char *argv[])
{
    char ch;
    FILE *in = fopen(argv[1],"r");
    FILE *out = fopen(argv[2],"w");

while((ch = fgetc(in)) != EOF){
    fputc(toupper(ch), out);
}

fclose(in);
fclose(out);

}