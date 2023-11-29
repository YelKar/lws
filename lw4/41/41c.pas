PROGRAM PaulRevere(INPUT, OUTPUT);
VAR
  Lantern: CHAR;
BEGIN {PaulRevere}
  {Read Lanterns}
  READ(Lantern);
  {Issue Paul Revere's message}
  IF Lantern = 'D'
  THEN
    BEGIN
      READ(Lantern);
      IF Lantern = 'D'
      THEN
        WRITELN('The British are coming by sea.')
      ELSE
        WRITELN('The British are coming by land.')
    END
  ELSE
    WRITELN('The North Church shows another.')
END. {PaulRevere}
