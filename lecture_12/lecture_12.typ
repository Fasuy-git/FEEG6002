#import "../template.typ": *

#show: codly-init.with()
#codly(languages: codly-languages)

= Lecture 12

== Pointers to a Structure with Pointer Members

If there is a structure where in the definition of the structure there is a pointer, then a pointer pointing to the pointer member needs to be handled with careful syntax. This is shown in *@12-pointing-pointer-members* on lines 25 and 28.

#figure(
  grid(
    columns: (0.7fr, 0.3fr),
    [```C
    #include <stdio.h>
    #include <stdlib.h>

    typedef struct {
        double *re;
        double *im;
    } complex;

    int main(void) {
        complex a;
        complex *b;
        double x, y;

        x = 1.0;
        y = 2.0;

        a.re = &x;
        a.im = &y;

        printf("Complex number is %f + %fj\n", *a.re, *a.im);

        /* Make b point to a. */
        b = &a;

        printf("Complex number is %f + %fj\n", *((*b).re), *((*b).im));

        /* Using reference operator: */
        printf("Complex number is %f + %fj\n", *(b->re), *(b->im));

        return 0;
    }
    ```],
    [```sh
    C:\>.\pointing_pointer_members.exe
    Complex number is 1.000000 + 2.000000j
    Complex number is 1.000000 + 2.000000j
    Complex number is 1.000000 + 2.000000j
    ```],
  ),
  caption: [C code which uses a pointer, pointing to a member of a structure which is also a pointer.],
  supplement: [Figure],
  kind: figure,
)<12-pointing-pointer-members>

== Using `fscanf` to Read Data From Files

As was shown in previous lectures the *`scanf`* function can be used to read a data input from the console. Though redirection (*`<`*) can be used to feed a file into a function, the *`fscanf`* function is a more robust form of this, shown in *@12-fscanf*.

#figure(
  grid(
    columns: (0.7fr, 0.3fr),
    row-gutter: 0.5cm,
    grid.cell(
      rowspan: 2,
      [```C
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
      ```],
    ),
    [```txt
    10 12 13
    1 3 4
    3 4 5
    4 5 100
    ```],
    [```sh
    C:\>.\using_fscanf.exe
    (3) 10.000000, 12.000000, 13.000000
    ```],
  ),
  caption: [C code which uses *`fscanf`* to read data from a file.],
  supplement: [Figure],
  kind: figure,
)<12-fscanf>

#pagebreak()
