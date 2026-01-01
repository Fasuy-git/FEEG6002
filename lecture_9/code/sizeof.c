#include <stdio.h>

int main(void) {

    printf("sizeof(char) = %d\n", (int) sizeof(char));
    printf("sizeof(short) = %d\n", (int) sizeof(short int));
    printf("sizeof(int) = %d\n", (int) sizeof(int));
    printf("sizeof(long) = %d\n", (int) sizeof(long int));
    printf("sizeof(float) = %d\n", (int) sizeof(float));
    printf("sizeof(double) = %d\n", (int) sizeof(double));
    printf("sizeof(double *) = %d\n", (int) sizeof(double *));
    printf("sizeof(char*) = %d\n", (int) sizeof(char *));
    printf("sizeof(FILE*) = %d\n", (int) sizeof(FILE *));

    return 0;
}

