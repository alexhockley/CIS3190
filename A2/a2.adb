with Ada.Text_IO
use Ada;

procedure A2 is
  File_Name       : String(1..100) := (others => ' ');
  Length          : Integer range 0..100;


  File            : Text_IO.File_Type;
  Char_Temp       : Character;

  type Puzzle_Type is array (1..9,1..9) of Integer;

  Puzzle : Puzzle_Type;

begin

  Text_IO.Put("Please enter the name of the file to read: ");
  Text_IO.Get_Line(File_Name, Length);


  Text_IO.Put("Filename: " & File_Name);

  Text_IO.Open (File=>File, Mode=>Text_IO.In_File, Name=>File_Name (1..Length));

  while not Text_IO.End_Of_File (File) loop
       while not Text_IO.End_Of_Line (File) loop
        Text_IO.Get (File => File, Item => Char_Temp);
        Text_IO.Put (Char_Temp);
       end loop;
       Text_IO.Skip_Line (File);
       Text_IO.New_Line;
   end loop;

end A2;
