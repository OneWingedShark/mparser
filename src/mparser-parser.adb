with
OpenToken.Text_Feeder.Text_IO,
MParser.Internals.Get_Parser,
MParser.Internals.Tokenizer;

Package Body MParser.Parser is

   procedure Set_Input_Feeder (
                               Object : in out Instance;
                               File   : in     Ada.Text_IO.File_Type
                              ) is
   begin
      Ada.Text_IO.Set_Input (File);
      Object.Set_Text_Feeder(OpenToken.Text_Feeder.Text_IO.Create (Ada.Text_IO.Current_Input));
   end Set_Input_Feeder;

   procedure Bad_Token_on_Syntax_Error(Object : in out Instance) is
      use MParser.Internals.Tokenizer;
   begin
      Set_Default (Object.Analyzer.all, Bad_Token);
   End Bad_Token_on_Syntax_Error;

   procedure Find_Next( Object : in out Instance ) is
      use MParser.Internals.Tokenizer;
   begin
      Find_Next(Object.Analyzer.All, Look_Ahead => False);
   End Find_Next;

   function Token_ID( Object : in out Instance ) return MUMPS_Token is
     (Object.Analyzer.ID);

   function Lexeme( Object : in out Instance ) return String is
     (Object.Analyzer.Lexeme);

   function Create return Instance is
     (MParser.Internals.Get_Parser with null record);

End MParser.Parser;
