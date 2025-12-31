#import "../template.typ": *

#show: codly-init.with()
#codly(languages: codly-languages)

#lecture("Lecture 3", 1, 2)

= Lecture 4

== Basic Data Types

There exists 4 key datatypes within C, these are:

- *`int`* $->$ Integer or a whole number. Uses 4 bytes (32 bits) of memory with 1 sign bit and 31 magnitude bits. Can store numbers in the range of $-2,147,483,648$ to $+2,147,483,647$

- *`char`* $->$ Stores a single character using 1 byte (4 bits). Stores the character as an ASCII code in memory.

- *`float`* $->$ Stores a decimal number in  4 bytes (32 bits). Called single precision, this allows for 6 - 7 decimal digits and has a range from $1.175 times 10^(-38)$ to $3.402 times 10^(38)$.

- *`double`* $->$ Stores a decimal number in 8 bytes (64 bits). Called double precision, this allows for 15 - 16 decimal digits and has a range from $2.225 times 10^(-308)$ to $1.798 times 10^(308)$.

- *`bool`* $->$ Can be True or False (1 or 0).

== Signed, Unsigned, Short and Long Datatypes

*`int`* and *`char`* datatypes can be signed or unsigned, by default they are both signed. Declaring an integer as unsigned means it can *only store non-negative values*. This means instead of the range being centered at zero, all bits are used to store the number. For a 32 bit integer, this means the range for this variable is 0 to 4,294,967,295.

An integer can also be defined as *`short`*, *`long`* and  *`long long`*, which specify how many bits are used to store the number. The number of bits for each type as well as their maximum ranges are show in *@4-table-integer-types-ranges*.

#figure(
  table(
    columns: 5,
    fill: (column, row) => if row == 0 { gray },
    table.header([*Keyword*], [*Windows Size*], [*Linux/macOS Size*], [*Signed*], [*Unsigned Range*]),

    // rows
    [short], [16-bit], [16-bit], [±32k], [ 0 - 65k],
    [int], [32-bit], [32-bit], [±2.1B ], [ 0 - 4.2B],
    [long], [32-bit], [64-bit], [varies], [varies],
    [long long], [64-bit], [64-bit], [±9e18 ], [ 0 - 1.8e19],
  ),
  caption: [Integer type sizes and ranges],
)<4-table-integer-types-ranges>


== Using *`printf`* to Print Variables

The *`printf`* command can be used to print out all of the variable types perviously mentioned. On top of this, formatting can also be used to print specific outputs.
An example code which shows this is shown in *@4-printing-datatypes*.

#pagebreak()

#figure(
  grid(
    columns: (0.7fr, 0.3fr),
    [```C
    # include <stdio.h>

    int main(void) {
      int var1 = -42;
      unsigned int var2 = 142;
      float var3 = 3.14;
      double var4 = 3.1428;
      char var5[] = "Hello World";

      printf("Printing int var1=%d\n", var1);
      printf("Printing unsigned int var2=%u\n", var2);
      printf("Printing float var3=%f\n", var3);
      printf("Printing double var4=%f\n", var4);
      printf("Printing double in scientific notation var4=%e\n", var4);
      printf("Printing char[] var5=%s\n", var5);
      return 0;
    }
    ```],
    [```sh
    C:\>.\printing_data_types.exe
    Printing int var1=-42
    Printing unsigned int var2=142
    Printing float var3=3.140000
    Printing double var4=3.142800
    Printing double in scientific notation var4=3.142800e+000
    Printing char[] var5=Hello World

    ```],
  ),
  caption: [C code which assigns each variable type and prints it.],
  supplement: [Figure],
  kind: figure,
)<4-printing-datatypes>

Further formatting can be achieved by using specific formatters, this is shown in *@4-specific-printf*.

#figure(
  grid(
    columns: (0.7fr, 0.3fr),
    [```C
    #include <stdio.h>

    int main(void) {

      double pi = 3.1415926535897931;

      printf("As a standard float representation: pi=%f\n", pi);
      printf("In exponential notation: pi=%e\n", pi);
      printf("Whichever of the above two is shorter: pi=%g\n", pi);
      printf("Request 10 digits overall: pi=%10f\n", pi);
      printf("With 3 postdecimal digits: pi=%10.3f\n", pi);
      printf("12 postdecimal digits: pi=%.12f\n", pi);

    return 0;
    }
    ```],
    [```sh
    C:\>.\printing_data_types.exe
    As a standard float representation: pi=3.141593
    In exponential notation: pi=3.141593e+000
    Whichever of the above two is shorter: pi=3.14159
    Request 10 digits overall: pi=  3.141593
    With 3 postdecimal digits: pi=     3.142
    12 postdecimal digits: pi=3.141592653590

    ```],
  ),
  caption: [C code which customizes the output of *`printf`* using formatting flags.],
  supplement: [Figure],
  kind: figure,
)<4-specific-printf>

#pagebreak()

A summary of which formatters are used with specific datatype is shown below:

- *`%d`* & *`%i`* $->$ Signed *`int`*, *`short`*, *`chars`*.
- *`%ld`* & *`%li`* $->$ Signed *`long`* integers.
- *`%f`* $->$ Floating point representation of *`double`* or *`float`*.
- *`%e`* $->$ Exponential notation of *`double`* or *`float`*.
- *`%g`* $->$ *`f`* or *`e`* depending on which is shorter.
- *`%s`* $->$ Arrays of characters (*`char`*, *`char[]`*).
- *`%u`* $->$ Unsigned integers (unsigned *`int`*, *`short`*, *`char`*).
- *`%<n1>.<n2>f`* $->$ *`n1`* overall digits and *`n2`* decimal digits (This can result in whitespace).

== Using *`scanf`*

The *`scanf`* command is useful for allowing the user to input a value which can then be saved as a variable, an example program which takes a character and integer input is shown in *@4-scanf*.

#figure(
  grid(
    columns: (0.7fr, 0.3fr),
    [```C
    #include <stdio.h>

    int main(void)
    {
        int inputted_numb;
        char inputted_char;

        printf("Enter an integer.\n");
        scanf("%d", &inputted_numb);
        printf("Inputted number = %d\n", inputted_numb);

        printf("Enter a character.\n");
        scanf(" %c", &inputted_char);
        printf("Inputted character = %c\n", inputted_char);

        return 0;
    }
    ```],
    [```sh
    C:\>.\scanf_example.exe
    Enter an integer.
    67
    Inputted number = 67
    Enter a character.
    B
    Inputted character = B

    ```],
  ),
  caption: [C code which uses *`scanf`* to take in a user input.],
  supplement: [Figure],
  kind: figure,
)<4-scanf>

Note that for this code to run a space is required in line 13 before *`%c`* as the *`\n`* from the previous line effects it. Furthermore, the *`&`* refers to the memory address of the variable, not its value.

== Conditional Statements in C

*`if-else`* and *`if-else if-else`* statements can be used to run a specific block of code when a condition is met. There are two types of conditions that can be specified within a conditional, these are *relational operators* and *logical operators*. These can be combined together to form composite statements, all of these operators are shown below:

#pagebreak()

#grid(
  columns: (1fr, 1fr),
  [
    - *Relational operators*:
    - *`a==b`* $->$ a equal to b
    - *`a!=b`* $->$ a not equal to b
    - *`a>b`* $->$ a greater than b
    - *`a<b`* $->$ a less than b
    - *`a>=b`* $->$ a greater than or equal to b
    - *`a<=b`* $->$ a less than or equal to b
  ],
  [
    - *Logical operators*:
    - *`&&`* $->$ logical AND
    - *`||`* $->$ logical OR
    - *`!`* $->$ logical NOT
  ],
)

An example code that uses composite statements using multiple operators is shown in *@4-conditional*.

#figure(
  grid(
    columns: (0.6fr, 0.4fr),
    [```C
    #include <stdio.h>

    int main(void)
    {
        int user_input;

        printf("Enter an integer.\n");
        scanf(" %d", &user_input);

        if (user_input > -10 && user_input < 0) {
            printf("Input is between -10 and 0\n");
        } else if (user_input == 5) {
            printf("Input is 5\n");
        } else {
            printf("The input is: %d\n", user_input);
        }

        return 0;
    }
    ```],
    [```sh
    C:\>.\conditional_statements.exe
    Enter an integer.
    5
    Input is 5
    C:\>.\conditional_statements.exe
    Enter an integer.
    -7
    Input is between -10 and 0
    C:\>.\conditional_statements.exe
    Enter an integer.
    52
    The input is: 52
    ```],
  ),
  caption: [C code which uses conditional statements.],
  supplement: [Figure],
  kind: figure,
)<4-conditional>


#pagebreak()






