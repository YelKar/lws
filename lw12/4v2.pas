PROGRAM FilterSpace(INPUT, OUTPUT);
VAR
  Ch, State: CHAR;
BEGIN
  State := 'B';
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      IF Ch <> ' '
      THEN
        BEGIN
          IF State = 'S'
          THEN
            WRITE(OUTPUT, ' ');  
          State := 'L';
          WRITE(OUTPUT, Ch)
        END
      ELSE
        IF State <> 'B'
        THEN
          State := 'S'
    END;
  WRITELN(OUTPUT, '|')
END.
