#include <stdio.h>

int main(void) {

    float a, b, result;
    float x, y, z;

    a = 1.0f;
    b = 3.0f;

    result = a / b;

    printf("a / b = %.20f\n", result);

    x = 0.1f;
    y = 0.2f;
    z = x + y;

    printf("0.1 + 0.2 = %.20f\n", z);

    return 0;
}

