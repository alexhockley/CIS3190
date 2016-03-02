with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada;

procedure A2 is
  File_Name       : String(1..100);
  Length          : Integer range 0..100;

  Row_Counter	  : Integer := 1;
  Col_Counter     : Integer := 1;

  File            : Text_IO.File_Type;
  Char_Temp       : Character;

  type Puzzle_Type is array (1..9,1..9) of Integer;

  Puzzle : Puzzle_Type;

begin

  Text_IO.Put("Please enter the name of the file to read: ");
  Text_IO.Get_Line(Item=>File_Name, Last=>Length);


  Text_IO.Put("Filename: " & File_Name(1..Length));
  Integer_Text_IO.Put(Length);

  Text_IO.Open (File=>File, Mode=>Text_IO.In_File, Name=>File_Name (1..Length));

  While not Text_IO.End_Of_File (File) loop
    Text_IO.Get(File=>File, Item=>Char_Temp);
    Text_IO.Put(Char_Temp);
    
    if Col_Counter <= 9 then
    Puzzle(Row_Counter,Col_Counter) := Character'Pos(Char_Temp);
    end if;
    
    Row_Counter := Row_Counter + 1;
    if Row_Counter = 10 then
       Col_Counter := Col_Counter + 1;
       Row_Counter := 1;   
    end if;
  end loop;
  Text_IO.New_Line;


end A2;
