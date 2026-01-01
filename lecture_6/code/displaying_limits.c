
#include <limits.h>  /* limits for integers */
#include <float.h>   /* limits for floats */
#include <stdio.h>

int main(void) {
  printf("    CHAR_MIN = %12d\n", CHAR_MIN);
  printf("    CHAR_MAX = %12d\n", CHAR_MAX);
  printf("    SHRT_MIN = %12d\n", SHRT_MIN);
  printf("    SHRT_MAX = %12d\n", SHRT_MAX);
  printf("     INT_MIN = %12d\n", INT_MIN);
  printf("     INT_MAX = %12d\n", INT_MAX);
  printf("    LONG_MIN = %12ld\n", LONG_MIN);
  printf("    LONG_MAX = %12ld\n", LONG_MAX);
  printf("     FLT_MIN = %12e\n", FLT_MIN);
  printf("     FLT_MAX = %12e\n", FLT_MAX);
  printf("     DBL_MIN = %12e\n", DBL_MIN);
  printf("     DBL_MAX = %12e\n", DBL_MAX);
  return 0;	
}

