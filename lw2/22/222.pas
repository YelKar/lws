PROGRAM CharIsNumber(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  READ(Ch);
  WRITELN('Your character is ''', Ch, '''.');
  WRITE('Character ''', Ch, ''' is ');
  IF '0' <= Ch
  THEN
    IF Ch <= '9'
    THEN
      WRITELN('DIGIT')
    ELSE
      WRITELN('NOT DIGIT')
  ELSE
    WRITELN('NOT DIGIT')
END.
