      PROGRAM P
      IMPLICIT NONE
      INTEGER W, H
      PARAMETER (W = 4, H = 4)
      INTEGER A(W, H), I, J, OI, OJ, WW, HH

      DO 10 I = 1, W
        DO 20 J = 1, H
          A(I, J) = (I - 1) * W + J - 1
C         WRITE (*, *) A(I, J)
   20   CONTINUE
   10 CONTINUE

      DO 30 I = 1, W
        WRITE (*, "(20I4)") (A(I, J), J = 1, H)
   30 CONTINUE

      CALL FFF(A, 4, 4, 1, 1, 2, 2)
C     WTF I SWEAR this didn't work earlier when I'd tried it
      CALL JJJ(A(2:3, 2:3), 2, 2)
      CALL JJJ(A(3:4, 1:2), 2, 2)
      CALL JJJ(A(1:1, 1:1), 1, 1)
      CALL JJJ(A, 4, 4)

C     DATA I, J, WW, HH/2, 1, 2, 3/
C     for some reason this leaves I and J to 5 each... odd?
C     WRITE(*, *) I, J, WW, HH
C     upon consulting the standard, the DATA statement is performed only
C     once, upon executing the program. So it's basically useless
      DATA OI, OJ, WW, HH/2, 1, 2, 3/
      CALL JJJ(A(OI:OI + WW - 1, OJ:OJ + HH - 1), WW, HH)

      STOP
      END

      SUBROUTINE FFF(A, W, H, OW, OH, W2, H2)
      IMPLICIT NONE
      INTEGER W, H, OW, OH, W2, H2
      INTEGER A(W, H)

      INTEGER B(W2, H2), I, J
      WRITE (*, *) "In fff"
C     DO 500 I = 1, W2
C       B(I, 1:) = A(I + OW, OH + 1:H2)
C 500 CONTINUE
C     somehow this works on gfortran
      B(1:, 1:) = A(1 + OW:W2, OH + 1:H2)

C     DO 100 I = 1, W2
C       DO 200 J = 1, H2
C         WRITE (*, *) B(I, J)
C 200   CONTINUE
C 100 CONTINUE
      DO 100 I = 1, W2
        WRITE (*, "(20I4)") (B(I, J), J = 1, H2)
  100 CONTINUE

      RETURN
      END

      SUBROUTINE JJJ(A, W, H)
      IMPLICIT NONE
      INTEGER W, H
      INTEGER A(W, H), I, J

      WRITE (*, *) "In jjj"

c     DO 222 I = 1, W
c       DO 333 J = 1, H
c         WRITE (*, *) A(I, J)
c 333   CONTINUE
c 222 CONTINUE

      DO 444 I = 1, W
        WRITE (*, "(20I4)") (A(I, J), J = 1, H)
  444 CONTINUE

      RETURN
      END
