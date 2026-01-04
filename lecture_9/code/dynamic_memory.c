#include <stdio.h>
#include <stdlib.h> /* provides malloc */

int main(void) {
    int *pi;

    pi = (int *)malloc(sizeof(int));
    if (pi == NULL) {
        printf("ERROR: Out of memory\n");
        return 1;
    }

    *pi = 5;
    printf("%d\n", *pi);

    free((void *)pi);

    return 0;
}

