      PROGRAM P
      IMPLICIT NONE
      INTEGER W, H
      PARAMETER (W = 4, H = 4)
      INTEGER A(W, H), I, J

      DO 10 I = 1, W
        DO 20 J = 1, H
          A(I, J) = (I - 1) * W + J - 1
          WRITE (*, *) A(I, J)
   20   CONTINUE
   10 CONTINUE
      CALL FFF(A, 4, 4, 1, 1, 2, 2)
C     WTF I SWEAR this didn't work earlier when I'd tried it
      CALL JJJ(A(2:3, 2:3), 2, 2)
      CALL JJJ(A(3:4, 1:2), 2, 2)
      CALL JJJ(A(1:1, 1:1), 1, 1)
      CALL JJJ(A, 4, 4)

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

      DO 100 I = 1, W2
        DO 200 J = 1, H2
          WRITE (*, *) B(I, J)
  200   CONTINUE
  100 CONTINUE

      RETURN
      END

      SUBROUTINE JJJ(A, W, H)
      IMPLICIT NONE
      INTEGER W, H
      INTEGER A(W, H), I, J

      WRITE (*, *) "In jjj"

      DO 222 I = 1, W
        DO 333 J = 1, H
          WRITE (*, *) A(I, J)
  333   CONTINUE
  222 CONTINUE

      RETURN
      END
