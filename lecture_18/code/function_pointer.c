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




