#include <iostream>
using namespace std;
long long ans,width,height;
int n,m;
int main()
{
	freopen("nottwo9.in","r",stdin);
	freopen("nottwo9.out","w",stdout);
	scanf("%d %d",&n,&m);
        ans = 0;width = n; height = m;
        ans += ((width+1)/2*((height+1)/2)+1)/2;
        ans += ((width)/2*((height+1)/2)+1)/2;
        ans += ((width+1)/2*((height)/2)+1)/2;
        ans += ((width)/2*((height)/2)+1)/2;
	cout << ans << endl;
}
