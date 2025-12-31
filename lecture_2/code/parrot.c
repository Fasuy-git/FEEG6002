#include <stdio.h>
int main()
{
	int c;
	fprintf(stderr, "Enter some characters (Ctrl-Z + Enter quits)\n");
	while ((c = getchar()) != EOF) {
		putchar(c);
	}
	fprintf(stderr, "Goodbye\n");
	return 0;
}

