#import "../template.typ": *

#show: codly-init.with()
#codly(languages: codly-languages)

#lecture("Lecture 17", 1, 9)

== Returning 2D Arrays From Functions

As was seen before, it is not possible to directly return arrays from a C function. Instead a pointer to the array can be manipulated and returned. An example of this is shown in *@17-return-2d-array* which uses the double pointer syntax to define a 2d array within the function and return that.

#figure(
  [```C
  #include <stdio.h>
  #include <stdlib.h>

  double **zero(void)
  {
      /* Function allocates memory for and returns 2x2
         matrix with elements initialised to 0. */

      double **m;

      m = (double **) malloc(2 * sizeof(double *)); /* Two double pointers (rows) */
      m[0] = (double *) malloc(2 * sizeof(double)); /* Two doubles in row 0 */
      m[1] = (double *) malloc(2 * sizeof(double)); /* Two doubles in row 1 */

      m[0][0] = 0.0;
      m[0][1] = 0.0;
      m[1][0] = 0.0;
      m[1][1] = 0.0;

      return m;
  }

  int main(void)
  {
      double **m;

      m = zero();

      /* Free allocated memory */
      free((void *) m[0]);
      free((void *) m[1]);
      free((void **) m);

      return 0;
  }
  ```],

  caption: [C code which returns a 2d array from a function.],
  supplement: [Figure],
  kind: figure,
)<17-return-2d-array>

== Representing 2D arrays Using 1D Arrays

By default, when a 2D array is statically defined, the memory is stored contiguously. It is therefore possible to explicitly define a 2D array by defining 1D arrays next to one another, this is shown in *@17-1d-2darray* where both code blocks are identical.

#figure(
  grid(
    columns: (0.5fr, 0.5fr),
    row-gutter: 0.5cm,

    [```C
    #include <stdio.h>
    #define N 2
    void print_array(int a[][N])
    {
        int i, j;

        for (i = 0; i < N; i++) {
            printf("| ");
            for (j = 0; j < N; j++) {
                printf("%d ", a[i][j]);
            }
            printf("|\n");
        }
        printf("\n");
    }

    int main(void)
    {
        int i, j, k;

        int m[N][N] = {{2, 1}, {3, 1}};
        int n[N][N] = {{1, 2}, {3, 2}};
        int o[N][N] = {{0, 0}, {0, 0}};

        /* multiply matrices m * n */
        for (i = 0; i < N; i++) {
            for (j = 0; j < N; j++) {
                for (k = 0; k < N; k++) {
                    o[i][j] += m[i][k] * n[k][j];
                }
            }
        }

        print_array(o);
        return 0;
    }
    ```],

    [```C
    #include <stdio.h>
    #define N 2
    void print_array(int a[])
    {
        int i, j;

        for (i = 0; i < N; i++) {
            printf("| ");
            for (j = 0; j < N; j++) {
                printf("%d ", a[i * N + j]);
            }
            printf("|\n");
        }
        printf("\n");
    }

    int main(void)
    {
        int i, j, k;

        int m[N * N] = {2, 1, 3, 1};
        int n[N * N] = {1, 2, 3, 2};
        int o[N * N] = {0, 0, 0, 0};

        /* multiply matrices m * n */
        for (i = 0; i < N; i++) {
            for (j = 0; j < N; j++) {
                for (k = 0; k < N; k++) {
                    o[i * N + j] += m[i * N + k] * n[k * N + j];
                }
            }
        }

        print_array(o);
        return 0;
    }
    ```],
  ),
  caption: [C code which defines a 2D array using common syntax [left] and 1d arrays [right]],
  supplement: [Figure],
  kind: figure,
)<17-1d-2darray>

#pagebreak()
