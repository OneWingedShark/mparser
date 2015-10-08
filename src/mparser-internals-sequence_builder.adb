with
MParser.Internals.Token_List,
MParser.Internals.Production
;

Function MParser.Internals.Sequence_Builder(
   Token_ID    : MUMPS_Token;
   Item        : Tokens.Class;
   Productions : out Production_List.Instance;
   List_Action : Tokens.Action := Null
  ) return Nonterminal.Class is

   use type Token_List.Instance;
   use type Production.Right_Hand_Side;
   use type Production.Instance;
   use type Production_List.Instance;

begin
   Return Result : constant Nonterminal.Class:=
     Nonterminal.Get( Token_ID, Build => List_Action ) do
      Productions:=
        Result <= Item          + Nonterminal.Synthesize_Self and
        Result <= Item & Result + Nonterminal.Synthesize_Self;
   end return;
--     Return Result : constant Production_List.Instance :=
--       Base <= Item        + Nonterminal.Synthesize_Self and
--       Base <= Item & Base + Nonterminal.Synthesize_Self;
End MParser.Internals.Sequence_Builder;
