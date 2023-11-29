PROGRAM LengthOfLine(INPUT, OUTPUT);
VAR
  Ch, D1, D2, D3: CHAR;
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
           // IF D2 = '9'
           // THEN

           IF D2 = '8'
           THEN
             D2 := '9';
           IF D2 = '7'
           THEN
             D2 := '8';
           IF D2 = '6'
           THEN
             D2 := '7';
           IF D2 = '5'
           THEN
             D2 := '6';
           IF D2 = '4'
           THEN
             D2 := '5';
           IF D2 = '3'
           THEN
             D2 := '4';
           IF D2 = '2'
           THEN
             D2 := '3';
           IF D2 = '1'
           THEN
             D2 := '2';
           IF D2 = '0'
           THEN
             D2 := '1';
         END;
      IF D1 = '8'
      THEN
        D1 := '9';
      IF D1 = '7'
      THEN
        D1 := '8';
      IF D1 = '6'
      THEN
        D1 := '7';
      IF D1 = '5'
      THEN
        D1 := '6';
      IF D1 = '4'
      THEN
        D1 := '5';
      IF D1 = '3'
      THEN
        D1 := '4';
      IF D1 = '2'
      THEN
        D1 := '3';
      IF D1 = '1'
      THEN
        D1 := '2';
      IF D1 = '0'
      THEN
        D1 := '1';
      READ(Ch);
    END;
  WRITELN(D2, D1);
END.