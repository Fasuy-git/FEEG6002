#include <stdio.h>
#include <math.h> /* include math-header for sqrt-function */

#define N 10   /* total number of lines in table */
#define a 1.0  /* starting with x=a */
#define b 10.0 /* ending with x=b */

#define MYINT int

MYINT main(void) {
    /* print table of N square roots sqrt(x) for x in [a,b] */

    double x; /* being used in for-loop */
    MYINT i;    /* iteration counter for for-loop */

    for (i = 0; i < N; i++) {
        x = a + i * (b - a) / (N - 1); /* compute x */

        /* compute sqrt(x) and print result */
        printf(" sqrt(%f) = %f\n", x, sqrt(x));
    }

    return 0;
}

