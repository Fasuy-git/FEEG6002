#import "../template.typ": *

#show: codly-init.with()
#codly(languages: codly-languages)

#lecture("Lecture 5", 1, 3)

== For Loop

A for loop in C requires three input conditions, these are:

- *Initialization* $->$ An expression that is executed once at the start of the loop, often used to initialize a counter variable.

- *Condition* $->$ An expression that is checked before every iteration. If the condition is true, the loop executes, if false, then the loop stops.

- *Update* $->$ An expression applied after each iteration of the loop. It typically increments or updates the loop variable.

Some basic code which utilizes a for loop is shown in *@5-for*. Note that *`i++`* is equivalent to  *`i = i + 1`*.

#figure(
  grid(
    columns: (0.6fr, 0.4fr),
    [```C
      #include <stdio.h>

      int main(void){

        int i;
        int N = 5;

        for (i=0; i<N; i++){
          printf("This is iteration %d of %d.\n", i, N-1);
        }
        return 0;
    }
    ```],
    [```sh
    C:\>.\basic_for.exe
    This is iteration 0 of 4.
    This is iteration 1 of 4.
    This is iteration 2 of 4.
    This is iteration 3 of 4.
    This is iteration 4 of 4.
    ```],
  ),
  caption: [C code which uses a for loop.],
  supplement: [Figure],
  kind: figure,
)<5-for>

Note that using *`++i`* $eq.not$ *`i++`*. Consider the code shown in *@5-pre-post-increment*.

#figure(
  grid(
    columns: (0.7fr, 0.25fr),
    [```C
    #include <stdio.h>

    int main(void) {
        int a = 5;
        int b = 5;

        printf("++a (pre-increment): value = %d\n", ++a);
        printf("b++ (post-increment): value = %d\n", b++);
        printf("b after post-increment = %d\n", b);
        return 0;
    }
    ```],
    [```sh
    C:\>.\pre_post_increment.exe
    ++a (pre-increment): value = 6
    b++ (post-increment): value = 5
    b after post-increment = 6
    ```],
  ),
  caption: [C code which uses a for loop.],
  supplement: [Figure],
  kind: figure,
)<5-pre-post-increment>

== While Loop

A while loop will iterate as long as a defined condition is not met. Note that there is a risk of infinite looping if the condition is never met. An example of a while loop in C is shown in *@5-while-loop*.

#figure(
  grid(
    columns: (0.5fr, 0.5fr),
    [```C
    #include <stdio.h>

    int main(void) {
      int i = 1;

      while (i < 10) {
        printf("i = %d \n", i);
        i = i * 2;
      }
      return 0;
    }
    ```],
    [```sh
    C:\>.\while_loop.exe
    i = 1
    i = 2
    i = 4
    i = 8
    ```],
  ),
  caption: [C code which uses a while loop.],
  supplement: [Figure],
  kind: figure,
)<5-while-loop>

Typically a *for loop* is used when the *number of iterations is known*. On the other hand, a *while loop* when the number of iterations is unknown but there is some sort of *criteria or tolerance* that can be built into a condition.

== Buffering

The standard output *`stdout`* is often buffered, meaning it stores the output data in a buffer and writes it out all at once. The standard error *`stderr`* is typically unbuffered, which means error messages appear immediately.

#pagebreak()
