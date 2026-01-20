#include <stdio.h>

int main(void)
{
    FILE *f; /* pointer to file */
    char c;

    if ((f = fopen("numbers.txt", "r")) == NULL) {
        printf("Cannot open 'myfile.txt' for reading");
        return -1;
    }

    /* read file content char by char and print to stdout */
    while ((c = fgetc(f)) != EOF) {
        printf("%c", c);
    }

    if (fclose(f) != 0) {
        printf("File could not be closed.\n");
        return -1;
    }

    return 0;
}

