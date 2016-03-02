with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada;

procedure A2 is
  File_Name       : String(1..100);
  Length          : Integer range 0..100;


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

end A2;
