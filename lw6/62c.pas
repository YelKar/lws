PROGRAM Split(INPUT, OUTPUT);
VAR
  Odds, Evens: TEXT;
  Ch, Next: CHAR;
BEGIN {Split}
  REWRITE(Odds);
  REWRITE(Evens);
  Next := 'O';
  READ(INPUT, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN {DP6.2.1: Read INPUT and put Ch to Odds or to Evens depending next}
      IF Next = 'O'
      THEN
        BEGIN
          WRITE(Odds, Ch);
          Next := 'E'
        END
      ELSE
        BEGIN
          WRITE(Evens, Ch);
          Next := 'O'
        END;
      READ(INPUT, Ch)
    END; {DP6.2.1: Read INPUT and put Ch to Odds or to Evens depending next}
  WRITE(Odds, '#');
  WRITE(Evens, '#');
  RESET(Odds);
  RESET(Evens);
  READ(Odds, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN {DP6.2.2: Copy Odds to OUTPUT}
      WRITE(OUTPUT, Ch);
      READ(Odds, Ch)
    END; {DP6.2.2: Copy Odds to OUTPUT}
  READ(Evens, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN {DP6.2.3: Copy Evens to OUTPUT}
      WRITE(OUTPUT, Ch);
      READ(Evens, Ch)
    END {DP6.2.3: Copy Evens to OUTPUT}
END. {Split}
