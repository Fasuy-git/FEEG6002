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

