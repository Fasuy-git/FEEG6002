#import "../template.typ": *

#show: codly-init.with()
#codly(languages: codly-languages)

#lecture("Lecture 7", 1, 4)

== Arrays

Arrays allow for storing multiple values within one organized structure. An example of some code which utilizes an array is shown in *@7-arrays*.

#figure(
  grid(
    columns: (0.55fr, 0.45fr),
    [```C
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
    ```],
    [```sh
    C:\>.\arrays_example
    Enter 5 numbers:
    Number 1: 1
    Number 2: 2
    Number 3: 3
    Number 4: 4
    Number 5: 5
    Sum of the array elements: 15
    Average of the array elements: 3.0
    ```],
  ),
  caption: [C code which depicts use of arrays.],
  supplement: [Figure],
  kind: figure,
)<7-arrays>

When arrays are initialized with the syntax shown in *@7-arrays*, this is referred to as the *static definition* of the array. The length of the array is immutable and the memory allocated for teh array is fixed.

== Strings

Strings are essentially just an array of characters. There are two ways to define a string, the first is to define an empty character array and then populate it as shown in *@7-manual-string*. Note that *`\0`* is appended at the end, this signifies to C that this is a string and not just an array of characters, allowing it to be printed.

#figure(
  grid(
    columns: (0.55fr, 0.45fr),
    [```C
    #include <stdio.h>

    /* demonstrate string termination */
    int main(void) {
        char a[10];

        a[0] = 'h';
        a[1] = 'e';
        a[2] = 'l';
        a[3] = 'l';
        a[4] = 'o';
        a[5] = '\n';
        a[6] = '\0';

        printf("%s", a);

        return 0;
    }
    ```],
    [```sh
    C:\>.\manual_string.exe
    hello
    ```],
  ),
  caption: [C code which manually constructs a string.],
  supplement: [Figure],
  kind: figure,
)<7-manual-string>

Another way of creating a string is by defining it at creation of the variable. In this way the length of the string does not need to be explicitly defined as it is implied by the length of the text. Furthermore the *`\0`* is also not needed, an example of this is shown in *@7-auto-string*.

#figure(
  grid(
    columns: (0.55fr, 0.45fr),
    [```C
    #include <stdio.h>

    /* demonstrate string termination I */
    int main(void) {
        char s[] = "hello\n";
        int i;

        printf("%s", s);
        for (i = 0; i < 7; i++)
            printf("s[%d]='%c'=%3d\n", i, s[i], s[i]);

        return 0;
    }
    ```],
    [```sh
    C:\>.\auto_string.exe
    hello
    s[0]='h'=104
    s[1]='e'=101
    s[2]='l'=108
    s[3]='l'=108
    s[4]='o'=111
    s[5]='
    '= 10
    s[6]=''=  0
    ```],
  ),
  caption: [C code which 'automatically' creates a string.],
  supplement: [Figure],
  kind: figure,
)<7-auto-string>

Note that in the output of *@7-auto-string*, the new line character which is the 5th character in the string is printed and the output is put onto a new line.

== String Manipulation

There is a standard library in C that can be used to do string manipulation, this is called *`<string.h>`*. It has within it the following functions:

- *`strlen()`* $->$ Get the length of the string (excluding the null character).
- *`strcpy()`* $->$ Copy one string to another.
- *`strcat()`* $->$ Concatenate (append) two strings.
- *`strcmp()`* $->$ Compare two strings.

An example C code which utilizes these functions is shown in *@7-string-manipulation*.

#figure(
  grid(
    columns: (0.55fr, 0.45fr),
    [```C
    #include <stdio.h>
    #include <string.h>

    int main(void) {

        char s1[50] = "hello";
        char s2[50] = "world";
        char copy[50];
        int cmp;

        /* strlen */
        printf("Length of s1 = %lu\n", (unsigned long) strlen(s1));
        printf("Length of s2 = %lu\n", (unsigned long) strlen(s2));

        /* strcpy */
        strcpy(copy, s1);
        printf("After strcpy, copy = %s\n", copy);

        /* strcat */
        strcat(s1, " ");   /* add a space */
        strcat(s1, s2);    /* append "world" */
        printf("After strcat, s1 = %s\n", s1);

        /* strcmp */
        cmp = strcmp(s1, s2);
        if (cmp == 0) {
            printf("s1 and s2 are equal\n");
        } else if (cmp < 0) {
            printf("s1 comes BEFORE s2 in dictionary order\n");
        } else {
            printf("s1 comes AFTER s2 in dictionary order\n");
        }

        return 0;
    }
    ```],
    [```sh
    .\string_manip.exe
    Length of s1 = 5
    Length of s2 = 5
    After strcpy, copy = hello
    After strcat, s1 = hello world
    s1 comes BEFORE s2 in dictionary order
    ```],
  ),
  caption: [C code which uses functions from the *`string.h`* library to manipulate strings.],
  supplement: [Figure],
  kind: figure,
)<7-string-manipulation>

#pagebreak()
