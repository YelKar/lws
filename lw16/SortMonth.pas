PROGRAM SortMonth(INPUT, OUTPUT);
USES
  DateIO;
VAR
  Month1, Month2: Month;
BEGIN {SortMonth}
  ReadMonth(INPUT, Month1);
  ReadMonth(INPUT, Month2);
  IF (Month1 = NoMonth) OR (Month2 = NoMonth)
  THEN
    WRITE('¬ходные данные записаны неверно')
  ELSE
    IF Month1 = Month2
    THEN
      BEGIN
        WRITE('ќба мес€ца ');
        WriteMonth(OUTPUT, Month1)
      END
    ELSE
      BEGIN
        WriteMonth(OUTPUT, Month1);
        IF Month1 < Month2
        THEN
          WRITE(' предшествует ')
        ELSE
          WRITE(' следует за ');
        WriteMonth(OUTPUT, Month2)
      END;
  WRITELN
END. {SortMonth}
