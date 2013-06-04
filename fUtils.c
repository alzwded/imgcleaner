/*
author: Vlad Mesco
date: Tue Jun  4 21:16:27 EEST 2013
description: for some reason WRITE and PRINT don't do anything when compiled
             with gfortran ( :-/ ) so these are print functions for that
             the linker handles everything because why not
*/
#include <stdio.h>
void cprnti_(int* i)
{
    printf(" %d\n", *i);
}

void cprnts_(char* s, int* slen)
{
    size_t I = 0;
    printf(" ");
    for(; I < *slen; putc(s[I++], stdout));
    printf("\n");
}

void cprntf_(float* f)
{
    printf(" %f\n", *f);
}

void cprnmi_(char* m, int* mlen, int* i)
{
    size_t I = 0;
    printf(" ");
    for(; I < *mlen; putc(m[I++], stdout));
    printf(": %d\n", *i);
}

void cprnmf_(char* m, int* mlen, float* f)
{
    size_t I = 0;
    printf(" ");
    for(; I < *mlen; putc(m[I++], stdout));
    printf(": %f\n", *f);
}
