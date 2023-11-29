PROGRAM FormatCode(INPUT, OUTPUT);
VAR
  Ch, Ch1, Ch2, Ch3, Ch4, Ch5: CHAR;
  State, Ch5InString: CHAR;

PROCEDURE ResetAll;
BEGIN {ResetAll}
  Ch := ' ';
  Ch1 := ' ';
  Ch2 := ' ';
  Ch3 := ' ';
  Ch4 := ' ';
  Ch5 := ' ';
  State := 'N';
  Ch5InString := 'F'
END; {ResetAll}
PROCEDURE Shift;
BEGIN {Shift}
  Ch1 := Ch2;
  Ch2 := Ch3;
  Ch3 := Ch4;
  Ch4 := Ch5;
  Ch5 := Ch
END; {Shift}
PROCEDURE CheckString;
BEGIN
  IF Ch1 = ''''
  THEN
    IF State = 'S'
    THEN
      State := 'N'
    ELSE
      State := 'S';
  IF Ch5 = ''''
  THEN
    IF Ch5InString = 'T'
    THEN
      Ch5InString := 'F'
    ELSE
      Ch5InString := 'T'
END;

PROCEDURE ReadWhileSpace;
BEGIN {ReadWhileSpace}
  IF NOT EOLN(INPUT)
  THEN
    READ(INPUT, Ch);
  WHILE (NOT EOLN(INPUT)) AND (Ch = ' ')
  DO
    READ(INPUT, Ch);
  Shift
END; {ReadWhileSpace}
PROCEDURE ReadIncludingSpaces;
BEGIN {ReadIncludingSpaces}
  IF NOT EOLN(INPUT)
  THEN
    BEGIN
      READ(Ch);
      Shift
    END
END; {ReadIncludingSpaces}
PROCEDURE ReadBEGIN;
BEGIN {ReadBEGIN}
  ReadWhileSpace;
  ReadIncludingSpaces;
  ReadIncludingSpaces;
  ReadIncludingSpaces;
  ReadIncludingSpaces;
  READ(INPUT, Ch);
  IF (Ch1 = 'B') AND (Ch2 = 'E') AND (Ch3 = 'G') AND (Ch4 = 'I') AND (Ch5 = 'N') AND (Ch = ' ')
  THEN
    BEGIN
      WRITELN(OUTPUT, 'BEGIN');
      Shift
    END
END; {ReadBEGIN}
PROCEDURE Processing;
BEGIN
  IF Ch1 = ';'
  THEN
    IF (Ch2 <> ';') AND (Ch5 <> '.')
    THEN
      BEGIN
        WRITELN;
        WRITE(OUTPUT, '  ')
      END;
  IF Ch5 = '.'
  THEN
    State := 'P';
  IF Ch1 = ','
  THEN
    WRITE(' ')
END;
PROCEDURE ReadEND;
BEGIN
  IF (State = 'P') OR EOLN(INPUT)
  THEN
    WRITELN(Ch1);
  IF (Ch2 = 'E') AND (Ch3 = 'N') AND (Ch4 = 'D') AND (Ch5 = '.')
  THEN
    BEGIN
      ReadWhileSpace;
      IF (EOLN(INPUT)) AND (Ch5 = '.')
      THEN
        BEGIN
          WRITELN(OUTPUT, 'END.');
          State := 'E'
        END
    END
END;
PROCEDURE ReadBlock;
BEGIN
  ReadWhileSpace;
  ReadWhileSpace;
  ReadWhileSpace;
  ReadEND;
  ReadWhileSpace;
  ReadWhileSpace;
  WRITE(OUTPUT, '  ');
  WHILE (NOT EOLN(INPUT) AND (State <> 'E') AND (State <> 'P'))
  DO
    BEGIN
      IF ((NOT ((Ch1 = ';') AND (Ch5 = '.'))) OR (State = 'S'))
      THEN
        WRITE(Ch1);
      CheckString;
      IF (State <> 'S')
      THEN
        Processing;
      IF (State = 'S') AND (Ch5InString = 'T')
      THEN
        ReadIncludingSpaces
      ELSE
        ReadWhileSpace
    END;
END;
BEGIN {FormatCode}
  ResetAll();
  ReadBegin();
  ReadBlock;
  ReadEND()
END. {FormatCode}
