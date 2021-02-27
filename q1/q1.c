
#include <stdio.h>
extern int fq1(int n);

int main()
{
    int n;
    scanf("%d", &n);
    int ans = 0;
    ans = fq1(n);
    if (ans == 0)
        printf("TRUE");
    else
        printf("FALSE");

    return 0;
}