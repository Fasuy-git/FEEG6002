#include <stdio.h>

int power(int base, int n) {
    /* power: raise base to the n-th power; n >= 0 */

    int i, p;

    p = 1;
    for (i = 1; i <= n; ++i) {
        p = p * base;
    }

    return p;
}

int main(void) {

    int i;

    for (i = 0; i < 6; ++i) {
        printf("%2d %6d %6d\n", i, power(2, i), power(-3, i));
    }

    return 0;
}

