/*
** PROBLEM STATEMENT
**Partition an array (as in quick sort).
**Use first element of array as a pivot. 
**[ void partition(int *array, int noelements) ]
*/

#include <stdio.h>
extern void fun(int *array);

int main()
{
    int n;
    scanf("%d", &n);
    int test[n][n];
    for (int j = 0; j < n; j++)
    {
        for (int i = 0; i < n; i++)
            test[j][i] = 0;
    }

    fun(&test[0][0]);

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            printf("%d ", test[i][j]);
            printf(" ");
        }
        printf("\n");
    }

    return 0;
}
