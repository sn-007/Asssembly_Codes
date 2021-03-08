#include <stdio.h>
extern int partition(int n, int m);

int main()
{
	int n, m;
	scanf("%d %d", &n, &m);

	int ans = -1;
	ans = partition(n, m);
	printf("%d", ans);

	return 0;
}
