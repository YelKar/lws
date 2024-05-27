UNIT
  StringTools;

INTERFACE
FUNCTION Equal(A, B: STRING): BOOLEAN;
FUNCTION More(A, B: STRING): BOOLEAN;
FUNCTION Less(A, B: STRING): BOOLEAN;

PROCEDURE ToLowerCase(VAR W: STRING);

IMPLEMENTATION

FUNCTION LowerChar(Ch: CHAR): CHAR;
CONST
  Alpha = ['À' .. 'ß'];
BEGIN
  IF Ch IN Alpha
  THEN
    LowerChar := CHR(ORD(Ch) + 32)
  ELSE
    IF Ch = '¨'
    THEN
      LowerChar := '¸'
    ELSE
      LowerChar := Ch
END;

PROCEDURE ToLowerCase(VAR W: STRING);
VAR
  I: INTEGER;

BEGIN
  FOR I := 1 TO Length(W)
  DO
    W[I] := LowerChar(W[I])
END;

FUNCTION Equal(A, B: STRING): BOOLEAN;
VAR
  I, LenA: INTEGER;
BEGIN
  LenA := length(A);
  IF LenA = Length(B)
  THEN
    BEGIN
      I := 1;
      WHILE (I <= LenA) AND (A[I] = B[I])
      DO
        I := I + 1;
      Equal := A[I] = B[I]
    END
  ELSE
    Equal := FALSE
END;

FUNCTION More(A, B: STRING): BOOLEAN;
VAR
  I, LenA, LenB: INTEGER;
BEGIN
  I := 1;
  LenA := Length(A);
  LenB := Length(B);
  WHILE (I <= LenA) AND (I <= LenB) AND (A[I] = B[I])
  DO
    I := I + 1;
  IF (I > LenA) OR (I > LenB)
  THEN
    More := LenA > LenB
  ELSE
    More := A[I] > B[I]
END;

FUNCTION Less(A, B: STRING): BOOLEAN;
VAR
  I, LenA, LenB: INTEGER;
BEGIN
  I := 1;
  LenA := Length(A);
  LenB := Length(B);
  WHILE (I <= LenA) AND (I <= LenB) AND (A[I] = B[I])
  DO
    I := I + 1;
  IF (I > LenA) OR (I > LenB)
  THEN
    Less := LenA < LenB
  ELSE
    Less := A[I] < B[I]
END;

BEGIN
END.

