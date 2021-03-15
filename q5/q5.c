#include <stdio.h>
extern long long int partition(long long int n);

int main()
{
	long long int n;
	scanf("%lld", &n);

	long long int ans = partition(n);

	printf("%lld ", ans);

	return 0;
}
