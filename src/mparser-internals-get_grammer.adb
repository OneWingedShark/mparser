With
-- Needed MParser children.
MParser.Tokens,
MParser.Terminals,
MParser.Internals.Tokenizer,
MParser.Nonterminals.Intermediates,

-- Needed Internals children.
MParser.Internals.Token_List,
MParser.Internals.Production,
MParser.Internals.Nonterminal,
MParser.Internals.Production_List
;

Function MParser.Internals.Get_Grammer return Production_List.Instance is

   -- Bring Terminals and Nonterminals into direct visibility.
   use MParser.Terminals, MParser.Nonterminals;

   -- Bring "&", "+", "<=", and "and" into direct visibility.
   use type Token_List.Instance;
   use type Production.Right_Hand_Side;
   use type Production.Instance;
   use type Production_List.Instance;

   -- NOTE:	The renames and constants here are  written so as to ensure the
   --		proper ordering is preserved.
   PL_Lists     : Production_List.Instance renames Intermediates.Get_Lists;
   PL_Sequences : Production_List.Instance renames Intermediates.Get_Sequences;
   PL_Options   : Production_List.Instance renames Intermediates.Get_Options;
   All_Production_Lists : constant Production_List.Instance :=
     				PL_Lists and PL_Sequences and PL_Options;

   -- Renames.
   LS : Nonterminal.Class renames Nonterminal.Class(Space_Seq);
   CS : Nonterminal.Class renames LS;

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

     -----------------------------
     --  Include Intermediates  --
     -----------------------------
     All_Production_Lists						and

     ------------------------
     --  Include Commands  --
     ------------------------
     Intermediates.Command_Productions					and

     ------------------------------
     --  Include Command Syntax  --
     ------------------------------
     Intermediates.Command_Syntax					and


     -- TODO: 8.1 General command rules (B) -- command ::= ...
     postcond		<= Opt_Colon_TVExpr				and
     timeout		<= Colon & numexpr				and
     lineref		<= entryref					and
     lineref		<= labelref					and
     entryref		<= dlabel &
     			     Opt_Plus_IntExpr & Opt_Caret_Routineref	and
     entryref		<= Caret_Routineref				and
     dlabel		<= label					and
     --       dlabel		<= @ expratom V dlabel
     routineref		<= Opt_Env_Bar & routinename			and
     --       routineref		<= @ expratom V routineref
     labelref		<= label					and
     labelref		<= label & Caret & Opt_Env_Bar & routinename	and
     labelref		<= caret & Opt_Env_Bar & routinename		and
     externref		<= Amp & externalroutinename			and
     externref		<= Amp & packagename &dot& externalroutinename	and
     packagename	<= name						and
     externalroutinename<= name						and
     externalroutinename<= name & Caret & Name				and
     actuallist		<= LParen & Opt_actual_List & RParen	and
     actual		<= Opt_DotExpr_or_AName				and
     actual		<= expr						and
     actualname		<= name						and
--       actualname		::= @ expratom V actualname

     charset		<= name						and
     Temp_Token		<= EOF;

End MParser.Internals.Get_Grammer;
