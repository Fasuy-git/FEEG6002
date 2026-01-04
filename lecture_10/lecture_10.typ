#import "../template.typ": *

#show: codly-init.with()
#codly(languages: codly-languages)

= Lecture 10

== Intro to Structs

Often there is a need to group pieces of data together which may not have the same datatype. In this case a struct can be used to group variables together, a basic example of a struct is shown in *@10-basic-struct*.

#figure(
  ```C
  #include <stdio.h>

  struct person {
      int age;
      double height;
      double weight;
  };

  int main(void) {
      struct person BillyBob = {34, 1.93, 85.0};
      return 0;
  }
  ```,
  caption: [C code which depicts a basic struct.],
  supplement: [Figure],
  kind: figure,
)<10-basic-struct>

== Optimizing Struct Memory Usage

Struct memory usage can be optimizes by ordering the variables in increasing levels of alignment. On a 64bit system, 8 bytes are used per memory address. This means depending on the ordering of the struct, the total memory used can be different. Take the following example struct shown in *@10-non-optimal-struct*.

#figure(
  ```C
  struct bad {
      char c;     /* 1 byte */
      double d;   /* 8 byte */
      int i;      /* 4 byte*/
  };              /* Total struct size: 24 byte */
  ```,
  caption: [C code which depicts a bad struct.],
  supplement: [Figure],
  kind: figure,
)<10-non-optimal-struct>

Because *`char`* is at the top of the struct it is assigned first. *`double`* is assigned next but, because it is bigger than the remaining bytes on that line it is assigned on a new line of memory. *`int`* is then next assigned on another new line, meaning three total lines of memory are used, adding up to 24 bytes. An optimized struct is shown in *@10-optimal-struct*.

#figure(
  ```C
  struct good {
      double d;   /* 8 byte */
      int i;      /* 4 byte*/
      char c;     /* 1 byte */
  };              /* Total struct size: 16 byte */
  ```,
  caption: [C code which depicts a good struct.],
  supplement: [Figure],
  kind: figure,
)<10-optimal-struct>

In *@10-optimal-struct*, the variables are ordered from most to least alignment, meaning that the *`char`* and *`int`* can be on the same line of memory, meaning this struct takes up 8 less bytes of memory.

== Passing Structs into Functions and Accessing Members

Specific variables of a struct can be accessed using *`.<member-name>`* after the name of the struct. Note that if this is then printed, the *correct formatter* must also be used. An example of this is shown in *@10-pass-struct*.

#figure(
  grid(
    columns: (0.7fr, 0.3fr),
    [```C
    #include <stdio.h>

    struct person {
        int age;
        double height;
        double weight;
        char name[10];
    };

    void printDetails(struct person A) {
        printf("The age is %d.\n", A.age);
        printf("The height is %.1f.\n", A.height);
        printf("The weight is %.1f.\n", A.weight);
        printf("The name is %s.\n", A.name);
    }

    int main(void) {
        struct person BillyBob = {34, 1.93, 85.0, "BillyBob"};
        struct person Lolipop = {10, 1.5, 40, "Lolypop"};

        printDetails(BillyBob);
        printf("\n");
        printDetails(Lolipop);

        return 0;
    }
    ```],
    [```sh
    C:\.\pass_struct_function.exe
    The age is 34.
    The height is 1.9.
    The weight is 85.0.
    The name is BillyBob.

    The age is 10.
    The height is 1.5.
    The weight is 40.0.
    The name is Lolypop
    ```],
  ),
  caption: [C code which passes a struct into a function and access its members.],
  supplement: [Figure],
  kind: figure,
)<10-pass-struct>

== Custom Struct Functions

It is possible to define complex behavior for structs via object-level programming. An example where a struct is defined for a complex number and then a custom add function is then defined is shown in *@10-custom-struct-function*.

#figure(
  grid(
    columns: (0.7fr, 0.3fr),
    [```C
    #include <stdio.h>

    /* structure declaration */
    struct complex {
        double re;
        double im;
    };

    /* definition of function add */
    struct complex add(struct complex a, struct complex b) {
        struct complex c;

        c.re = a.re + b.re;
        c.im = a.im + b.im;

        return c;
    }

    int main(void) {
        struct complex v = {1.0, 0.0}; /* initialise structures by providing */
        struct complex u = {0.0, 1.0}; /* a list of initialisers */
        struct complex w;

        w = add(v, u); /* sum v and u, return the sum as w */

        printf("%f + %fj\n", w.re, w.im);

        return 0;
    }
    ```],
    [```sh
    C:\.\custom_struct_functions.exe
    1.000000 + 1.000000j
    ```],
  ),
  caption: [C code which defines a custom struct function],
  supplement: [Figure],
  kind: figure,
)<10-custom-struct-function>

== Using *`typedef`*

The custom struct function defined in *@10-custom-struct-function*, the syntax is a bit cumbersome to use. To combat this, the *`typedef`* function can be used instead, the same struct and function that were in *@10-custom-struct-function* are defined using *`typedef`* in *@10-typedef*.

#figure(
  grid(
    columns: (0.7fr, 0.3fr),
    [```C
    #include <stdio.h>

    /* structure declaration using typedef */
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

        complex v = {1.0, 0.0}; /* initialise structures by providing */
        complex u = {0.0, 1.0}; /* a list of initialisers */
        complex w;

        w = add(v, u); /* sum v and u and return as w */

        printf("%f + %fj\n", w.re, w.im);

        return 0;
    }
    ```],
    [```sh
    C:\.\using_typedef.exe
    1.000000 + 1.000000j
    ```],
  ),
  caption: [C code which defines a custom struct function using *`typedef`*.],
  supplement: [Figure],
  kind: figure,
)<10-typedef>

#pagebreak()
