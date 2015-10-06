Pragma Ada_2012;
Pragma Assertion_Policy( Check );

with
Ada.Text_IO,
MParser.Internals.LALR_Parser;

Package MParser.Parser is

   Type Instance is new Internals.LALR_Parser.Instance with private;


   procedure Set_Input_Feeder (
                               Object : in out Instance;
                               File   : in     Ada.Text_IO.File_Type
                              );

   procedure Bad_Token_on_Syntax_Error(Object : in out Instance);

   procedure Find_Next( Object : in out Instance );

   function Token_ID( Object : in out Instance ) return MUMPS_Token;

   function Lexeme( Object : in out Instance ) return String;

   function Create return Instance;
Private
   Type Instance is new Internals.LALR_Parser.Instance with null record;
End MParser.Parser;
