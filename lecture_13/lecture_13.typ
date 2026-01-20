#import "../template.typ": *

#show: codly-init.with()
#codly(languages: codly-languages)

#lecture("Lecture 13", 1, 7)

== Using `fscanf` to Read Multiple Lines From Files

Note that the method shown in *@12-fscanf* only returns the first line of the text file. To print the entire contents of the file a while loop can be used, this example is shown in *@12-fscanf-lines*.

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

          double x, y, z;

          if ((f = fopen("numbers.txt", "r")) == NULL) {
              printf("Cannot open 'numbers.txt' for reading");
              return -1;
          }

          while (fscanf(f, "%lf %lf %lf", &x, &y, &z) == 3)
          {
              printf("%lf, %lf, %lf\n", x, y, z);
          }

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
    C:\>.\fscanf_lines.exe
    10.000000, 12.000000, 13.000000
    1.000000, 3.000000, 4.000000
    3.000000, 4.000000, 5.000000
    4.000000, 5.000000, 100.00000
    ```],
  ),
  caption: [C code which uses *`fscanf`* to read every data line from a file.],
  supplement: [Figure],
  kind: figure,
)<12-fscanf-lines>

== Reading Every Character From a File

In previous lectures, the *`getchar`* command was used in conjunction with a while loop to extract every input character from the user. In a similar way, the *`fgetc`* command can be used to extract every character from a file, this is shown in *@12-fgetc*. Note that this will require further processing of the data to remove white space and new line characters.

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
          char c;

          if ((f = fopen("numbers.txt", "r")) == NULL) {
              printf("Cannot open 'myfile.txt' for reading");
              return -1;
          }

          /* read file content char by char and print to stdout */
          while ((c = fgetc(f)) != EOF) {
              printf("%c", c);
          }

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
    C:\>.\fgetc.exe
    10 12 13
    1 3 4
    3 4 5
    4 5 100
    ```],
  ),
  caption: [C code which uses *`fgetc`* to read every character from a file.],
  supplement: [Figure],
  kind: figure,
)<12-fgetc>

== Writing to Files

Instead of using the *`"r"`* flag for the *`fopen`* command, the *`"a"`* and *`"w"`* flags can be used to append and write to a file. Not that the *`"w"`* flag will overwrite an already existing filename. An example of this is shown in *@12-file-writing*.

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

          if ((f = fopen("myfile.txt", "w")) == NULL) {
              printf("Cannot open 'myfile.txt' for writing");
              return -1;
          }

          fprintf(f, "We can now print to the file f using fprintf.\n");
          fprintf(f, "For example, we print a number %d and %d and %d.", 1, 2, 42);

          if (fclose(f) != 0) {
              printf("File could not be closed.\n");
              return -1;
          }

          return 0;
      }
      ```],
    ),
    [```sh
    C:\>type myfile.txt
    We can now print to the file f using fprintf.
    For example, we print a number 1 and 2 and 42
    ```],
  ),
  caption: [C code which uses the *`w`* flag to write into a file.],
  supplement: [Figure],
  kind: figure,
)<12-file-writing>

== Reading Command Line Arguments

At runtime, command line arguments can be passed into the main function of the compiled program. This is done through the *`argc`* and *`argv`* function variables. These are:

- *`argc`*: Argument Count
  - An integer value for the number of command line arguments that have been passed.
  - Note that if none are passed in, then *`argc = 1`* as the name of the program is the first argument and is always passed.
- *`argv`*: Argument Vector
  - A vector of all of the command line arguments that have been passed into the function.
  - *`argv[0]`* is the program name and *`argv[1] -> argv[argc-1]`* are the command line arguments that have been passed in.

An example of a program which makes use of command line arguments is shown in *@12-command-line-args*.

#figure(
  grid(
    columns: (0.7fr, 0.3fr),
    row-gutter: 0.5cm,
    grid.cell(
      rowspan: 2,
      [```C
      #include <stdio.h>

      int main(int argc, char *argv[]) {
          int i;

          for (i = 0; i < argc; i++) {
              printf("Argument %d = '%s'\n", i, argv[i]);
          }

          return 0;
      }
      ```],
    ),
    [```sh
    C:\>.\command_args.exe arg1 arg2 arg3
    Argument 0 = '.\command_args.exe'
    Argument 1 = 'arg1'
    Argument 2 = 'arg2'
    Argument 3 = 'arg3'
    ```],
  ),
  caption: [C code which uses *`argc`* and *`argv`* to pass in command line arguments.],
  supplement: [Figure],
  kind: figure,
)<12-command-line-args>

== Operator Preference

Certain commands are done before others, the order of how commands are computed is shown in *@13-operator-pref*. Note that the address operator is done before the pointer content operator. Furthermore to fine tune the running of command, brackets can be used as they are compiled first.

#figure(
  table(
    columns: 3,
    fill: (column, row) => if row == 0 { gray },
    table.header[*Operator Type*][*Operators*][*Associativity*],
    [Postfix], [(), [], ->, ., expr++, expr--], [Left to Right],
    [Unary], [++expr, --expr, +, -, !, ~, &, \*, sizeof, (type)], [Right to Left],
    [Multiplicative], [\*, /, %], [Left to Right],
    [Additive], [+, -], [Left to Right],
    [Shift], [<<, >>], [Left to Right],
    [Relational], [<, <=, >, >=], [Left to Right],
    [Equality], [==, !=], [Left to Right],
    [Bitwise AND], [&], [Left to Right],
    [Bitwise XOR], [^], [Left to Right],
    [Bitwise OR], [|], [Left to Right],
    [Logical AND], [&&], [Left to Right],
    [Logical OR], [||], [Left to Right],
    [Conditional], [?:], [Right to Left],
    [Assignment], [=, +=, -=, \*=, /=, %=, <<=, >>=, &=, ^=, |=], [Right to Left],
    [Comma], [,], [Left to Right],
  ),
  caption: [Order of preference for operators in C.],
)<13-operator-pref>

== 2D Arrays

2D arrays are an array of an array, essentially a table of data with rows and columns. The syntax for defining a 2D array is *`data_type array_name[rows][columns]`*. If allocation and initialization are done at the same time *the number of rows* can be inferred for example *`int a[][3] = {{1, 2, 3},{4, 5, 6}};`*.

== 2D Matrix Pointer Arithmetic

Pointer arithmetic for 2D arrays is slightly more complex than 1D arrays. The key rules for a generic 2D array called matrix are:

- *`matrix + i`*: Pointer to the i-th row.
- *`matrix[i]`*: Pointer to the first element in the i-th row.
- *`*(matrix + i)`*: Now equivalent to *`matrix[i]`* as its dereferenced.
- *`*(matrix + i) + j`*: Points to the j-th element of the i-th row and is equivalent to the following:
  - *`&matrix[i][j]`*
  - *`matrix[i] + j`*
- *`*(*(matrix + i) + j)`*: Dereferences the pointer retrieving the element in in *`matrix[i][j]`*.

#pagebreak()

