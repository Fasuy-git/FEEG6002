#include <stdio.h>

int main(void)
{
    FILE *f; /* pointer to file */

    int s;
    double x, y, z;

    if ((f = fopen("numbers.txt", "r")) == NULL) {
        printf("Cannot open 'numbers.txt' for reading");
        return -1;
    }

    s = fscanf(f, "%lf %lf %lf", &x, &y, &z);
    printf("(%d) %lf, %lf, %lf\n", s, x, y, z);

    if (fclose(f) != 0) {
        printf("File could not be closed.\n");
        return -1;
    }

    return 0;
}

