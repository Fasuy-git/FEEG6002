#include <stdio.h>
#include <string.h>

int main(void) {

    char s1[50] = "hello";
    char s2[50] = "world";
    char copy[50];
    int cmp;

    /* strlen */
    printf("Length of s1 = %lu\n", (unsigned long) strlen(s1));
    printf("Length of s2 = %lu\n", (unsigned long) strlen(s2));

    /* strcpy */
    strcpy(copy, s1);
    printf("After strcpy, copy = %s\n", copy);

    /* strcat */
    strcat(s1, " ");   /* add a space */
    strcat(s1, s2);    /* append "world" */
    printf("After strcat, s1 = %s\n", s1);

    /* strcmp */
    cmp = strcmp(s1, s2);
    if (cmp == 0) {
        printf("s1 and s2 are equal\n");
    } else if (cmp < 0) {
        printf("s1 comes BEFORE s2 in dictionary order\n");
    } else {
        printf("s1 comes AFTER s2 in dictionary order\n");
    }

    return 0;
}

