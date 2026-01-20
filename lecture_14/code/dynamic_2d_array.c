#include <stdio.h>
#include <stdlib.h>

#define N 3
#define M 4

int main(void) {
    int i, j, *m[N];

    /* Dynamically allocate memory for each row */
    m[0] = (int *) malloc(M * sizeof(int));
    m[1] = (int *) malloc(M * sizeof(int));
    m[2] = (int *) malloc(M * sizeof(int));

    /* Check if memory allocation was successful */
    if (m[0] == NULL || m[1] == NULL || m[2] == NULL) {
        printf("Memory allocation failed.\n");
        return 1; /* Exit if any allocation fails */
    }

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            m[i][j] = i * 10 + j; /* initialise */
        }
    }

    printf("2D array m:\n");
    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            printf("%d ", m[i][j]);
        }
        printf("\n");
    }

    /* Free the allocated memory for each row */
    free(m[0]);
    free(m[1]);
    free(m[2]);

    return 0;
}

