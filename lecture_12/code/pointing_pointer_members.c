#include <stdio.h>
#include <stdlib.h>

typedef struct {
    double *re;
    double *im;
} complex;

int main(void) {
    complex a;
    complex *b;
    double x, y;

    x = 1.0;
    y = 2.0;

    a.re = &x;
    a.im = &y;

    printf("Complex number is %f + %fj\n", *a.re, *a.im);

    /* Make b point to a. */
    b = &a;

    printf("Complex number is %f + %fj\n", *((*b).re), *((*b).im));

    /* Using reference operator: */
    printf("Complex number is %f + %fj\n", *(b->re), *(b->im));

    return 0;
}

