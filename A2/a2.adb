with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada;

procedure A2 is
  File_Name       : String(1..100);
  Length          : Integer range 0..100;

  Row_Counter	  : Integer := 1;
  Col_Counter   : Integer := 1;
  Current_Value : Integer;
  Done_Flag     : Integer := 0;

  File            : Text_IO.File_Type;
  Char_Temp       : Character;
  Int_Temp        : Integer;

  type Puzzle_Type is array (1..9,1..9) of Integer;

  Puzzle : Puzzle_Type;
  Puzzle_Copy : Puzzle_Type;

  Row_Mod_1 : Integer;
  Row_Mod_2 : Integer;
  Col_Mod_1 : Integer;
  Col_Mod_2 : Integer;

declare
  Function Solve_Sudoku(Cur_Row, Cur_Col: Integer) return Integer is
    Val : Integer := 1;
    Temp_Col : Integer;
    Temp_Row : Integer;
  begin

    if Cur_Col = 10 then
      return 1;
    end if;

    While Val <= 9 loop
      Puzzle(Cur_Row, Cur_Col) := Val;
      if Can_Value_Go_Here(Puzzle, Val, Cur_Col, Cur_Row) = 1 then
        Temp_Col := Cur_Col + 1;
        if(Temp_Col = 10) then
          Temp_Row := Cur_Row + 1;
          Temp_Col := 1;
        end if;
        if Solve_Sudoku(Temp_Row, Temp_Col) = 1 then
          return 1;
        end if;
      Val := Val + 1;
      end if;
    end loop;
    Puzzle(Cur_Row, Cur_Col) := 0;
    return 0;
  end Solve_Sudoku;

begin
  Text_IO.Put("Please enter the name of the file to read: ");
  Text_IO.Get_Line(Item=>File_Name, Last=>Length);


  Text_IO.Put("Filename: " & File_Name(1..Length));
  Integer_Text_IO.Put(Length);

  Text_IO.Open (File=>File, Mode=>Text_IO.In_File, Name=>File_Name (1..Length));

  While not Text_IO.End_Of_File (File) loop
    Text_IO.Get(File=>File, Item=>Char_Temp);
    Int_Temp := Character'Pos(Char_Temp)-48;

    if Int_Temp >= 0 and Int_Temp < 10 then
      if Col_Counter <= 9 then
        Puzzle(Row_Counter,Col_Counter) := Int_Temp;
        Puzzle_Copy(Row_Counter,Col_Counter) := Int_Temp;
        Row_Counter := Row_Counter + 1;
      end if;
    end if;


    if Row_Counter = 10 then
       Col_Counter := Col_Counter + 1;
       Row_Counter := 1;
    end if;
  end loop;
  Text_IO.New_Line;

  -- reset counters for puzzle index
  Col_Counter := 1;
  Row_Counter := 1;

  While Row_Counter < 10 loop
    While Col_Counter < 10 loop
      Integer_Text_IO.Put(Puzzle(Row_Counter,Col_Counter), Width=>1);
      Col_Counter := Col_Counter + 1;
    end loop;
    Text_IO.New_Line;
    Col_Counter := 1;
    Row_Counter := Row_Counter + 1;
  end loop;

  -- reset counters for puzzle index
  Row_Counter := 1;
  Col_Counter := 1;
  Current_Value := 1;


-- solution from wikipedia, i think its wrong
--  While Done_Flag = 0 loop
--    if Puzzle(Row_Counter,Col_Counter) = 0 then
--      Puzzle(Row_Counter,Col_Counter) := Current_Value;
--      if Can_Value_Go_Here(Puzzle, Current_Value, Col_Counter, Row_Counter) = 0
--        Puzzle(Row_Counter,Col_Counter) := 0;
--        Current_Value := Current_Value + 1;
--      end if;
--    else
--      While Row_Counter < 10 loop
--        Row_Counter := Row_Counter + 1;
--        if Row_Counter = 10 then
--          Row_Counter := 1;
--          Col_Counter := Col_Counter + 1;
--          if Col_Counter = 10 then
--            Done_Flag := 1;
--          end if;
--        end if;
--    end if;
--  end loop;

  Solve_Sudoku(1,1);
  -- print final solution here
  While Row_Counter < 10 loop
    While Col_Counter < 10 loop
      Integer_Text_IO.Put(Puzzle(Row_Counter,Col_Counter), Width=>1);
      Col_Counter := Col_Counter + 1;
    end loop;
    Text_IO.New_Line;
    Col_Counter := 1;
    Row_Counter := Row_Counter + 1;
  end loop;

  --https://codemyroad.wordpress.com/2014/05/01/solving-sudoku-by-backtracking/


end A2;

Function Can_Value_Go_Here(Puzzle: Puzzle_Type; Value, Cur_Col, Cur_Row: Integer) return Integer is
  Row_Counter : Integer := 1;
  Col_Counter : Integer := 1;
begin
  --first check the row
  While Col_Counter < 10 loop
    if Col_Counter /= Cur_Col then
      if Puzzle(Cur_Row,Col_Counter) = Value then
        return 0;
      end if;
    end if;
    Col_Counter := Col_Counter + 1;
  end loop;

  --now check the column
  if Result /= 1
    While Row_Counter < 10 loop
      if Row_Counter /= Cur_Row then
        if Puzzle(Row_Counter, Cur_Col) = Value then
          return 0;
        end if;
      end if;
      Row_Counter := Row_Counter + 1;
    end loop;
  end if;


  if Cur_Row mod 3 = 1 then --top of 3x3
    Row_Mod_1 := 1;
    Row_Mod_2 := 2;
  elsif Cur_Row mod 3 = 2 then --middle of 3x3
    Row_Mod_1 := -1;
    Row_Mod_2 := 1;
  else --bottom of 3x3
    Row_Mod_1 := -2;
    Row_Mod_2 := -1;
  end if;

  if Cur_Col mod 3 = 1 then --left of 3x3
    Col_Mod_1 := 1;
    Col_Mod_2 := 2;
  elsif Cur_Col mod 3 = 2 then --middle of 3x3
    Col_Mod_1 := -1;
    Col_Mod_2 := 1;
  else  --right of 3x3
    Col_Mod_1 := -2;
    Col_Mod_2 := -1;
  end if;

  if Puzzle(Cur_Row+Row_Mod_1, Cur_Col) = Val or Puzzle(Cur_Row+Row_Mod_1, Cur_Col+Col_Mod_1) = Val or Puzzle(Cur_Row+Row_Mod_1, Cur_Col+Col_Mod_2) = Val then
    return 0;
  elsif Puzzle(Cur_Row, Cur_Col+Col_Mod_1) = Val or Puzzle(Cur_Row, Cur_Col+Col_Mod_2) = Val then
    return 0;
  elsifPuzzle(Cur_Row+Row_Mod_2, Cur_Col) = Val or Puzzle(Cur_Row+Row_Mod_2, Cur_Col+Col_Mod_1) = Val or Puzzle(Cur_Row+Row_Mod_2, Cur_Col+Col_Mod_2) = Val then
    return 0;
  end if;
  return 1;
end Row_Test;
