#include <stdio.h>
extern int partition(int *array, int *array1, int m, int n);

int main()
{
    int m, n; //n for coloums ,m for rows
    scanf("%d %d", &m, &n);
    int a[m][n], ans[n][m];
    int test[4] = {-1, -1, -1, -1};
    for (int i = 0; i < m; i++)
    {

        for (int j = 0; j < n; j++)
        {
            scanf("%d", &a[i][j]);
            ans[j][i] = -1;
        }
    }

    /*for (int i = 0; i < 4; i++)
    {
        printf("%d", test[i]);
        printf("\n");
    }*/

    int temp = partition(&a[0][0], &ans[0][0], m, n);

    /*partition(&a[0][0], &test[0], m, n);
    for (int i = 0; i < 4; i++)
    {
        printf("%d", test[i]);
        printf("\n");
    }

    for (int i = 0; i < 4; i++)
    {
        printf("%d", &test[i]);
        printf("\n");
    }

    return 0;*/

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
    printf("%d", temp);
}
