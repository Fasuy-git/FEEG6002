#include <stdio.h>
#include <stdlib.h>

double **zero(void)
{
    /* Function allocates memory for and returns 2x2
       matrix with elements initialised to 0. */

    double **m;

    m = (double **) malloc(2 * sizeof(double *)); /* Two double pointers (rows) */
    m[0] = (double *) malloc(2 * sizeof(double)); /* Two doubles in row 0 */
    m[1] = (double *) malloc(2 * sizeof(double)); /* Two doubles in row 1 */

    m[0][0] = 0.0;
    m[0][1] = 0.0;
    m[1][0] = 0.0;
    m[1][1] = 0.0;

    return m;
}

int main(void)
{
    double **m;

    m = zero();

    /* Free allocated memory */
    free((void *) m[0]);
    free((void *) m[1]);
    free((void **) m);

    return 0;
}

