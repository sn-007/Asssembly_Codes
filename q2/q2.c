#include <stdio.h>
extern int partition(long long *array, long long int *array1, int m, int n);

int main()
{
    int m, n; //n for coloums ,m for rows
    scanf("%d %d", &m, &n);
    long long int a[m][n], ans[n][m];
    for (int i = 0; i < m; i++)
    {

        for (int j = 0; j < n; j++)
        {
            scanf("%lld", &a[i][j]);
            ans[j][i] = -1;
        }
    }

    partition(&a[0][0], &ans[0][0], m, n);

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            printf("%lld ", ans[i][j]);
            printf(" ");
        }
        printf("\n");
    }
}
