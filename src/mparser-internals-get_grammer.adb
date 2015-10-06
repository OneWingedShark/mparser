With
OpenToken.Token.List_Mixin,
OpenToken.Token.Enumerated.Integer,

     MParser.Internals.Tokenizer,
     --IDL.Get_Syntax,
MParser.Tokens,
MParser.Internals.Token_List,
MParser.Internals.Nonterminal,
MParser.Internals.Production_List,
MParser.Internals.Production;

Function MParser.Internals.Get_Grammer return Production_List.Instance is
--   Package Token_List      renames IDL.Enumerations.Tokens.Token_List;
--   Package Production_List renames IDL.Production_List;

   Use MParser;


   package Integer_Token  is new Tokens.Integer;

--     package Actions is
--
--        Procedure Stub;
--     end Actions;

   --package body Actions is separate;



   package Nonterminals is
      S_Prime               : aliased Nonterminal.Class  := Nonterminal.Get (p_S_Prime);
      Temp_Token            : aliased Nonterminal.Class  := Nonterminal.Get (p_tmp_1);
   end Nonterminals;

   package Terminals is
      EOF                   : aliased MParser.Tokens.Class := Tokens.Get (End_Of_File);
   end Terminals;


   --use Production, Production_List, Nonterminal, Token_List;
   use type Token_List.Instance;
   use type Production.Right_Hand_Side;
   use type Production.Instance;
   use type Production_List.Instance;


   use type Nonterminal.Class;
   use Terminals, Nonterminals;
   P : aliased Token_List.Instance:= Temp_Token & Terminals.EOF;
Begin
   Return Grammar : constant Production_List.Instance :=
     S_Prime		<= Temp_Token & EOF				and
     Temp_Token		<= EOF;
--       Token		<= Basic_Token				and
--       Token		<= Punctuation				and
--       Token		<= Whitespace				and
--
--       Basic_Token	<= Keyword				and
--       Basic_Token	<= Name					and
--       Basic_Token	<= Integer_Type				and
--       Basic_Token	<= Rational_Type			and
--       Basic_Token	<= String_Type;--				and
     --S_Prime       <= Specification & EOF and
     --Specification <= EOF + Nonterminal.Synthesize_Self;
End MParser.Internals.Get_Grammer;
