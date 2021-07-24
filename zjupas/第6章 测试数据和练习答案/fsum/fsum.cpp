#include <iostream>
using namespace std;

int n;
long long ans;
long long cul(int n)
{
    long long re;
    if (n & 1 == 1) re = (long long)(n+1)*(n+1)/4; else re = (long long)n*n/4;
    if (n>1) re += cul(n/2);
    return re;
}
int main()
{
    freopen("fsum9.in","r",stdin);
    freopen("fsum9.out","w",stdout);
    cin>>n;
    ans = cul(n);
    cout<<ans<<endl;
}
