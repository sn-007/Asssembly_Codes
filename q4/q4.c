#include <stdio.h>

extern int partition(long long int *a, long long int *ans, int n);

int main()
{
    int n;
    scanf("%d", &n);
    long long int a[n][n], ans[n][n];
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            a[i][j] = 0;
            ans[i][j] = -1;
        }
    }

    int temp = partition(&a[0][0], &ans[0][0], n);
    //printf("%d \n", temp);
    //return 0;
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            printf("%lld ", ans[i][j]);
        }
        printf("\n");
    }
}
