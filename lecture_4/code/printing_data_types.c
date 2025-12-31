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

