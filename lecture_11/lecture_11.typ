#import "../template.typ": *

#show: codly-init.with()
#codly(languages: codly-languages)

#lecture("Lecture 11", 1, 6)

== Arrays of Structs

TYo initialize an array of structs, a static array can be defined with the keyword before it being the name of the struct. An example of this is shown in *@11-array-structs* on line 24.

#figure(
  grid(
    columns: (0.7fr, 0.3fr),
    [```C
    #include <stdio.h>

    #define N 3

    /* structure declaration */
    typedef struct {
        double re;
        double im;
    } complex;

    /* definition of function add */
    complex add(complex a, complex b) {
        complex c;
        c.re = a.re + b.re;
        c.im = a.im + b.im;

        return c;
    }

    int main(void) {
        int i;

        /* initialise array of structures (three complex numbers): */
        complex a[N] = {{1.0, 0.0}, {0.0, -1.0}, {-1.0, 1.0}};
        complex s = {0.0, 0.0}; /* zero complex number */

        for(i = 0; i < N; i++) { /* add complex numbers */
            s = add(s, a[i]);
        }

        printf("%f + %fj\n", s.re, s.im);

        return 0;
    }
    ```],
    [```sh
    C:\>.\struct_array.exe
    0.000000 + 0.000000j
    ```],
  ),
  caption: [C code which uses an array of structs.],
  supplement: [Figure],
  kind: figure,
)<11-array-structs>

== Structures and Pointers

The members of a structure can be accessed using a pointer to a structure. This is shown in *@11-pointers-structs* in 2 separate ways, one using a more direct syntax and one using a simplified syntax using the *`->`* operator for C.

#figure(
  grid(
    columns: (0.7fr, 0.3fr),
    [```C
    #include <stdio.h>

    /* structure declaration */
    typedef struct {
        double re;
        double im;
    } complex;

    int main(void) {
        complex v = {0.0, 1.0};
        complex *u = &v;
        /* declaration and definition of a pointer to a structure */

        printf("1: %f + %fj\n", v.re, v.im);
        printf("2: %f + %fj\n", (*u).re, (*u).im); /* dereferencing */
        printf("3: %f + %fj\n", u->re, u->im);    /* dereferencing using new syntax */

        return 0;
    }
    ```],
    [```sh
    C:\>.\struct_pointers.exe
    1: 0.000000 + 1.000000j
    2: 0.000000 + 1.000000j
    3: 0.000000 + 1.000000
    ```],
  ),
  caption: [C code which access members of a structure using a pointer.],
  supplement: [Figure],
  kind: figure,
)<11-pointers-structs>

== Structs, Pointers and Functions

In lecture 10, the process of passing structures into functions was shown. However, that method passes a copy of the variable into the function, which is highly inefficient. Instead, the address of a struct can be used, negating the need for a copy, this is shown in *@11-pointers-functions-structs*.

#figure(
  grid(
    columns: (0.7fr, 0.3fr),
    [```C
    #include <stdio.h>

    /* structure declaration */
    typedef struct {
        double re;
        double im;
    } complex;

    /* definition of function add */
    complex add(complex *a, complex *b) {
        complex c;
        c.re = a->re + b->re;
        c.im = a->im + b->im;

        return c;
    }

    int main(void) {
        complex v = {0.0, 1.0}; /* initialise structures by providing */
        complex u = {1.0, 0.0}; /* a list of initialisers */
        complex w;

        w = add(&v, &u); /* sum v and u (passed as addresses), return as w */

        printf("%f + %fj\n", w.re, w.im);

        return 0;
    }
    ```],
    [```sh
    C:\>.\struct_functions.exe
    1.000000 + 1.000000
    ```],
  ),
  caption: [C code passes the memory address of a pointer into a function, instead of a copy of the variable.],
  supplement: [Figure],
  kind: figure,
)<11-pointers-functions-structs>

== Dynamic Memory Allocation with Structs

Dynamic memory allocation using *`malloc`* and *`sizeof`* can be used with structs, an example of this is shown in line 27 of *@11-struct-dynamic-memory*.

#figure(
  grid(
    columns: (0.7fr, 0.3fr),
    [```C
    #include <stdio.h>
    #include <stdlib.h>

    /* structure declaration */
    typedef struct {
        double re;
        double im;
    } complex;

    /* definition of function add */
    complex add(complex *a, complex *b) {
        complex c;
        c.re = a->re + b->re;
        c.im = a->im + b->im;

        return c;
    }

    int main(void) {
        complex v = {0.0, 1.0}; /* initialise structures by providing */
        complex u = {1.0, 0.0}; /* a list of initialisers */
        complex w, *z;

        w = add(&v, &u); /* sum v and u (passed as pointers), return as w */
        printf("a) %f + %fj\n", w.re, w.im);

        z = (complex *) malloc(sizeof(complex)); /* dynamic memory allocation */
        *z = add(&v, &u); /* same as above but use a pointer */
        printf("b) %f + %fj\n", z->re, z->im);

        free((void *) z);

        return 0;
    }
    ```],
    [```sh
    C:\>.\struct_dynamic.exe
    a) 1.000000 + 1.000000j
    b) 1.000000 + 1.000000j
    ```],
  ),
  caption: [C code passes that uses dynamic memory allocation with structs.],
  supplement: [Figure],
  kind: figure,
)<11-struct-dynamic-memory>

== Pointers as Struct Members

The members of structures can themselves be initialized as pointers, allowing for the call of that member to itself be a pointer. This allows for pointer arithmetic to be done, this can also be combined with dynamic memory allocation. This is shown in *@11-pointer-members*.

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
        complex a, b;
        double x, y;

        x = 1.0;
        y = 2.0;

        /* We can treat the structure members as normal pointers. */
        a.re = &x;
        a.im = &y;
        printf("Complex number is: %4.2lf + %4.2lfj\n", *a.re, *a.im);

        /* Now set up the structure member arrays using
           dynamic memory allocation. */
        b.re = (double *) malloc(2 * sizeof(double));
        b.im = (double *) malloc(2 * sizeof(double));

        /* Populate the arrays. */
        b.re[0] = 1.0;
        b.re[1] = 2.0;

        *b.im = -1.0;        /* can also use pointer arithmetic */
        *(b.im + 1) = -2.0;

        printf("Complex number is: %4.2lf + %4.2lfj\n", b.re[0], b.im[0]);
        printf("Complex number is: %4.2lf + %4.2lfj\n", b.re[1], b.im[1]);
        /* Same but now using pointer arithmetic. */
        printf("Complex number is: %4.2lf + %4.2lfj\n", *b.re, *b.im);
        printf("Complex number is: %4.2lf + %4.2lfj\n", *(b.re + 1), *(b.im + 1));

        free((void *) b.re);
        free((void *) b.im);

        return 0;
    }
    ```],
    [```sh
    C:\>.\struct_pointer_members.exe
    Complex number is: 1.00 + 2.00j
    Complex number is: 1.00 + -1.00j
    Complex number is: 2.00 + -2.00j
    Complex number is: 1.00 + -1.00j
    Complex number is: 2.00 + -2.00j
    ```],
  ),
  caption: [C code which uses pointers members within a struct, as well as using dynamic memory allocation. ],
  supplement: [Figure],
  kind: figure,
)<11-pointer-members>

#pagebreak()
