with Ada.Text_IO;
use Ada;

procedure A2 is
  File_Name       : String;

  Prompt_One      : constant String := "Please enter the name of the file to read";

  File            : Text_IO.File_Type;
  Char_Temp       : Character;

  Rows : constant Integer := 9;
  Cols : constant Integer := 9;
  subtype Row_Range is Integer range 1..Rows;
  subtype Col_Range is Integer range 1..Cols;
  type Puzzle_Type is array (Row_Range,Col_Range) of Integer;

  Puzzle := Puzzle_Type;

begin

  Text_IO.Put(Prompt_One);
  Text_IO.Get(File_Name);

  Text_IO.Put(File_Name);

end A2;
