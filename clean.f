C Author: Vlad Mesco
C Date: Tue Jun  4 20:56:32 EEST 2013
C Description:
C     Clean "noise" pixels in an NxN pixel block based on the
C     GraynessMap and on the DistanceMap
C Parameters:
C  IN, OUT
C     PB(PBW, PBH)  - PixelBlock, an NxN pixel block to be cleaned
C  IN
C     GM(GMW, GMH)  - GrayMap, an NxN map telling the grayness of a
C       pixel
C  IN
C     DM(DMW, DMH)  - DistanceMap, where 0 are black pixels, <some
C       arbitrarily large value> are white pixels, and other values are
C       the distance from the nearest black pixel
C Todo:
C     GM should be REAL
      SUBROUTINE CLEAN(PB, PBW, PBH, GM, GMW, GMH, DM, DMW, DMH)
      INTEGER PBW, PBH, GMW, GMH, DMW, DMH
      INTEGER PB(PBW, PBH), GM(GMW, GMH), DM(DMW, DMH)
C     Local variables
C     ------------------------------------------------------------
C     ------------------------------------------------------------
      RETURN
      END
