#include <stdio.h>

int main(void){
	
	int i;
	int N = 5;
	
	for (i=0; i<N; ++i){
		printf("This is iteration %d of %d.\n", i, N-1);
	}
	
	return 0;
}

