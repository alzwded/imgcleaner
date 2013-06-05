      SUBROUTINE PROCES(BMAP, W, H, BSIZE)
      INTEGER BSIZE
      INTEGER W, H
      INTEGER BMAP(W, H, 4)
C     Externals
      EXTERNAL FILLPB
      EXTERNAL CLEAN
C     Local variables
      REAL GM(BSIZE, BSIZE)
      INTEGER DM(BSIZE, BSIZE)
      INTEGER BLOCK(BSIZE, BSIZE, 4)
C     ------------------------------------------------------------
      DO 10 I = 1, W / BSIZE
        IF(I * BSIZE > W) THEN
          EXIT
        ENDIF
        BLOCK(1:BSIZE, 1:BSIZE, 1:4) = BMAP((I - 1) * BSIZE + 1:I * 10,
     &      (I - 1) * BSIZE + 1:I * BSIZE, 1:4)
        CALL FILLPB(BLOCK, GM, DM, BSIZE)
        CALL CLEAN(BLOCK, GM, DM, BSIZE)
   10 CONTINUE
C     ------------------------------------------------------------
      RETURN
      END
