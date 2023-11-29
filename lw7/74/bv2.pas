PROGRAM BubbleSortMLB(INPUT, OUTPUT);
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2, F3: TEXT;
BEGIN
  ASSIGN(F1, 'file1.txt');
  ASSIGN(F2, 'file2.txt');
  ASSIGN(F3, 'file3.txt');
  REWRITE(F3);
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      {DP7.2: Копируем INPUT в F1}
      REWRITE(F1);
      WHILE NOT EOLN(INPUT)
      DO
        BEGIN
          READ(INPUT, Ch);
          WRITE(F1, Ch);
        END;
      READLN(INPUT);
      WRITELN(F1);
      Sorted := 'N';
      WHILE Sorted = 'N'
      DO
        BEGIN
          {DP7.1: Копируем F1 в F2, проверяя отсортированность
          и переставляя соседние символы по порядку}
          Sorted := 'Y';
          RESET(F1);
          REWRITE(F2);
          IF NOT EOF(F1)
          THEN
            BEGIN
              READ(F1, Ch1);
              WHILE NOT EOLN(F1)
              DO { По крайней мере два символа остается для Ch1,Ch2 }
                BEGIN
                  READ(F1, Ch2);
                  {7.1.1: Выводим   min(Ch1,Ch2) в  F2, записывая
                  отсортированные символы }
                  IF Ch1 <= Ch2
                  THEN
                    BEGIN
                      WRITE(F2, Ch1);
                      Ch1 := Ch2
                    END
                  ELSE
                    BEGIN
                      WRITE(F2, Ch2);
                      Sorted := 'N'
                    END
                END;
              WRITELN(F2, Ch1); { Выводим последний символ в F2 }
            END;
          {DP7.4: Копируем F2 в F1}
          REWRITE(F1);
          RESET(F2);
          WHILE NOT EOLN(F2)
          DO
            BEGIN
              READ(F2, Ch);
              WRITE(F1, Ch);
            END;
            WRITELN(F1);
        END;
      {DP7.5: Копируем F1 в F3}
      RESET(F1);
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch);
          WRITE(F3, Ch);
        END;
      WRITELN(F3)
    END;
  WRITELN('-----------------');
  RESET(F3);
  WHILE NOT EOF(F3)
  DO
    BEGIN
      WHILE NOT EOLN(F3)
      DO
        BEGIN
          READ(F3, Ch);
          WRITE(OUTPUT, Ch);
        END;
      READLN(F3);
      WRITELN(OUTPUT)
    END
END.
