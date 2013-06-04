/*
author: Vlad Mesco
date: Tue Jun  4 21:17:47 EEST 2013
description: header file with fortran functions
             documentation is (or rather should be) in each individual file
*/
#ifndef IMGCLEANF_H
#define IMGCLEANF_H

extern int isgray_(int** p);
extern void grayns_(int** p, float* g);
extern void fillpb_(int** pb, int* pbw, int* pbh, int** gm, int* gmw, int* gmh, int** dm, int* dmw, int* dmh);
extern void clean_(int** pb, int* pbw, int* pbh, int** gm, int* gmw, int* gmh, int** dm, int* dmw, int* dmh);

#endif
