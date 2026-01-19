#include <stdio.h>

#define N 3

/* structure declaration */
typedef struct {
    double re;
    double im;
} complex;

/* definition of function add */
complex add(complex a, complex b) {
    complex c;
    c.re = a.re + b.re;
    c.im = a.im + b.im;

    return c;
}

int main(void) {
    int i;

    /* initialise array of structures (three complex numbers): */
    complex a[N] = {{1.0, 0.0}, {0.0, -1.0}, {-1.0, 1.0}};
    complex s = {0.0, 0.0}; /* zero complex number */

    for(i = 0; i < N; i++) { /* add complex numbers */
        s = add(s, a[i]);
    }

    printf("%f + %fj\n", s.re, s.im);

    return 0;
}

