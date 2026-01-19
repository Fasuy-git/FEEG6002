#include <stdio.h>
#include <stdlib.h>

/* structure declaration */
typedef struct {
    double re;
    double im;
} complex;

/* definition of function add */
complex add(complex *a, complex *b) {
    complex c;
    c.re = a->re + b->re;
    c.im = a->im + b->im;

    return c;
}

int main(void) {
    complex v = {0.0, 1.0}; /* initialise structures by providing */
    complex u = {1.0, 0.0}; /* a list of initialisers */
    complex w, *z;

    w = add(&v, &u); /* sum v and u (passed as pointers), return as w */
    printf("a) %f + %fj\n", w.re, w.im);

    z = (complex *) malloc(sizeof(complex)); /* dynamic memory allocation */
    *z = add(&v, &u); /* same as above but use a pointer */
    printf("b) %f + %fj\n", z->re, z->im);

    free((void *) z);

    return 0;
}

