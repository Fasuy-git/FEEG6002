#include <stdio.h>

#define N 5

int main(void) {

    int numbers[N]; /* Declare an array of size 5 */
    int i, n;
    int sum = 0;
    float average;

    /* Prompt the user to input values into the array */
    printf("Enter %d numbers:\n", N);
    for (i = 0; i < N; i++) {
        printf("Number %d: ", i + 1);
        scanf("%d", &n);
        numbers[i] = n;
    }

    for (i = 0; i < N; i++) { /* sum of the array elements */
        sum += numbers[i];
    }

    average = (double) sum / N; /* average */

    printf("Sum of the array elements: %d\n", sum);
    printf("Average of the array elements: %.2f\n", average);

    return 0;
}

