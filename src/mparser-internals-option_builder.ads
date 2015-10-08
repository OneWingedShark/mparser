Pragma Ada_2012;

with
MParser.Tokens,
MParser.Internals.Nonterminal,
MParser.Internals.Production_List;

Function MParser.Internals.Option_Builder(
   Token_ID    :     MUMPS_Token;
   Item        :     MParser.Tokens.Class;
   Productions : out Production_List.Instance;
   Action      :     Tokens.Action := Null
  ) return Nonterminal.Class;
