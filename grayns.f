C Author: Vlad Mesco
C Date: Tue Jun  4 20:56:32 EEST 2013
C Description:
C     returns the grayness of a pixel
C Parameters:
C   IN
C     P         pixel, four integer values in BGRA form
C   OUT
C     G         the grayness of the pixel
C               0..1 or
C               -1 if pixel is NOT gray
C Todo:
      SUBROUTINE GRAYNS(P, G)
      IMPLICIT NONE
      INTEGER P(4)
      REAL G
C     Subroutines
      INTEGER ISGRAY
C     Local variables
C     ------------------------------------------------------------
      WRITE (*, *) "HELLO!\n"
      CALL CPRNTS('In GRAYNS:', 10)
      CALL CPRNMI('P(1)', 4, P(1))
      CALL CPRNMI('P(2)', 4, P(2))
      CALL CPRNMI('P(3)', 4, P(3))
      CALL CPRNMI('P(4)', 4, P(4))
      IF(ISGRAY(P) .EQ. 1)THEN
        G = (P(1) + P(2) + P(3)) / (3 * 255.0)
      ELSE
        G = -1
      ENDIF
C     ------------------------------------------------------------
      RETURN
      END
