#include <stdio.h>
extern int partition(int *array, int *array1, int m, int n);

int main()
{
    int m, n; //n for coloums ,m for rows
    scanf("%d %d", &m, &n);
    int a[m][n], ans[n][m];
    for (int i = 0; i < m; i++)
    {

        for (int j = 0; j < n; j++)
        {
            scanf("%d", &a[i][j]);
            ans[j][i] = -1;
        }
    }

    // for (int i = 0; i < m; i++)
    // {

    //     for (int j = 0; j < n; j++)
    //         ans[j][i] = a[i][j];
    // }

    // int temp = partition(&a[0][0], &ans[0][0], m, n);
    // printf("%d", temp);

    partition(&a[0][0], &ans[0][0], m, n);

    for (int i = 0; i < m; i++)
    {
        for (int j = 0; j < n; j++)
        {
            printf("%d", a[i][j]);
            printf(" ");
        }
        printf("\n");
    }
    printf("\n");
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            printf("%d", ans[i][j]);
            printf(" ");
        }
        printf("\n");
    }
}