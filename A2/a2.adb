with Ada.Text_IO;
use Ada;

procedure A2 is
  File_Name       : String(1..100);

  Prompt_One      : constant String := "Please enter the name of the file to read: ";

  File            : Text_IO.File_Type;
  Char_Temp       : Character;

  type Puzzle_Type is array (1..9,1..9) of Integer;

  Puzzle : Puzzle_Type;

begin

  Text_IO.Put(Prompt_One);
  Text_IO.Get(File_Name);

  Text_IO.Put("Filename: " & File_Name);

end A2;
