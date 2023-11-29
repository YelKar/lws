PROGRAM IFSort3(INPUT, OUTPUT);
{Сортирует 3-строку из INPUT в OUTPUT}
VAR
  Ch1, Ch2, Ch3:Char;
BEGIN {IFSort3}
  READ(Ch1, Ch2, Ch3);
  WRITELN('Входные данные ', Ch1, Ch2, Ch3);
  WRITE('Cортированные данные ');
  {Сортируем Ch1, Ch2, Ch3 в OUTPUT}
  IF Ch1 < Ch2
  THEN
    {Ch1 < Ch2:сортируем Ch1, Ch2, Ch3 в OUTPUT}
    WRITELN(Ch1, ' < ', Ch2)
  ELSE
    {Ch2 <= Ch1:сортируем Ch1, Ch2, Ch3 в OUTPUT}
    WRITELN(Ch2, ' <= ', Ch1);
END. {IFsort3}


