Pragma Ada_2012;

with
OpenToken.Recognizer.Nothing,
MParser.Tokens,
MParser.Internals.Nonterminal,
MParser.Internals.Production_List;

Function MParser.Internals.Sequence_Builder(
   Token_ID    : MUMPS_Token;
   Item        : Tokens.Class;
   Productions : out Production_List.Instance;
   List_Action : Tokens.Action := Null
  ) return Nonterminal.Class;
