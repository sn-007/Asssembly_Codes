#include <stdio.h>
extern int *partition(int *array, int *array1, int m, int n);

int *cversion(int *array, int *array1, int m, int n)
{

    for (int i = 0; i < m; i++)
    {
        for (int j = 0; j < n; j++)
        {
            int temp1 = j * m;
            temp1 += i;
            temp1 *= 4;
            temp1 += *array;
            printf("%d ", temp1);
            printf(" ");

            // int *temp2 = i * n;
            // temp2 += j;
            // temp2 *= 4;
            // temp2 += *array1;
        }
        printf("\n");
    }
}

int main()
{
    int m, n; //n for coloums ,m for rows
    scanf("%d %d", &m, &n);
    int a[m][n], ans[m][n];
    cversion(&a[0][0], &ans[0][0], m, n);
    // int *temp = &a[0][0];
    // printf("%p \n", temp);
    // temp += 4;
    // printf("%p \n", temp);
    // temp += 4;
    // printf("%p \n", temp);

    // for (int i = 0; i < m; i++)
    // {

    //     for (int j = 0; j < n; j++)
    //     {
    //         scanf("%d", &a[i][j]);
    //     }
    // }

    // partition(&a[0][0], &ans[0][0], m, n);

    // for (int i = 0; i < n; i++)
    // {
    //     for (int j = 0; j < m; j++)
    //     {
    //         printf("%d", ans[i][j]);
    //         printf(" ");
    //     }
    //     printf("\n");
    // }
}