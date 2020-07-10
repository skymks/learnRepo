#include<stdio.h>

long shift(long x, long n){
    x<<=63;
    x>>=n;
    return x;
}

int main(){
    long a=shift(1,63);
    printf("%ld",a);
    return 0;
}
