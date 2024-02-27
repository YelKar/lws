PROGRAM SarahRevere(INPUT, OUTPUT); 
VAR
  W1, W2, W3, W4: CHAR;
  Looking, Land, Sea: BOOLEAN; 

PROCEDURE InitValues(VAR Looking, Land, Sea: BOOLEAN);
BEGIN
  Looking := NOT EOLN(INPUT);
  Land := FALSE;
  Sea := FALSE;
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' '
END;

PROCEDURE SearchSea(VAR Sea: BOOLEAN);
BEGIN
  Sea := (W2 = 's') AND (W3 = 'e') AND (W4 = 'a')
END; 

PROCEDURE SearchLand(VAR Land: BOOLEAN);
BEGIN
  Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd')
END;

PROCEDURE MoveWindow(VAR Looking: BOOLEAN);
BEGIN
  W1 := W2;
  W2 := W3;
  W3 := W4;
  READ(W4);
  Looking := NOT EOLN(INPUT)
END;

PROCEDURE WriteMessage(VAR Land, Sea: BOOLEAN);
BEGIN
  IF Land
  THEN
    WRITE('The British are coming by land')
  ELSE
    IF Sea
    THEN
      WRITE('The British are coming by sea')
    ELSE
      WRITE('Sarah didn''t say');
  WRITELN
END;

PROCEDURE ProceedMessage(VAR Looking, Land, Sea: BOOLEAN);
BEGIN
  WHILE Looking AND NOT (Land OR Sea)   
  DO
    BEGIN
      MoveWindow(Looking);
      SearchLand(Land);
      SearchSea(Sea)
    END
END;

BEGIN {SarahRevere}   
  InitValues(Looking, Land, Sea);
  ProceedMessage(Looking, Land, Sea);
  WriteMessage(Land, Sea)
END. {SarahRevere} 

