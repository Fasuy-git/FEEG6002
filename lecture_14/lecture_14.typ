#import "../template.typ": *

#show: codly-init.with()
#codly(languages: codly-languages)

= Lecture 14

== 2D Array Dynamic Memory Allocation

Dynamic memory allocation can be done for 2D arrays by defining array of pointers. These can then be used to define a row within the 2D array, an example of this is shown in *@14-dynamic-2d-array*.

#figure(
  grid(
    columns: (0.7fr, 0.3fr),
    row-gutter: 0.5cm,
    grid.cell(
      rowspan: 2,
      [```C
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

      ```],
    ),
    [```sh
    C:\>.\dynamic_2d_array.exe
    2D array m:
    0 1 2 3
    10 11 12 13
    20 21 22 23
    ```],
  ),
  caption: [C code which uses dynamic memory allocation to create a 2D array.],
  supplement: [Figure],
  kind: figure,
)<14-dynamic-2d-array>

== Dynamic Row Sizes and Jagged Arrays

In some applications, the number of elements per row needs to be different per array. In this case, the definition used in *@14-dynamic-2d-array* is not sufficient. For examples like this the double pointer *`**`* is used, an example of this is shown in *@14-dynamic-jagged-array* for a jagged or triangular array.

#figure(
  grid(
    columns: (0.7fr, 0.3fr),
    row-gutter: 0.5cm,
    grid.cell(
      rowspan: 2,
      [```C
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
      ```],
    ),
    [```sh
    C:\>.\dynamic_2d_jagged_array.exe
    Jagged 2D array m:
    0 1 2
    10 11
    20
    ```],
  ),
  caption: [C code which uses dynamic memory allocation to create a jagged 2D array.],
  supplement: [Figure],
  kind: figure,
)<14-dynamic-jagged-array>

#pagebreak()
