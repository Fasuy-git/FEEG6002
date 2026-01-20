#include <stdio.h>
#include <stdlib.h>

#define N 3

int main(void) {
    int **m;
    int i;

    /* Allocate memory for the array of pointers (rows) */
    m = (int **) malloc(N * sizeof(int *));
    if (m == NULL) {
        printf("Memory allocation failed.\n");
        return 1;
    }

    /* Dynamically allocate memory for each row with varying sizes */
    m[0] = (int *) malloc(3 * sizeof(int)); /* 3 elements in row 0 */
    m[1] = (int *) malloc(2 * sizeof(int)); /* 2 elements in row 1 */
    m[2] = (int *) malloc(1 * sizeof(int)); /* 1 element in row 2 */

    /* Check if memory allocation was successful for each row */
    if (m[0] == NULL || m[1] == NULL || m[2] == NULL) {
        printf("Memory allocation for rows failed.\n");
        free(m);
        return 1; /* Exit if any allocation fails */
    }

    /* Initialize each row with unique values */
    for (i = 0; i < 3; i++) {
        m[0][i] = i;
    }
    for (i = 0; i < 2; i++) {
        m[1][i] = i + 10;
    }
    for (i = 0; i < 1; i++) {
        m[2][i] = i + 20;
    }

    /* Print the jagged 2D array */
    printf("Jagged 2D array m:\n");
    for (i = 0; i < 3; i++) {
        printf("%d ", m[0][i]);
    }
    printf("\n");
    for (i = 0; i < 2; i++) {
        printf("%d ", m[1][i]);
    }
    printf("\n");
    for (i = 0; i < 1; i++) {
        printf("%d ", m[2][i]);
    }
    printf("\n");

    /* Free the allocated memory for each row */
    for (i = 0; i < 3; i++) {
        free(m[i]);
    }

    /* Free the memory allocated for the array of pointers */
    free(m);

    return 0;
}

