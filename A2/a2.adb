with Ada.Text_IO;
use Ada;

procedure A2 is
  File_Name : String;

  Prompt_One : constant String := "Please enter the name of the file to read\n";

  File      : Text_IO.File_Type;
  Char      : Character;
  type Puzzle is array (9,9) of Integer;

begin

  Text_IO.Put(Prompt_One);
  Text_IO.Get(File_Name);

  Text_IO.Put(File_Name);

end A2;
