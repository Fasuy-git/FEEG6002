#include <stdio.h>

/* demonstrate string termination */
int main(void) {
    char a[10];

    a[0] = 'h';
    a[1] = 'e';
    a[2] = 'l';
    a[3] = 'l';
    a[4] = 'o';
    a[5] = '\n';
    a[6] = '\0';

    printf("%s", a);

    return 0;
}

