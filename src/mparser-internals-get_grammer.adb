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
   Seq_of_Digit,
   Seq_of_Ext_Subtext,
   Seq_of_ExprTail
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
   Ext_Subtext_Seq : aliased Nonterminal.Class:=
     Sequence_Builder(S_Ext_Subtext, Ext_Subtext, Seq_of_Ext_Subtext);
   Exprtail_Seq : aliased Nonterminal.Class:=
     Sequence_Builder(S_ExprTail, ExprTail, Seq_of_ExprTail);

   -- List production-lists.
   List_of_Name,
   List_of_Expr
   : Production_List.Instance;

   -- List nonterminals.
   Name_List : aliased Nonterminal.Class:=
     Make_List(L_Name, Name, List_of_Name);
   Expr_List : aliased Nonterminal.Class:=
     Make_List(L_Expr, Expr, List_of_Expr);


   -- Optional production-lists.
   Option_of_Label,
   Option_of_LI_Seq,
   Option_of_SP_Seq,
   Option_of_Name_List,
   Option_of_Exptail_Seq,
   Option_of_Tick,
   Option_of_Environment,
   Option_of_PrnExpr_Lst,
   Option_of_Env_Bar,
   Option_of_Exponent
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
   Opt_Exprtail_Seq : aliased Nonterminal.Class:=
     Option_Builder(O_Exprtail_Seq, Exprtail_Seq, Option_of_Exptail_Seq);
   Opt_Tick : aliased Nonterminal.Class:=
     Option_Builder(O_Tick, Tick, Option_of_Tick);
   Opt_Environment : aliased Nonterminal.Class:=
     Option_Builder(O_Environment, Environment, Option_of_Environment);
   Opt_PrnExp_List : aliased Nonterminal.Class:=
     Option_Builder(O_Paren_Expr_List, Paren_Expr_List, Option_of_PrnExpr_Lst);
   Opt_Env_Bar : aliased Nonterminal.Class:=
     Option_Builder(O_Env_Bar, Env_Bar, Option_of_Env_Bar);
   Opt_Exponent : aliased Nonterminal.Class:=
     Option_Builder(O_Exponent, exponent, Option_of_Exponent);

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
     Embed_Name		<= Graphic_Seq					and
     UnaryOp		<= Tick						and
     UnaryOp		<= Plus						and
     UnaryOp		<= Hyphen					and
     BinaryOp		<= Underscore					and
     BinaryOp		<= Plus						and
     BinaryOp		<= Hyphen					and
     BinaryOp		<= Star						and
     BinaryOp		<= Slash					and
     BinaryOp		<= Pound					and
     BinaryOp		<= Backslash					and
     BinaryOp		<= DoubleStar					and
     TruthOp		<= Relation					and
     TruthOp		<= LogicalOp					and
     LogicalOp		<= Amp						and
     LogicalOp		<= Exclaimation					and
     Relation		<= Equal					and
     Relation		<= Less_Than					and
     Relation		<= Greater_Than					and
     Relation		<= LBracket					and
     Relation		<= RBracket					and
     Relation		<= DoubleRBracket				and
     -- Artificial nonterminals / helpers.
     Ext_Subtext	<= eol & Amp & ls & Graphic_Seq			and
     Paren_Expr_List	<= LParen & Expr_List & RParen			and
     Env_Bar		<= Bar & Environment & Bar			and
     -- Sequences.
     Seq_of_Digit_or_Ident and
     Seq_of_Line	   and
     Seq_of_Space	   and
     Seq_of_LI		   and
     Seq_of_Graphic	   and
     Seq_of_Digit	   and
     Seq_of_Ext_Subtext	   and
     Seq_of_ExprTail	   and
     -- Optionals.
     Option_of_Label	   and
     Option_of_Name_List   and
     Option_of_LI_Seq	   and
     Option_of_SP_Seq	   and
     Option_of_Exptail_Seq and
     Option_of_Tick	   and
     Option_of_Environment and
     Option_of_PrnExpr_Lst and
     Option_of_Env_Bar	   and
     Option_of_Exponent	   and
     -- Lists.
     List_of_Name	   and
     List_of_Expr	   and
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
     extsyntax		<= Amp & extid & LParen & exttext & RParen	and
     exttext		<= Graphic_Seq & Ext_Subtext_Seq		and
     extid		<= Bar & Embed_Name & Bar			and
     expr		<= expratom & Opt_exprtail_Seq			and
     exprtail		<= binaryop & expratom				and
     exprtail		<= Opt_Tick & truthop & expratom		and
     exprtail		<= Opt_Tick & Question & pattern		and
     expratom		<= glvn						and
     expratom		<= expritem					and
     expritem		<= strlit					and
     expritem		<= numlit					and
     expritem		<= exfunc					and
     expritem		<= exvar					and
     expritem		<= svn						and
--       expritem		<= general_function				and
     expritem		<= unaryop & expratom				and
     expritem		<= Paren_Expr_List				and
     glvn		<= lvn						and
     glvn		<= gvn						and
     glvn		<= ssvn						and
     lvn		<= rlvn						and
--       lvn		<= @ expratom V lvn				and
     rlvn		<= name						and
     rlvn		<= name & Paren_Expr_List			and
     rlvn		<= At_Sign & lnamind & At_Sign &
				Paren_Expr_List				and
--       lnamind		<= rexpratom V lvn
     rexpratom		<= rlvn						and
     rexpratom		<= rgvn						and
     rexpratom		<= expritem					and
     rgvn		<= Caret & Paren_Expr_List			and
     rgvn		<= Caret & Opt_Env_Bar & name & Opt_PrnExp_List	and
     rgvn		<= At_Sign&gnamind &At_Sign& Paren_Expr_List	and
--       gnamind		<= rexpratom V gvn
     environment	<= expr						and
     strlit		<= String_Element				and
     numlit		<= mant & opt_exponent				and
     mant		<= intlit & dot & intlit			and
     mant		<= dot & intlit					and
     mant		<= intlit					and
     exponent		<= E & Plus & IntLit				and
     exponent		<= E & Hyphen & IntLit				and
     -- TODO: 7.1.3 Structured system variable ssvn
     numexpr		<= expr						and
     intexpr		<= expr						and
     tvexpr		<= expr						and
     ExFunc		<= Dollar & Dollar & labelref & actuallist	and
     ExFunc		<= Dollar & externref & actuallist		and
     ExVar		<= Dollar & Dollar & labelref			and
     ExVar		<= Dollar & externref				and
     -- TODO: 7.1.4.10 Intrinsic special variable names svn
     -- TODO: Take a look at Dfn of namevalue; ensure the following is correct.
     namevalue		<= expr						and
     -- TODO: 7.2.3 Pattern match pattern


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
