#include <stdio.h>

int main(void)
{
    FILE *f; /* pointer to file */

    double x, y, z;

    if ((f = fopen("numbers.txt", "r")) == NULL) {
        printf("Cannot open 'numbers.txt' for reading");
        return -1;
    }

    while (fscanf(f, "%lf %lf %lf", &x, &y, &z) == 3)
    {
        printf("%lf, %lf, %lf\n", x, y, z);
    }

    if (fclose(f) != 0) {
        printf("File could not be closed.\n");
        return -1;
    }

    return 0;
}

