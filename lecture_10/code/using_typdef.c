#include <stdio.h>

/* structure declaration using typedef */
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

    complex v = {1.0, 0.0}; /* initialise structures by providing */
    complex u = {0.0, 1.0}; /* a list of initialisers */
    complex w;

    w = add(v, u); /* sum v and u and return as w */

    printf("%f + %fj\n", w.re, w.im);

    return 0;
}

