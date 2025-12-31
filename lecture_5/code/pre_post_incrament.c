#include <stdio.h>

int main(void) {
    int a = 5;
    int b = 5;

    printf("Using ++a (pre-increment): value = %d\n", ++a);
    printf("Using b++ (post-increment): value = %d\n", b++);
    printf("Value of b after post-increment = %d\n", b);

    return 0;
}

