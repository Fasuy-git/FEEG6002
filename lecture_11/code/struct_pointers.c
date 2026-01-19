#include <stdio.h>

/* structure declaration */
typedef struct {
    double re;
    double im;
} complex;

int main(void) {
    complex v = {0.0, 1.0};
    complex *u = &v; /* declaration and definition of a
                        pointer to a structure */

    printf("1: %f + %fj\n", v.re, v.im);
    printf("2: %f + %fj\n", (*u).re, (*u).im); /* dereferencing */
    printf("3: %f + %fj\n", u->re, u->im);    /* dereferencing using new syntax */

    return 0;
}

