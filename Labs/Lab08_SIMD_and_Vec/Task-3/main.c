#include <pmmintrin.h> //SSE3
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#define VALUE 4242

typedef short int Type; 

void threshold(Type *dst, const Type *src, int len)
{
	/* Your code here... */
int i;
//__m128i ci;


/*for(i = 0; i < len; i +=64)
    {

      __m128i v2 = _mm_set_epi64(VALUE, VALUE);

      __m128i v = _mm_loadu_si128((__m128i *) (src+i));

     // ci =_mm_cmpgt_epi32(v2, v );

      _mm_storeu_si128((__m128i *)(dst+i), _mm_cmpgt_epi64(v, v2 ));
    }*/

  /* Your code here... */
  __m128i b = _mm_set1_epi16(VALUE); // "vektor" med bara VALUE värden
  
  //printf("Size: %ld\n", sizeof(tresh));
  for(i= 0; i < len; i += 8) {

    __m128i a = _mm_load_si128((__m128i *)(src + i)); // ladda in 128 bitar/ 16 bytes / 8 Type  från src arrayen med start från i:te elementet in i a vektorn
    __m128i c = _mm_cmpgt_epi16(a,b); // gör gämförelsen och lagra i c
    _mm_store_si128((__m128i*)(dst+i), c); // spara in c:s bytes in i dst med start vid i:te elementet
  
  /*
  return;
  */ 

}
 
}


int main()
{
  int N = 1024;
  Type dst[N], src[N];
printf("%ld\n", sizeof(Type));
  // fill in arrays
  int i;
  for(i = 0; i < N; i++){
    src[i] = rand()%(VALUE*2);
  }

  printf("Call function threshold()...\n");
  threshold(dst, src, N);



 for(i = 0; i < N; i++){
  printf("%d\n", dst[i]);}

  // check result  
 for(i = 0; i < N; i++)
   assert(dst[i] == ( src[i] > VALUE ? -1 : 0 ));

 printf("Great! No errors!\n");
  return 0;
}
