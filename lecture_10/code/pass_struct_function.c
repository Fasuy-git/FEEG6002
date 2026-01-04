#include <stdio.h>

struct person {
    int age;
    double height;
    double weight;
    char name[10];
};

void printDetails(struct person A) {
    printf("The age is %d.\n", A.age);
    printf("The height is %.1f.\n", A.height);
    printf("The weight is %.1f.\n", A.weight);
    printf("The name is %s.\n", A.name);
}

int main(void) {
    struct person BillyBob = {34, 1.93, 85.0, "BillyBob"};
    struct person Lolipop = {10, 1.5, 40, "Lolypop"};

    printDetails(BillyBob);
    printf("\n");
    printDetails(Lolipop);

    return 0;
}

