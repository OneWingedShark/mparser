With
-- Needed MParser children.
MParser.Tokens,
MParser.Internals.Tokenizer,
MParser.Nonterminals,
MParser.Terminals,

-- Needed Internals children.
MParser.Internals.Token_List,
MParser.Internals.Nonterminal,
MParser.Internals.Production_List,
MParser.Internals.Production,
MParser.Internals.Sequence_Builder,
MParser.Internals.Option_Builder,
MParser.Internals.List_Builder
;

Function MParser.Internals.Get_Grammer return Production_List.Instance is

   -- Bring Terminals and Nonterminals into direct visibility.
   use MParser.Terminals, MParser.Nonterminals;

   Function Make_List(
      Token_ID        :     MUMPS_Token;
      Item            :     MParser.Tokens.Class;
      Productions     : out Production_List.Instance;
      List_Action     :     Tokens.Action := Null
     ) return Nonterminal.Class is
     (List_Builder(Token_ID, Comma, Item, Productions, List_Action));

   -- Sequence production-lists.
   Seq_of_Digit_or_Ident,
   Seq_of_Line,
   Seq_of_Space,
   Seq_of_LI,
   Seq_of_Graphic,
   Seq_of_Digit
   : Production_List.Instance;

   -- Sequence nonterminals.
   Digit_Ident_Seq : aliased Nonterminal.Class:=
     Sequence_Builder(S_Digit_or_Ident, Digit_or_Ident, Seq_of_Digit_or_Ident);
   Line_Seq : aliased Nonterminal.Class:=
     Sequence_Builder(S_Line, Line, Seq_of_Line);
   Space_Seq : aliased Nonterminal.Class:=
     Sequence_Builder(S_Space, SP, Seq_of_Space);
   LI_Seq : aliased Nonterminal.Class:=
     Sequence_Builder(S_LI, LI, Seq_of_LI);
   Graphic_Seq : aliased Nonterminal.Class:=
     Sequence_Builder(S_Graphic, Graphic, Seq_of_Graphic);
   Digit_Seq : aliased Nonterminal.Class:=
     Sequence_Builder(S_Digit, Digit, Seq_of_Digit);

   -- List production-lists.
   List_of_Name
   : Production_List.Instance;

   -- List nonterminals.
   Name_List : aliased Nonterminal.Class:=
     Make_List(L_Name, Name, List_of_Name);

   -- Optional production-lists.
   Option_of_Label,
   Option_of_LI_Seq,
   Option_of_SP_Seq,
   Option_of_Name_List
   : Production_List.Instance;

   -- Optional nonterminals.
   Opt_Label : aliased Nonterminal.Class:=
     Option_Builder(O_Label, Label, Option_of_Label);
   Opt_LI_Seq : aliased Nonterminal.Class:=
     Option_Builder(O_LI_Seq, LI, Option_of_LI_Seq);
   Opt_SP_Seq : aliased Nonterminal.Class:=
     Option_Builder(O_SP_Seq, Space_Seq, Option_of_SP_Seq);
   Opt_Name_List : aliased Nonterminal.Class:=
     Option_Builder(O_Name_List, Name_List, Option_of_Name_List);

   -- Renames.
   LS : Nonterminal.Class renames Space_Seq;
   CS : Nonterminal.Class renames LS;

   -- Bring "&", "+", "<=", and "and" into direct visibility.
   use type Token_List.Instance;
   use type Production.Right_Hand_Side;
   use type Production.Instance;
   use type Production_List.Instance;

Begin
   Return Grammar : constant Production_List.Instance :=
     S_Prime		<= Temp_Token & EOF				and
     -- Helpers, Intermediates, and shorthands.
     EOL		<= CR & LF					and
     EOR		<= CR & FF					and
     Digit_or_Ident	<= Digit					and
     Digit_or_Ident	<= Ident					and
     Pct_or_Ident	<= Pct						and
     Pct_or_Ident	<= Ident					and
     Line		<= levelline					and
     Line		<= formalline					and
     Label		<= name						and
     Label		<= intlit					and
     -- Sequences.
     Seq_of_Digit_or_Ident and
     Seq_of_Line	   and
     Seq_of_Space	   and
     Seq_of_LI		   and
     Seq_of_Graphic	   and
     Seq_of_Digit	   and
     -- Optionals.
     Option_of_Label	   and
     Option_of_Name_List   and
     Option_of_LI_Seq	   and
     Option_of_SP_Seq	   and
     -- Lists.
     List_of_Name	   and
     -- Normal Productions.
     routine		<= routinehead & routinebody			and
     routinehead	<= routinename & EOL				and
     routinename	<= name						and
     routinebody	<= Line_Seq & EOR				and
     name		<= Pct_or_Ident & Digit_Ident_Seq		and
     levelline		<= opt_label & ls & opt_li_seq & linebody	and
     linebody		<= commands & EOL				and
     linebody		<= commands & cs & comment & EOL		and
     linebody		<= extsyntax & EOL				and
     linebody		<= commands & cs & extsyntax & EOL     		and
     linebody		<= comment & EOL				and
     li			<= dot & Opt_SP_Seq				and
     comment		<= semicolon & Graphic_Seq			and
     formalline		<= label & formallist & ls & linebody		and
     formallist		<= LParen & Opt_Name_List & RParen		and
     intlit		<= Digit_Seq					and


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
