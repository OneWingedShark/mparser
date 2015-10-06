with
OpenToken.Recognizer.Nothing,
OpenToken.Recognizer.End_Of_File,
OpenToken.Recognizer.CSV_Field,
OpenToken.Recognizer.Separator,
OpenToken.Recognizer.Keyword;

Function MParser.Internals.Get_Syntax return Tokenizer.Syntax is
   use MParser;

   Package R renames OpenToken.Recognizer;
   Function Keyword( S : String; Case_Sensitive : Boolean := False ) return Tokenizer.Recognizable_Token is
     ( Tokenizer.Get (R.Keyword.Get(S, Case_Sensitive  => Case_Sensitive)) );
   Function Separator( S : String ) return Tokenizer.Recognizable_Token is
     ( Tokenizer.Get (R.Separator.Get(S)) );

   Default : constant Tokenizer.Recognizable_Token:=
     Tokenizer.Get (OpenToken.Recognizer.Nothing.Get);



begin
   Return Result : constant Tokenizer.Syntax :=
     (
      One	=>	Default,
      Two	=>	Default,
      Three	=>	Default,

---- STUFF FROM IDL SYNTAX THAT MIGHT BE USEFUL.
------------------------------------------------
--
--        Whitespace	=>	Tokenizer.Get(R.Character_Set.Get
--                                             (R.Character_Set.Standard_Whitespace)
--                                               ),
--        Name		=>	Tokenizer.Get(
--                                   R.Identifier.Get(
--                                    Start_Chars   => Letter_Set,
--                                    Body_Chars    => Alphanumeric_Set or To_Set('_'),
--                                    Has_Separator => False
--                                   )
--                                  ),
      Bad_Token		=>	Default,
      End_of_File	=>	Tokenizer.Get(R.End_Of_File.Get(True))
     );

     --(Others => Default);
End MParser.Internals.Get_Syntax;
