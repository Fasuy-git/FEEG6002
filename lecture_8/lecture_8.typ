#import "../template.typ": *

#show: codly-init.with()
#codly(languages: codly-languages)

= Lecture 8

== Pointers

Pointers are one of the most powerful concepts within C. The following syntax can be used for pointers:

- *`int *p;`* $->$ Initialize the pointer.

- *`p = &c`* $->$ The pointer now holds the memory address of of *`c`*. We say *`p` points to `c`*.

- *`y = *p`* $->$ The variable *`y`* now contains the value of the address that the pointer was pointing to (effectively *`y = c`*).

- *`*p = 0`* $->$ The variable linked to the memory address of the pointer is now set to 0.

An example showing how pointers work is shown in *@8-pointers-basic*.

#figure(
  grid(
    columns: (0.55fr, 0.45fr),
    [```C
    #include <stdio.h>

    int main(void)
    {
        int x = 1, y = 2;
        int *pi; /* pi is pointer to int */

        pi = &x; /* pi now points to x */
        y = *pi; /* y is now 1 */
        *pi = 0; /* x is now 0 */
        pi = &y; /* pi points to y */

        printf("x=%d, y=%d \n", x, y);
        printf("address x=%p, address y=%p \n", (void *) &x, (void *) &y);
        printf("pi=%p, *pi=%d \n", (void *) pi, *pi);

        return 0;
    }
    ```],
    [```sh
    C:\.\pointers_basic.exe
    x=0, y=1
    address x=0060FF0C, address y=0060FF08
    pi=0060FF08, *pi=1
    ```],
  ),
  caption: [C code which illustrates the basic principles of pointers.],
  supplement: [Figure],
  kind: figure,
)<8-pointers-basic>

Note that in *@8-pointers-basic*, the *`printf`* statements use a unique syntax. The *`%p`* formatter is used to print memory addresses, however *`(void *)`* is required as *`%p`* expects a generic pointer type. *`void`* is essentially stripping the type of the pointer to make it generic.


== Swapping Variables

Suppose that we wanted to create a function to swap the value of two variables. An initial attempt at this function is shown in *@8-incorrect-swap* which does not use pointers.

#figure(
  grid(
    columns: (0.6fr, 0.4fr),
    [```C
    #include <stdio.h>

    void swap(int x, int y) {
        int tmp;

        tmp = x;
        x = y;
        y = tmp;
    }

    int main(void) {
        int a = 1, b = 2;

        printf("Before swap a=%d, b=%d\n", a, b);
        swap(a, b);
        printf("After swap a=%d, b=%d\n", a, b);

        return 0;
    }
    ```],
    [```sh
    C:\.\incorect_swap.exe
    Before swap a=1, b=2
    After swap a=1, b=2
    ```],
  ),
  caption: [C code which incorrectly attempts to swap the value of two variables.],
  supplement: [Figure],
  kind: figure,
)<8-incorrect-swap>

Because the variables are passed by value, swapping their copies over does not change over the original values. Instead pointers can be used tom correctly switch over the two variables within the function using their memory addresses. This is shown in *@8-correct-swap*.

#figure(
  grid(
    columns: (0.6fr, 0.4fr),
    [```C
    #include <stdio.h>

    void swap(int *px, int *py) {
        int tmp;

        tmp = *px;
        *px = *py;
        *py = tmp;
    }

    int main(void) {
        int a = 1, b = 2;

        printf("Before swap a=%d, b=%d\n", a, b);
        swap(&a, &b);
        printf("After swap a=%d, b=%d\n", a, b);

        return 0;
    }
    ```],
    [```sh
    C:\.\incorect_swap.exe
    Before swap a=1, b=2
    After swap a=2, b=1
    ```],
  ),
  caption: [C code which correctly swaps the value of two variables.],
  supplement: [Figure],
  kind: figure,
)<8-correct-swap>

#pagebreak()
