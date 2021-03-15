#include <stdio.h>

int froot(int k)
{
    int ans = 1;
    for (int i = 1; i <= k; i++)
    {
        int temp = i * i;
        if (temp <= k)
            ans = i;

        else if (temp > k)
            return ans;
    }
    return ans;
}

int v(int k)
{
    int temp = 1;
    for (int i = 1; i <= k; i++)
        temp = temp * 2;

    return temp;
}

int main()
{
    int n;
    scanf("%d", &n);

    int ans;
    ans = froot(8 * n + 1);
    ans = (ans - 1) / 2;
    ans = (n - ans * (ans - 1) / 2 - 1) * (v(ans)) + 1;

    printf("%d\n", ans);
    return 0;
}