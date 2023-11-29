PROGRAM lengthOfString(INPUT, OUTPUT);
VAR
  D1, D2, D3, Ch: CHAR;
BEGIN
  D1 := '0';
  D2 := '0';
  D3 := '0';
  READ(Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      IF D1 = '9'
      THEN
        BEGIN
          D1 := '0';
          IF D2 = '9'
          THEN
            BEGIN
              D2 := '0';
              IF D3 = '9'
              THEN
                D3 := '0'
              ELSE IF D3 = '8'
              THEN
                D3 := '9'
              ELSE IF D3 = '7'
              THEN
                D3 := '8'
              ELSE IF D3 = '6'
              THEN
                D3 := '7'
              ELSE IF D3 = '5'
              THEN
                D3 := '6'
              ELSE IF D3 = '4'
              THEN
                D3 := '5'
              ELSE IF D3 = '3'
              THEN
                D3 := '4'
              ELSE IF D3 = '2'
              THEN
                D3 := '3'
              ELSE IF D3 = '1'
              THEN
                D3 := '2'
              ELSE IF D3 = '0'
              THEN
                D3 := '1';
            END
          ELSE IF D2 = '8'
          THEN
            D2 := '9'
          ELSE IF D2 = '7'
          THEN
            D2 := '8'
          ELSE IF D2 = '6'
          THEN
            D2 := '7'
          ELSE IF D2 = '5'
          THEN
            D2 := '6'
          ELSE IF D2 = '4'
          THEN
            D2 := '5'
          ELSE IF D2 = '3'
          THEN
            D2 := '4'
          ELSE IF D2 = '2'
          THEN
            D2 := '3'
          ELSE IF D2 = '1'
          THEN
            D2 := '2'
          ELSE IF D2 = '0'
          THEN
            D2 := '1';
        END
      ELSE IF D1 = '8'
      THEN
        D1 := '9'
      ELSE IF D1 = '7'
      THEN
        D1 := '8'
      ELSE IF D1 = '6'
      THEN
        D1 := '7'
      ELSE IF D1 = '5'
      THEN
        D1 := '6'
      ELSE IF D1 = '4'
      THEN
        D1 := '5'
      ELSE IF D1 = '3'
      THEN
        D1 := '4'
      ELSE IF D1 = '2'
      THEN
        D1 := '3'
      ELSE IF D1 = '1'
      THEN
        D1 := '2'
      ELSE IF D1 = '0'
      THEN
        D1 := '1';
      READ(Ch);
      IF D1 = '9'
      THEN
        IF D2 = '9'
        THEN
          IF D3 = '9'
          THEN
            IF Ch <> '#'
              THEN
                BEGIN
                  WRITELN('To many characters!!! Max length is 999');
                  D1 := '#';
                  Ch := '#';
                END;
    END;
  IF D1 <> '#'
  THEN
    WRITELN(D3, D2, D1);
END.
