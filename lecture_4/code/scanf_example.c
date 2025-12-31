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

