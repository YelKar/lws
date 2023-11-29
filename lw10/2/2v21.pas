{
States
  О - Operator
  F - Wait first operator
  W - Wait operator
  B - Braces
  P - Point
}

PROGRAM CodeFormat(INPUT, OUTPUT);
VAR
  Ch, State: CHAR;
BEGIN
  Ch := ' ';
  State := 'S';
  WHILE (Ch = ' ') AND (NOT EOLN(INPUT))
  DO
    READ(INPUT, Ch);

  WRITE(OUTPUT, Ch);

  WHILE (Ch <> 'N') AND (NOT EOLN(INPUT))
  DO
    BEGIN
      READ(INPUT, Ch);
      WRITE(OUTPUT, Ch)
    END;

  State := 'F';

  WHILE (NOT EOLN(INPUT)) AND (State <> 'P')
  DO
    BEGIN
      READ(INPUT, Ch);
      IF Ch <> ' '
      THEN
        BEGIN
          // Before writing
          IF (Ch = ';') AND (State = 'F')
          THEN
            BEGIN
              WRITELN(OUTPUT);
              WRITE('  ');
              State := 'W'
            END;

          IF ((State = 'W') OR (State = 'F')) AND ((Ch = 'W') OR (Ch = 'R'))
          THEN
            BEGIN
              WRITELN(OUTPUT);
              WRITE(OUTPUT, '  ');
              State := 'O'
            END;

          IF ((State = 'W') OR (State = 'F')) AND (Ch = 'E')
          THEN
            BEGIN
              WRITELN(OUTPUT);
              State := 'O'
            END;

          WRITE(OUTPUT, Ch);

          // After writing
          IF ((Ch = ';') OR (Ch = ')')) AND (State <> 'F')
          THEN
            State := 'W';
          IF Ch = '('
          THEN
            State := 'B';

          IF Ch = ','
          THEN
            WRITE(OUTPUT, ' ');

          IF Ch = '.'
          THEN
            State := 'P'
        END
      ELSE IF (State <> 'B') AND (State <> 'F')
      THEN
        State := 'W'
    END
END.
