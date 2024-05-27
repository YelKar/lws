UNIT
  Storage;

INTERFACE
USES
  Words, StringTools;
PROCEDURE InitStorage();
PROCEDURE InsertToStorage(Data: WordType);
PROCEDURE PrintStorage(VAR OutFile: TEXT);

FUNCTION GetTotalNumber: LONGINT;

IMPLEMENTATION
TYPE
  Tree = ^NodeType;
  NodeType = RECORD
               W: WordType;
               LLink, RLink: Tree;
               Count: INTEGER
             END;

VAR
  Root: Tree;
  TotalNumber: LONGINT;

PROCEDURE InitStorage();
PROCEDURE Init(Ptr: Tree);
BEGIN {TreeSort}
  IF Ptr <> NIL
  THEN
    BEGIN
      Init(Ptr^.LLink);
      Init(Ptr^.RLink);
      Ptr := NIL
    END
END;  {TreeSort}

BEGIN
  Init(Root)
END;


PROCEDURE InsertToTree(VAR Ptr: Tree; Data: WordType);
BEGIN {Insert}
  IF Ptr = NIL
  THEN
    BEGIN {Создаем лист со значением Data}
      NEW(Ptr);
      Ptr^.W := Data;
      Ptr^.Count := 1;
      Ptr^.LLink := NIL;
      Ptr^.RLink := NIL
    END
  ELSE
    IF More(Ptr^.W, Data)
    THEN
      InsertToTree(Ptr^.LLink, Data)
    ELSE
      IF Less(Ptr^.W, Data)
      THEN
        InsertToTree(Ptr^.RLink, Data)
      ELSE
        Ptr^.Count := Ptr^.Count + 1
END;  {Insert}

PROCEDURE InsertToStorage(Data: WordType);
BEGIN
  InsertToTree(Root, Data);
  TotalNumber := TotalNumber + 1
  // WRITELN('TOTAL ', TotalNumber)
END;

PROCEDURE PrintStorage(VAR OutFile: TEXT);
PROCEDURE Print(Ptr: Tree);
BEGIN {PrintTree}
  IF Ptr <> NIL
  THEN
    BEGIN
      Print(Ptr^.LLink);
      WRITELN(OutFile, Ptr^.W, ' ', Ptr^.Count);
      Print(Ptr^.RLink)
    END
END;  {PrintTree}

BEGIN
  Print(Root)
END;

FUNCTION GetTotalNumber: LONGINT;
BEGIN
  GetTotalNumber := TotalNumber
END;

BEGIN

END.



