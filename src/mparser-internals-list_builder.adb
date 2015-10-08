Pragma Ada_2012;

with
MParser.Internals.Token_List,
MParser.Internals.Production
;

Function MParser.Internals.List_Builder(
   Token_ID        :     MUMPS_Token;
   Separator, Item :     MParser.Tokens.Class;
   Productions     : out Production_List.Instance;
   List_Action     :     Tokens.Action := Null
  ) return Nonterminal.Class is

   Base : Nonterminal.Instance'Class renames
     Nonterminal.Get( Token_ID, Build => List_Action );

   use type Token_List.Instance;
   use type Production.Right_Hand_Side;
   use type Production.Instance;
   use type Production_List.Instance;

begin
   Return Result : constant Nonterminal.Instance'Class :=
     Nonterminal.Get( Token_ID, Build => List_Action ) do
      Productions:=
        Result <= Item                      + Nonterminal.Synthesize_Self and
        Result <= Item & Separator & Result + Nonterminal.Synthesize_Self;
   end return;
End MParser.Internals.List_Builder;
