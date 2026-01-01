#import "../template.typ": *

#show: codly-init.with()
#codly(languages: codly-languages)

= Lecture 6

== How Computers Store numbers

A computer stores numbers or data in bits, which can either be 1 or 0. A bit is the smallest unit of data, chaining multiple bits together yields the following:

- *1 bit*
- *1 byte* = 8 bits
- *1 kilobyte* = $10^3$ bytes (kb)
- *1 megabyte* = $10^6$ bytes (Mb)
- *1 gigabyte* = $10^9$ bytes (Gb)

Integer numbers can be converted to bits (binary) by expanding power of 2 using *@6-decimal*.

$
  D = sum_(i=0)^(8-1) b_i 2^i
$<6-decimal>

Where $b_i$ is either 0 or 1 and $i$ is the number of bits. For example if $D = 13$ then the 8 bit binary representation of this number is $00001101_2$. Negative numbers can be represented by using a *sign bit*, which is where the most significant bit represents the sign of the number.

An *unsigned 8 bit integer* can range from 0 ($00000000_2$) to 255 ($11111111_2$). A *signed 8 bit integer* can range from -128 ($10000000_2$) to 127 ($11111111_2$).


== Data Type Limits

As was stated in *@4-table-integer-types-ranges*, there are limits for the size of each data type. These can be calculated using *@6-decimal* but can also be displayed by C itself, as shown in *@6-datatype-limits*.

#figure(
  grid(
    columns: (0.65fr, 0.35fr),
    [```C
    #include <limits.h>  /* limits for integers */
    #include <float.h>   /* limits for floats */
    #include <stdio.h>

    int main(void) {
      printf("    CHAR_MIN = %12d\n", CHAR_MIN);
      printf("    CHAR_MAX = %12d\n", CHAR_MAX);
      printf("    SHRT_MIN = %12d\n", SHRT_MIN);
      printf("    SHRT_MAX = %12d\n", SHRT_MAX);
      printf("     INT_MIN = %12d\n", INT_MIN);
      printf("     INT_MAX = %12d\n", INT_MAX);
      printf("    LONG_MIN = %12ld\n", LONG_MIN);
      printf("    LONG_MAX = %12ld\n", LONG_MAX);
      printf("     FLT_MIN = %12e\n", FLT_MIN);
      printf("     FLT_MAX = %12e\n", FLT_MAX);
      printf("     DBL_MIN = %12e\n", DBL_MIN);
      printf("     DBL_MAX = %12e\n", DBL_MAX);
      return 0;
    }
    ```],
    [```sh
    C:\>.\displaying_limits.exe
    CHAR_MIN =         -128
    CHAR_MAX =          127
    SHRT_MIN =       -32768
    SHRT_MAX =        32767
     INT_MIN =  -2147483648
     INT_MAX =   2147483647
    LONG_MIN =  -2147483648
    LONG_MAX =   2147483647
     FLT_MIN = 1.175494e-038
     FLT_MAX = 3.402823e+038
     DBL_MIN = 2.225074e-308
     DBL_MAX = 1.797693e+308
    ```],
  ),
  caption: [C code which displays the maximum value limits of datatypes.],
  supplement: [Figure],
  kind: figure,
)<6-datatype-limits>

== Floating Point numbers

Computers can store decimal numbers using floating point representation, the general form of a floating point number is shown in *@6-floating-point-representation*.

$
  x = a dot 10^b
$<6-floating-point-representation>

Where *$a ->$* mantissa and *$b ->$* exponent. Assuming 32bit precision, and adhering to the IEEE 754 standard, the bits are assigned as follows:

- *1 sign bit.*
- *8 bits for the exponent* representing the powers of 2, with a bias of 127.
- *23 bits for the mantissa* representing the significant digits of the number.

The issue with representing numbers in this way is that *real numbers can only be represented with finite precision*. Often simple division will leave a very small error which can accumulate in a iterative program,  *@6-numerical_error* depicts this.

#figure(
  grid(
    columns: (0.55fr, 0.45fr),
    [```C
    #include <stdio.h>

    int main(void) {

        float a, b, result;
        float x, y, z;

        a = 1.0f;
        b = 3.0f;
        result = a / b;
        printf("a / b = %.20f\n", result);

        x = 0.1f;
        y = 0.2f;
        z = x + y;
        printf("0.1 + 0.2 = %.20f\n", z);

        return 0;
    }
    ```],
    [```sh
    C:\>.\numerical_error.exe
    a / b = 0.33333334326744080000
    0.1 + 0.2 = 0.30000001192092896000
    ```],
  ),
  caption: [C code which depicts the numerical instability with floating point numbers.],
  supplement: [Figure],
  kind: figure,
)<6-numerical_error>

== Integer Division

Often integer division in C will truncate decimal places, to combat this the variables must be cast as a float or double either before or during the division, this is shown in *@6-correct-integer-division*.

#pagebreak()

#figure(
  grid(
    columns: (0.55fr, 0.45fr),
    [```C
    #include <stdio.h>

    int main(void) {

      int a=10; int b=3; double c;

      c = (double) b/a; /*HERE*/
      printf("a=%d, b=%d, c=%f\n", a, b, c);

      return 0;
    }
    ```],
    [```sh
    C:\>.\integer_division.exe
    a=10.000000, b=3.000000, c=0.30000
    ```],
  ),
  caption: [C code which depicts correct integer division.],
  supplement: [Figure],
  kind: figure,
)<6-correct-integer-division>

== Functions in C

Instead of writing sections of code again and again, functions can be used to compartmentalize the code and then these functions can be easily called over and over again. there are four main parts of a function, these are:

- *return type* $->$ Specifies what kind of value the function returns. It can be any valid C data type like *`int`*, *`float`*, *`char`*, etc. If a function does not return anything, its return type is *`void`*.

- *function name* $->$ This is the identifier for the function. The name is used to call the function later in the program.

- *parameters* $->$  Functions can take inputs, known as parameters or arguments, which are passed to the function when it is called. These parameters are declared inside parentheses ().

- *function body* $->$ the code inside the function that performs the task is written within curly braces {}.

- *return* $->$ if the function has a return type other than *`void`*, it must return a value using the return statement.

An example of a function is shown in *@6-C-function*

#figure(
  grid(
    columns: (0.55fr, 0.45fr),
    [```C
    #include <stdio.h>

    int power(int base, int n) {
        /* power: raise base to the n-th power; n >= 0 */

        int i, p;

        p = 1;
        for (i = 1; i <= n; ++i) {
            p = p * base;
        }

        return p;
    }

    int main(void) {

        int i;

        for (i = 0; i < 6; ++i) {
            printf("%2d %6d %6d\n", i, power(2, i), power(-3, i));
        }

        return 0;
    }
    ```],
    [```sh
    C:\>.\function_example.exe
    0      1      1
    1      2     -3
    2      4      9
    3      8    -27
    4     16     81
    5     32   -24
    ```],
  ),
  caption: [C code which depicts an example of a function.],
  supplement: [Figure],
  kind: figure,
)<6-C-function>

Instead of the structure shown in *@6-C-function*, a function can instead be initialized before its call, this is called a *functions prototype*, the prototype for the function in *@6-C-function* is *`int power(int base, int n);`*. Prototypes are what is used by header files.

Whenever a variable is passed into a function, a copy of that variables contents are used, not the variable itself.

== Symbolic Constants and Types

Symbolic constants and types can be defined at the top of C code and allow for creation of constants which are the same throughout the code. This is achieved by using *`#`* which in C signifies a process the pre-processor must do. An example of these are shown in *@6-symbolic*.

#figure(
  grid(
    columns: (0.55fr, 0.45fr),
    [```C
    #include <stdio.h>
    #include <math.h> /* include math-header for sqrt-function */

    #define N 10   /* total number of lines in table */
    #define a 1.0  /* starting with x=a */
    #define b 10.0 /* ending with x=b */

    #define MYINT int

    MYINT main(void) {
        /* print table of N square roots sqrt(x) for x in [a,b] */

        double x; /* being used in for-loop */
        MYINT i;    /* iteration counter for for-loop */

        for (i = 0; i < N; i++) {
            x = a + i * (b - a) / (N - 1); /* compute x */

            /* compute sqrt(x) and print result */
            printf(" sqrt(%f) = %f\n", x, sqrt(x));
        }

        return 0;
    }
    ```],
    [```sh
    C:\>.\symbolic_things.exe
    sqrt(1.000000) = 1.000000
    sqrt(2.000000) = 1.414214
    sqrt(3.000000) = 1.732051
    sqrt(4.000000) = 2.000000
    sqrt(5.000000) = 2.236068
    sqrt(6.000000) = 2.449490
    sqrt(7.000000) = 2.645751
    sqrt(8.000000) = 2.828427
    sqrt(9.000000) = 3.000000
    sqrt(10.000000) = 3.16227
    ```],
  ),
  caption: [C code which depicts use of symbolic constants.],
  supplement: [Figure],
  kind: figure,
)<6-symbolic>

#pagebreak()
