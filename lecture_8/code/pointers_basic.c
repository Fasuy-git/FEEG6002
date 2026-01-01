#include <stdio.h>

int main(void)
{
    int x = 1, y = 2;
    int *pi; /* pi is pointer to int */

    pi = &x; /* pi now points to x */
    y = *pi; /* y is now 1 */
    *pi = 0; /* x is now 0 */
    pi = &y; /* pi points to y */

    printf("x=%d, y=%d \n", x, y);
    printf("address x=%p, address y=%p \n", (void *) &x, (void *) &y);
    printf("pi=%p, *pi=%d \n", (void *) pi, *pi);

    return 0;
}

