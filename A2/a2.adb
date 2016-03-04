with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada;

procedure A2 is
begin
declare


  File_Name       : String(1..100);
  Out_Name        : String(1..100);
  Length          : Integer range 0..100;

  Row_Counter	  : Integer := 1;
  Col_Counter   : Integer := 1;
  Current_Value : Integer;
  Temp_Counter  : Integer;

  File            : Text_IO.File_Type;
  Output_File     : Text_IO.File_Type;
  Char_Temp       : Character;
  Int_Temp        : Integer;

  Result : Integer;

  type Puzzle_Type is array (1..9,1..9) of Integer;

  Puzzle : Puzzle_Type;
  Puzzle_Copy : Puzzle_Type;

  Row_Mod_1 : Integer;
  Row_Mod_2 : Integer;
  Col_Mod_1 : Integer;
  Col_Mod_2 : Integer;

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
    if Result /= 1 then
      While Row_Counter < 10 loop
        if Row_Counter /= Cur_Row then
          if Puzzle(Row_Counter, Cur_Col) = Value then
            return 0;
          end if;
        end if;
        Row_Counter := Row_Counter + 1;
      end loop;
    end if;

    -- calculate modification numbers to make sure array index stays in proper 3x3 grid
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

    if Puzzle(Cur_Row+Row_Mod_1, Cur_Col) = Value or Puzzle(Cur_Row+Row_Mod_1, Cur_Col+Col_Mod_1) = Value or Puzzle(Cur_Row+Row_Mod_1, Cur_Col+Col_Mod_2) = Value then
      return 0;
    elsif Puzzle(Cur_Row, Cur_Col+Col_Mod_1) = Value or Puzzle(Cur_Row, Cur_Col+Col_Mod_2) = Value then
      return 0;
    elsif Puzzle(Cur_Row+Row_Mod_2, Cur_Col) = Value or Puzzle(Cur_Row+Row_Mod_2, Cur_Col+Col_Mod_1) = Value or Puzzle(Cur_Row+Row_Mod_2, Cur_Col+Col_Mod_2) = Value then
      return 0;
    end if;
    return 1;
  end Can_Value_Go_Here;


  --https://codemyroad.wordpress.com/2014/05/01/solving-sudoku-by-backtracking/
  Function Solve_Sudoku(Cur_Row, Cur_Col: Integer) return Integer is
    Val : Integer := 1;
    Temp_Col : Integer := Cur_Col;
    Temp_Row : Integer := Cur_Row;
  begin
    if Cur_Row = 10 then
      return 1;
    end if;
    While Val <= 9 loop
      Puzzle(Cur_Row, Cur_Col) := Val;
      if Can_Value_Go_Here(Puzzle, Val, Cur_Col, Cur_Row) = 1 then
        Temp_Col := Cur_Col + 1;
        if Temp_Col = 10 then
          Temp_Row := Cur_Row + 1;
          Temp_Col := 1;
        end if;
        if Solve_Sudoku(Temp_Row, Temp_Col) = 1 then
          return 1;
        end if;
      end if;
      Val := Val + 1;
    end loop;
    Puzzle(Cur_Row, Cur_Col) := 0;
    return 0;
  end Solve_Sudoku;


begin

  Text_IO.Put("Please enter the name of the file to read: ");
  Text_IO.Get_Line(Item=>File_Name, Last=>Length);
  Text_IO.New_Line;

  Text_IO.Open (File=>File, Mode=>Text_IO.In_File, Name=>File_Name (1..Length));

  Text_IO.Put("Please enter the name of the file to output to: ");
  Text_IO.Get_Line(Item=>Out_Name, Last=>Length);
  Text_IO.New_Line;

  Text_IO.Create (File=>Output_File, Mode=>Text_IO.Out_File, Name=>Out_Name (1..Length));




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

  Result := Solve_Sudoku(1,1);

  if Result = 1 then
    -- print final solution here
    While Row_Counter < 10 loop
      if Row_Counter mod 3 = 1 then
        Text_IO.Put("+-----+-----+-----+");
        Text_IO.Put(File=>Output_File, Item=>"+-----+-----+-----+");
        Text_IO.New_Line;
        Text_IO.New_Line(Output_File);
      end if;
      While Col_Counter < 10 loop
        if Col_Counter mod 3 = 1 then
          Text_IO.Put("|");
          Text_IO.Put(File=>Output_File, Item=>"|");
        end if;
        Integer_Text_IO.Put(Puzzle(Row_Counter,Col_Counter), Width=>2);
        Integer_Text_IO.Put(File=>Output_File, Item=>Puzzle(Row_Counter,Col_Counter), Width=>2);
        Col_Counter := Col_Counter + 1;
        if Col_Counter = 10 then
          Text_IO.Put("|");
          Text_IO.Put(File=>Output_File, Item=>"|");
        end if;
      end loop;
      Text_IO.New_Line;
      Text_IO.New_Line(Output_File);
      Col_Counter := 1;
      Row_Counter := Row_Counter + 1;
    end loop;
    Text_IO.Put("+-----+-----+-----+");
    Text_IO.Put(File=>Output_File, Item=>"+-----+-----+-----+");
    Text_IO.New_Line(Output_File);
    Text_IO.New_Line;
  else
    Text_IO.Put("No solution found");
    Text_IO.New_Line;
  end if;
end;
end A2;
