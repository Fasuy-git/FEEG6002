#include <stdio.h>

void swap(int x, int y) {
    int tmp;

    tmp = x;
    x = y;
    y = tmp;
}

int main(void) {
    int a = 1, b = 2;

    printf("Before swap a=%d, b=%d\n", a, b);
    swap(a, b);
    printf("After swap a=%d, b=%d\n", a, b);

    return 0;
}

