UNIT
  Words;

INTERFACE
CONST
  Alphabet = 'ÀÁÂÃÄÅ¨ÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞ‗אבגדהו¸זחטיךכלםמןנסעףפץצקרשתûü‎‏ÿ-ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
TYPE
  WordType = STRING;

PROCEDURE FindWord(VAR InFile: TEXT; VAR W: WordType);

IMPLEMENTATION


FUNCTION IsSupportedChar(Ch: CHAR): BOOLEAN;
BEGIN
  IsSupportedChar := (Pos(Ch, Alphabet) <> 0);
END;

PROCEDURE FindWord(VAR InFile: TEXT; VAR W: WordType);
VAR
  Ch: CHAR;
BEGIN
  W := '';
  IF NOT EOLN(InFile)
  THEN
    BEGIN
      READ(InFile, Ch);
      WHILE (NOT IsSupportedChar(Ch)) AND (NOT EOLN(InFile))
      DO
        READ(InFile, Ch);

      WHILE IsSupportedChar(Ch) AND (NOT EOLN(InFile))
      DO
        BEGIN
          IF (Ch = '¸')
          THEN
            Ch := 'ו';
          IF (Ch = '¨')
          THEN
            Ch := 'Å';
          W := W + Ch;
          READ(InFile, Ch)
        END;

      IF IsSupportedChar(Ch)
      THEN
        BEGIN
          IF (Ch = '¸')
          THEN
            Ch := 'ו';
          IF (Ch = '¨')
          THEN
            Ch := 'Å';
          W := W + Ch
        END;
      WHILE (W[1] = '-') AND (Length(W) > 0)
      DO
        DELETE(W, 1, 1);
      WHILE (W[Length(W)] = '-') AND (Length(W) > 0)
      DO
        DELETE(W, Length(W), 1);
    END
END;


BEGIN
END.

