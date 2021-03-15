#include <stdio.h>
long long int ans[100][100];
long long int n;
long long int a[100][100];

long long int check(long long int row, long long int col)
{
    int r = 0, c = col - 1;
    /*for (int i = 0; i < col; i++)
    {
        if (a[row][i] == 1)
            return 0;
    }*/

    while (c >= 0)
    //while1loop
    {
        if (a[row][c] == 1)
            return 0;
        c--;
    }
    //while1end
    r = row - 1;
    c = col - 1;
    while (r >= 0 && c >= 0)
    //while2loop
    {
        if (a[r][c] == 1)
            return 0;
        r--;
        c--;
    }
    //while2end
    r = row + 1;
    c = col - 1;
    while (r < n && c >= 0)
    //while3loop
    {
        if (a[r][c] == 1)
            return 0;
        r++;
        c--;
    }

    return 1;
}

int fun(long long int col)
{
    if (col == n)
    {
        for (int i = 0; i < n; i++)
        {
            for (int j = 0; j < n; j++)
            {
                ans[i][j] = a[i][j];
            }
        }
        return 1;
    }
    //L1
    for (int i = 0; i < n; i++)
    {

        //checkreturn
        if (check(i, col) == 1)
        {
            a[i][col] = 1;
            if (fun(col + 1) == 1)
            {
                return 1;
            }
            //L3
            a[i][col] = 0;
        }
        //L2
    }
    //ret
    return 0;
}

int main()
{
    scanf("%lld", &n);
    fun(0);

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            printf("%lld ", ans[i][j]);
        }
        printf("\n");
    }
}
