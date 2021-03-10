#include<stdio.h>
extern long long * transpose(long long *A, int n, int m);

int main()
{
	int n, m;
    long long A[100005];
    
	scanf("%d %d",&n, &m);

    if (m > 0 && n > 0) {
        for (int i = 0; i<n; i++)
            for (int j =0; j<m;j++)
                scanf("%lld", &A[m*i+j]);

        long long *B;
        B = transpose(A, n, m);
        for (long long i = 0; i<m; i++){
            for (long long j =0; j<n;j++)
                printf("%lld ", B[n*i+j]);
            printf("\n");
        }
    }

	return 0;
}