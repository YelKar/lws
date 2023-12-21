PROGRAM FilterSpace(INPUT, OUTPUT);
VAR
  Ch1, Ch2: CHAR;
BEGIN
  Ch1 := ' ';
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch2);
      IF Ch2 <> ' '
      THEN
        WRITE(OUTPUT, Ch2)
      ELSE
        IF Ch1 <> ' '
        THEN
          WRITE(OUTPUT, ' ');
      Ch1 := Ch2
    END;
  WRITELN(OUTPUT, '|')
END.
