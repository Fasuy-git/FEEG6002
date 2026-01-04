#include <stdio.h>

/* structure declaration */
struct complex {
    double re;
    double im;
};

/* definition of function add */
struct complex add(struct complex a, struct complex b) {
    struct complex c;

    c.re = a.re + b.re;
    c.im = a.im + b.im;

    return c;
}

int main(void) {
    struct complex v = {1.0, 0.0}; /* initialise structures by providing */
    struct complex u = {0.0, 1.0}; /* a list of initialisers */
    struct complex w;

    w = add(v, u); /* sum v and u, return the sum as w */

    printf("%f + %fj\n", w.re, w.im);

    return 0;
}

