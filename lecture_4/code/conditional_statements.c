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

