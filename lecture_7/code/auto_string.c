#include <stdio.h>

/* demonstrate string termination I */
int main(void) {
    char s[] = "hello\n";
    int i;

    printf("%s", s);
    for (i = 0; i < 7; i++)
        printf("s[%d]='%c'=%3d\n", i, s[i], s[i]);

    return 0;
}

