Pragma Ada_2012;
Pragma Assertion_Policy( Check );

with
MParser.Parser,
Ada.Text_IO,
Ada.Command_Line
;

use
MParser;

Procedure MParse is
   File   : Ada.Text_IO.File_Type;
   Parser : MParser.Parser.Instance:= MParser.Parser.Create;


   Procedure Show_Help is
      Use Ada.Text_IO;
      Command      : Constant String := "MPARSE";
      File_Name    : Constant String := "example";
      File_Ext     : Constant String := ".m";
   begin
      New_Line;
      Put_Line( "Usage:" );
      Put_Line( ASCII.HT & Command & " " & File_Name & File_Ext );
   end Show_Help;

   Argument_Error,
   Display_Help    : Exception;
Begin
   If Ada.Command_Line.Argument_Count not in Positive then
      raise Argument_Error;
   End If;


   Ada.Text_IO.Open (File => File,
                     Mode => Ada.Text_IO.In_File,
                     Name => Ada.Command_Line.Argument (1)
                    );

   Parser.Set_Input_Feeder( File );
   Parser.Bad_Token_on_Syntax_Error;

   loop
      Parser.Find_Next;
      Ada.Text_IO.Put_Line (MUMPS_Token'Image (Parser.Token_ID) & ' ' & Parser.Lexeme);
      exit when Parser.Token_ID = End_of_File;
   end loop;


--     Parser.Set_Input_Feeder (File);
--     Parser.Bad_Token_on_Syntax_Error;
--
--     loop
--        Parser.Find_Next;
--
--        Ada.Text_IO.Put_Line (IDL_Token'Image (Parser.Token_ID) & ' ' & Parser.Lexeme);
--
--        exit when Parser.Token_ID = End_of_File;
--     end loop;


exception
   when Argument_Error | Display_Help => Show_Help;
End MParse;
