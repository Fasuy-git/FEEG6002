#import "../template.typ": *

#show: codly-init.with()
#codly(languages: codly-languages)

#lecture("Lecture 9", 1, 5)

== Pointers and Arrays

Pointers and arrays are strongly linked together. Consider an array of 10 elements called *`a`* (*`int a[10]`*). If an integer pointer is defined *`int *pa`* and then told to point to the memory address of the first element in the array *`pa = &a[0]`* (equivalent to *`pa = a`* as *`a`* is a pointer to the first object anyways) then adding 1 to *`pa`* will move to the next element in the array. This happens regardless to the datatype used, that many bits of memory area always moved when adding an integer.

Whenever an array is passed into a function , a copy of the array is not sent to the function. Instead a pointer to the first element of the array is passed, meaning the following two lines are equivalent.

- *`void print_array(int a[], int n);`*
- *`void print_array(int *a, int n);`*

== `Sizeof` Function

The *`sizeof`* operator is used tor return the length of a datatype in bytes. This function is included in the standard input output library and is crucial for structs and dynamic memory allocation. An example usecase for this variable is shown in *@9-sizeof*.


#figure(
  grid(
    columns: (0.7fr, 0.3fr),
    [```C
    #include <stdio.h>

    int main(void) {

        printf("sizeof(char) = %d\n", (int) sizeof(char));
        printf("sizeof(short) = %d\n", (int) sizeof(short int));
        printf("sizeof(int) = %d\n", (int) sizeof(int));
        printf("sizeof(long) = %d\n", (int) sizeof(long int));
        printf("sizeof(float) = %d\n", (int) sizeof(float));
        printf("sizeof(double) = %d\n", (int) sizeof(double));
        printf("sizeof(double *) = %d\n", (int) sizeof(double *));
        printf("sizeof(char*) = %d\n", (int) sizeof(char *));
        printf("sizeof(FILE*) = %d\n", (int) sizeof(FILE *));

        return 0;
    }
    ```],
    [```sh
    C:\.\sizeof.exe
    sizeof(char) = 1
    sizeof(short) = 2
    sizeof(int) = 4
    sizeof(long) = 4
    sizeof(float) = 4
    sizeof(double) = 8
    sizeof(double *) = 4
    sizeof(char*) = 4
    sizeof(FILE*) = 4
    ```],
  ),
  caption: [C code which utilizes the *`sizeof`* operator to display the length of the datatypes.],
  supplement: [Figure],
  kind: figure,
)<9-sizeof>
