#ifndef IMGCLEANF_H
#define IMGCLEANF_H

extern int isgray_(int** p);
extern void grayns_(int** p, float* g);
extern void fillpb_(int** pb, int* pbw, int* pbh, int** gm, int* gmw, int* gmh, int** dm, int* dmw, int* dmh);
extern void clean_(int** pb, int* pbw, int* pbh, int** gm, int* gmw, int* gmh, int** dm, int* dmw, int* dmh);

#endif
