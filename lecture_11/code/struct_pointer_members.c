#include <stdio.h>
#include <stdlib.h>

typedef struct {
    double *re;
    double *im;
} complex;

int main(void) {
    complex a, b;
    double x, y;

    x = 1.0;
    y = 2.0;

    /* We can treat the structure members as normal pointers. */
    a.re = &x;
    a.im = &y;
    printf("Complex number is: %4.2lf + %4.2lfj\n", *a.re, *a.im);

    /* Now set up the structure member arrays using
       dynamic memory allocation. */
    b.re = (double *) malloc(2 * sizeof(double));
    b.im = (double *) malloc(2 * sizeof(double));

    /* Populate the arrays. */
    b.re[0] = 1.0;
    b.re[1] = 2.0;

    *b.im = -1.0;        /* can also use pointer arithmetic */
    *(b.im + 1) = -2.0;

    printf("Complex number is: %4.2lf + %4.2lfj\n", b.re[0], b.im[0]);
    printf("Complex number is: %4.2lf + %4.2lfj\n", b.re[1], b.im[1]);
    /* Same but now using pointer arithmetic. */
    printf("Complex number is: %4.2lf + %4.2lfj\n", *b.re, *b.im);
    printf("Complex number is: %4.2lf + %4.2lfj\n", *(b.re + 1), *(b.im + 1));

    free((void *) b.re);
    free((void *) b.im);

    return 0;
}

