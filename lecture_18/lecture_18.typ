#import "../template.typ": *

#show: codly-init.with()
#codly(languages: codly-languages)

= Lecture 18

== Defining Pointers to a Function

A function is stored in memory in the text or code segment not in a heap or stack. It is possible to define a pointer to a function, which will be useful for passing functions into other functions. The syntax to define a pointer to function is shown in *@18-pointer-function*. Note that the second syntax is the more commonly used one.

#figure(
  [```C
  #include <stdio.h>

  /* A normal function with an int parameter
     and void return type */
  void fun(int a) {
      printf("Value of a is %d\n", a);
  }

  int main(void) {
      /* fun_ptr is a pointer to function fun() */
      void (*fun_ptr)(int) = &fun;

      /* The above line is equivalent to
         void (*fun_ptr)(int);
         fun_ptr = &fun; */

      /* Invoking fun() using fun_ptr */
      (*fun_ptr)(10);

  	/* Equivelent and Simpler Syntax shown below*/
  	void (*fun_ptr)(int) = fun; /* & removed */

  	fun_ptr(10); /* * removed */

      return 0;
  }
  ```],

  caption: [C code depicts how function pointers can be defined.],
  supplement: [Figure],
  kind: figure,
)<18-pointer-function>

== Defining Arrays of Function Pointers

Given that function pointers have the same function prototype they can be used interchangeably. An example of this is shown in *@18-pointer-function-array*, where each function has the same prototype of two inputs.

#figure(
  [```C
  #include <stdio.h>

  void add(int a, int b) {
      printf("Addition is %d\n", a + b);
  }

  void subtract(int a, int b) {
      printf("Subtraction is %d\n", a - b);
  }

  void multiply(int a, int b) {
      printf("Multiplication is %d\n", a * b);
  }

  int main(void) {
      /* fun_ptr_arr is an array of function pointers */
      void (*fun_ptr_arr[])(int, int) = {add, subtract, multiply};
      unsigned int ch, a = 15, b = 10;

      printf("Enter Choice: 0 for add, 1 for subtract and 2 "
             "for multiply\n");
      scanf("%d", &ch);

      if (ch > 2) return 0;

      fun_ptr_arr[ch](a, b);
      /* Equivalent to: */
      /* (*fun_ptr_arr[ch])(a, b); */

      return 0;
  }
  ```],

  caption: [C code which uses an array of function pointers all with the same prototype.],
  supplement: [Figure],
  kind: figure,
)<18-pointer-function-array>

== Passing Functions as Function inputs

The key use of function pointers is to use them as inputs to other functions. Typically this is used to pass a numerical model into a solver function. An example of this is shown in *@18-passing-function-pointer*.

#figure(
  [```C
    double integrate(double (*f)(double), double a, double b)
    {return 0.5 * (f(a) + f(b)) * (b - a);}

    double square(double x)
    {return x * x;
  }

    int main(void)
    {
        double result = integrate(square, 0.0, 2.0);
        printf("%f\n", result);
    }
  ```],

  caption: [C code which shows how a function pointer can be passed into a function.],
  supplement: [Figure],
  kind: figure,
)<18-passing-function-pointer>

== Euler Method

The Euler method is a simple numerical method that can be used to solve ordinary differential equations. The equation for which is shown in *@18-euler-method*.

$
  y_(i+1) approx y_i + Delta t f(x_i,y_i)
$<18-euler-method>

Where $t_i = t_0 + i Delta t$, essentially propagating a numerical approximation of the ODE given some initial conditions. This can be programmed in C in the following way using function pointers, shown in *@18-euler-method-function*.

#figure(
  [```C
  /* Function euler implements Euler method for solving first
     order ODEs dy/dt = f(t, y). Input parameters are:

     t  - independent variable (time) given as 1D array
     y  - dependent variable given as 1D array
     y0 - initial condition
     f  - pointer to a function to be integrated
     n  - the length of arrays t and y (must be equal length)

     The solution is stored in the array y. */

  void euler(double *t, double *y, double y0,
             double (*f)(double, double), int n)
  {
      int i;
      float dt = t[1] - t[0]; /* step */

      y[0] = y0; /* initial condition */
      for (i = 0; i < n; i++) {
          y[i + 1] = y[i] + dt * f(t[i], y[i]);
      }
  }
  ```],

  caption: [C code which shows how Euler method can be implemented in C.],
  supplement: [Figure],
  kind: figure,
)<18-euler-method-function>

== 2nd Order Runge-Kutta Method

Runge-Kutta methods are a collection of numerical methods for solving ODEs. They are more accurate than Euler's method but are more computationally expensive, requiring more computations. The equation for the second order Runge-Kutta method is shown in *@2nd-runge-kutta*.

$
  k_1 = Delta dot f(t_i,y_i) \
  k_2 = Delta dot f(t_i + 1/2 Delta t,y_i + 1/2 Delta t) \
  y_(i + 1) approx y_i + k_2
$<2nd-runge-kutta>

An implementation of this method in C is shown in *@18-rk2*.

#figure(
  [```C
  /* Function rk implements 2nd order Runge-Kutta method for
     solving first order ODEs dy/dt = f(t, y). Input parameters:

     t  - independent variable (time) given as 1D array
     y  - dependent variable given as 1D array
     y0 - initial condition
     f  - pointer to a function to be integrated
     n  - the length of arrays t and y (must be equal length)

     The solution is stored in the array y. */

  void rk2(double *t, double *y, double y0,
           double (*f)(double, double), int n)
  {
      int i;
      float dt = t[1] - t[0]; /* step */

      float k1, k2, k3, k4;

      y[0] = y0; /* initial condition */
      for (i = 0; i < n; i++) {
          k1 = dt * f(t[i], y[i]);
          k2 = dt * f(t[i] + dt / 2.0, y[i] + k1 / 2.0);

          y[i + 1] = y[i] + k2;
      }
  }
  ```],

  caption: [C code which shows how RK2 method can be implemented in C.],
  supplement: [Figure],
  kind: figure,
)<18-rk2>

#pagebreak()
