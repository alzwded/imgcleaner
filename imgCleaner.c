#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdint.h>
#include <jpeglib.h>

#include "imgCleanerF.h"

uint32_t* BMap = NULL;
size_t Width;
size_t Height;
size_t Depth;

size_t PixelBlockSize;

int loadJpg(const char* Name){
    int ret;
    size_t width, height;
    struct jpeg_decompress_struct cinfo;
    struct jpeg_error_mgr jerr;

    FILE * infile;    	/* source file */
    JSAMPARRAY pJpegBuffer;   	/* Output row buffer */
    size_t row_stride;   	/* physical row width in output buffer */
    if ((infile = fopen(Name, "rb")) == NULL) 
    {
        fprintf(stderr, "can't open %s\n", Name);
        return 0;
    }
    cinfo.err = jpeg_std_error(&jerr);
    jpeg_create_decompress(&cinfo);
    jpeg_stdio_src(&cinfo, infile);
    (void) jpeg_read_header(&cinfo, TRUE);
    (void) jpeg_start_decompress(&cinfo);
    width = cinfo.output_width;
    height = cinfo.output_height;

    uint32_t* pTest = (uint32_t*)malloc(width*height*sizeof(uint32_t));
    uint8_t* pDummy = (uint8_t*)pTest;
    if (!pTest){
        printf("NO MEM FOR JPEG CONVERT!\n");
        goto loadJpg_Error;
    }
    row_stride = width * cinfo.output_components ;
    pJpegBuffer = (*cinfo.mem->alloc_sarray)
        ((j_common_ptr) &cinfo, JPOOL_IMAGE, row_stride, 1);

    while (cinfo.output_scanline < cinfo.output_height) {
        size_t x;
        (void) jpeg_read_scanlines(&cinfo, pJpegBuffer, 1);
        for (x=0;x<width;x++) {
            uint8_t a,r,g,b;
            a = 0; // alpha value is not supported on jpg
            r = pJpegBuffer[0][cinfo.output_components*x];
            if (cinfo.output_components>2)
            {
                g = pJpegBuffer[0][cinfo.output_components*x+1];
                b = pJpegBuffer[0][cinfo.output_components*x+2];
            } else {
                g = r;
                b = r;
            }
            *(pDummy++) = b;
            *(pDummy++) = g;
            *(pDummy++) = r;
            *(pDummy++) = a;
        }
    }

    BMap = (uint32_t*)pTest; 
    Height = height;
    Width = width;
    Depth = 32;

loadJpg_NoError:
    ret = width * height;
    goto loadJpg_Cleanup;
loadJpg_Error:
    ret = 0;
    goto loadJpg_Cleanup;
loadJpg_Cleanup:
    fclose(infile);
    (void) jpeg_finish_decompress(&cinfo);
    jpeg_destroy_decompress(&cinfo);
    goto loadJpg_Finish;
loadJpg_Finish:
    return ret;
}

void process()
{
    /*
       phase 1: enhance glyphs
       for each 10x10 block
            if pixel is gray, compute grayness
            else mark pixel as not gray (-1)
            inside block compute shortest paths to grayness
            within a tolerance, black out or white-out medium-gray pixels
       create a 50x50 matrix
            if pixels around are black/white try to make gray pixel black
       phase 2: what isn't black or white, make it white
    */
    // foreach pixel
    // create vicinity/scanline vector
    // if p is on outside of what looks like text, blank it
    // else if nothing looks like text, blank the whole scanline
    // else do nothing
    size_t i, j;
    int p[] = { 0x80, 0x80, 0x80, 0 };
    printf("%d\n", isgray_((int**)&p));
    float g;
    grayns_((int**)&p, &g);
    printf("%f\n", g);

    for(i = 0; i < Height; ++i) {
        unsigned char foundText = 0;
        //for(j = VICINITY_VECTOR_LENGTH_2; j < Width - VICINITY_VECTOR_LENGTH_2; ++j) {
            // find left-of-structure dirty pixel
            // find right-of-structure dirty pixel
            // find left-of-structure dirty pixel
            // find left-of-structure dirty pixel
            //uint8_t* pixel = (uint8_t*)&BMap[i * j];
        //}
    }
}

void cleanup()
{
    if(BMap) free(BMap);
}

void write()
{
}

int main(int argc, char* argv[])
{
    if(argc != 3) {
        fprintf(stderr, "usage: imgCleaner in.jpg out.jpg\n");
        // also add block size as parameter e.g. -b10
        return 1;
    }
    if(loadJpg(argv[1])) {
        process();
        write();
        cleanup();
    }
    return 0;
}
