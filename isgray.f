C Author: Vlad Mesco
C Date: Tue Jun  4 20:56:32 EEST 2013
C Description:
C     tell if a pixel is gray or not
C Parameters:
C   IN
C     P         pixel, four integer values in BGRA form
C   RETURNS
C     1 => P is gray
C     0 => P is not gray
C Todo:
      FUNCTION ISGRAY (P)
      IMPLICIT NONE
      LOGICAL ISGRAY
      INTEGER P(4)
C     Local variables
      INTEGER RGB(3)
      INTEGER I, TMP
C     ------------------------------------------------------------
      RGB(1) = P(3)
      RGB(2) = P(2)
      RGB(3) = P(1)

    5 DO 10 I = 1,2
        IF(RGB(I) .GT. RGB(I + 1))THEN
          TMP = RGB(I)
          RGB(I) = RGB(I + 1)
          RGB(I + 1) = TMP
          GOTO 5
        ENDIF
   10 CONTINUE
      
   20 IF(RGB(3) - RGB(2) .LT. 10 .AND. RGB(2) - RGB(1) .LT. 10 .AND.
     &    RGB(3) - RGB(1) .LT. 10)THEN
        ISGRAY = .TRUE.
      ELSE
        ISGRAY = .FALSE.
      ENDIF

      RETURN
      END
