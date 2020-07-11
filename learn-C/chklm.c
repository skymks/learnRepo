#include<stdio.h>

#define X86_FEATURE_LM  (1<<29)

void cpuid(int op, unsigned int *eax, unsigned int *ebx, unsigned int *ecx,
        unsigned int *edx)
{
    __asm__("cpuid"
            : "=a" (*eax),
             "=b" (*ebx),
             "=c" (*ecx),
             "=d" (*edx)
             : "0" (op));
}

int main(void)
{
    unsigned int eax,ebx,ecx,edx;

    cpuid(0x80000000, &eax, &ebx, &ecx, &edx);
    if(eax < 0x80000001)
        goto no_longmode;

    cpuid(0x80000001, &eax, &ebx, &ecx, &edx);
    if(!(X86_FEATURE_LM & edx))
        goto no_longmode;

    printf("x86_64 Long Mode is supported.\n");
    return 0;

no_longmode:
    printf("x86_64 Long Mode is not supported.\n");
    return 1;
}
