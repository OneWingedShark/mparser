Pragma Ada_2012;

with
MParser.Internals.Token_List,
MParser.Internals.Production
;

Function MParser.Internals.Option_Builder(
   Token_ID    :     MUMPS_Token;
   Item        :     MParser.Tokens.Class;
   Productions : out Production_List.Instance;
   Action      :     Tokens.Action := Null
  ) return Nonterminal.Class is

   Base : Nonterminal.Instance'Class renames
     Nonterminal.Get( Token_ID, Build => Action );

   Nothing : Tokens.Class renames
     MParser.Tokens.Get( Epsilon );

   use type Token_List.Instance;
   use type Production.Right_Hand_Side;
   use type Production.Instance;
   use type Production_List.Instance;

Begin
   Return Result : constant Nonterminal.Class :=
     Nonterminal.Get( Token_ID, Build => Action ) do
      Productions:=
        Result <= Item    + Nonterminal.Synthesize_Self and
        Result <= Nothing + Nonterminal.Synthesize_Self;
   end return;
End MParser.Internals.Option_Builder;
