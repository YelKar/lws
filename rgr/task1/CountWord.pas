PROGRAM CountWord(INPUT, OUTPUT);
USES
  Words, Storage, StringTools;
VAR
  InFile, OutFile: TEXT;
  W: WordType;

BEGIN
  InitStorage();
  WHILE NOT EOF
  DO
    BEGIN
      WHILE NOT EOLN
      DO
        BEGIN
          FindWord(INPUT, W);
          IF Length(W) > 0
          THEN
            BEGIN
              ToLowerCase(W);
              InsertToStorage(W)
            END
        END;
      READLN
    END;
  PrintStorage(OUTPUT);
  WRITELN(OUTPUT, 'Total number of words is ',  GetTotalNumber)
END.
