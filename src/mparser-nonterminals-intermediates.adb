with
MParser.Tokens,
MParser.Terminals,
MParser.Internals.Production,
MParser.Internals.List_Builder,
MParser.Internals.Option_Builder,
MParser.Internals.Sequence_Builder
;

Package Body MParser.Nonterminals.Intermediates is
   use MParser.Internals;

   Function Make_List(
      Token_ID        :     MUMPS_Token;
      Item            :     MParser.Tokens.Class;
      Productions     : out Production_List.Instance;
      List_Action     :     Tokens.Action := Null
     ) return Nonterminal.Instance is
     (Nonterminal.Instance(
        List_Builder(Token_ID, Terminals.Comma, Item, Productions, List_Action)
     ));

   Function Make_Option(
      Token_ID    :     MUMPS_Token;
      Item        :     MParser.Tokens.Class;
      Productions : out Production_List.Instance;
      Action      :     Tokens.Action := Null
     ) return Nonterminal.Instance is
     (Nonterminal.Instance(
        Option_Builder(Token_ID, Item, Productions, Action)
     ));

   Function Make_Sequence(
      Token_ID    : MUMPS_Token;
      Item        : Tokens.Class;
      Productions : out Production_List.Instance;
      List_Action : Tokens.Action := Null
     ) return Nonterminal.Instance is
     (Nonterminal.Instance(
        Sequence_Builder(Token_ID, Item, Productions, List_Action)
     ));


   Function Get_Lists return MParser.Internals.Production_List.Instance is
      -- List production-lists.
      List_of_Name,
      List_of_Expr,
      List_of_Actual,
      List_of_Closeargument,
      List_of_Doargument,
      List_of_Forparameter,
      List_of_Gotoargument,
      List_of_Hangargument,
      List_of_Ifargument,
      List_of_Jobargument,
      List_of_Killargument,
      List_of_Lockargument,
      List_of_Mergeargument,
      List_of_Newargument,
      List_of_Openargument,
      List_of_Readargument,
      List_of_Setargument,
      List_of_Tstartarg,
      List_of_Useargument,
      List_of_Writeargument,
      List_of_Xecutearg		: Production_List.Instance;
   Begin
      -- Populate list nonterminals.
      Name_List         := Make_List(L_Name, Name, List_of_Name);
      Expr_List         := Make_List(L_Expr, Expr, List_of_Expr);
      Actual_List       := Make_List(L_Actual, Actual, List_of_Actual);
      Close_Arg_List    := Make_List(L_Close_Arg, CloseArgument, List_of_Closeargument);
      Do_Arg_List       := Make_List(L_Do_Arg, DoArgument, List_of_Doargument);
      forparameter_List := Make_List(L_forparameter, ForParameter, List_of_Forparameter);
      goto_arg_List     := Make_List(L_gotoargument, gotoargument, List_of_gotoargument);
      hang_arg_List     := Make_List(L_hangargument, hangargument, List_of_hangargument);
      if_arg_List       := Make_List(L_ifargument, ifargument, List_of_ifargument);
      job_arg_List      := Make_List(L_jobargument, jobargument, List_of_jobargument);
      kill_arg_List     := Make_List(L_killargument, killargument, List_of_killargument);
      lock_arg_List     := Make_List(L_lockargument, lockargument, List_of_Lockargument);
      merge_arg_List    := Make_List(L_mergeargument, mergeargument, List_of_Mergeargument);
      new_arg_List      := Make_List(L_newargument, newargument, List_of_Newargument);
      open_arg_List     := Make_List(L_openargument, openargument, List_of_Openargument);
      read_arg_List     := Make_List(L_readargument, readargument, List_of_Readargument);
      set_arg_List      := Make_List(L_setargument, setargument, List_of_Setargument);
      tstart_arg_List   := Make_List(L_tstartargument, tstartargument, List_of_Tstartarg);
      use_arg_List      := Make_List(L_useargument, useargument, List_of_Useargument);
      write_arg_List    := Make_List(L_writeargument, writeargument, List_of_Writeargument);
      xecute_arg_List   := Make_List(L_xecute, xecuteargument, List_of_Xecutearg);

      -- Return the "and"-ed production-lists.
      return
        List_of_Name		and
        List_of_Expr		and
        List_of_Actual		and
        List_of_Closeargument	and
        List_of_Doargument	and
        List_of_Forparameter	and
        List_of_Gotoargument	and
        List_of_Hangargument	and
        List_of_Ifargument	and
        List_of_Jobargument	and
        List_of_Killargument	and
        List_of_Lockargument	and
        List_of_Mergeargument	and
        List_of_Newargument	and
        List_of_Openargument	and
        List_of_Readargument	and
        List_of_Setargument	and
        List_of_Tstartarg	and
        List_of_Useargument	and
        List_of_Writeargument	and
        List_of_Xecutearg;
   End Get_Lists;

   Function Get_Options   return Production_List.Instance is
      -- Optional production-lists.
      Option_of_Label,
      Option_of_LI_Seq,
      Option_of_SP_Seq,
      Option_of_SP,
      Option_of_Name_List,
      Option_of_Exptail_Seq,
      Option_of_Tick,
      Option_of_Environment,
      Option_of_PrnExpr_Lst,
      Option_of_Env_Bar,
      Option_of_Exponent,
      Option_of_ColonTVExpr,
      Option_of_Crt_RtnRef,
      Option_of_PlusIntExpr,
      Option_of_DtExp_AName,
      Option_of_Actual_List	: Production_List.Instance;
   begin
      -- Populate optional nonterminals.
      Opt_Label            := Make_Option(O_Label, Label, Option_of_Label);
      Opt_LI_Seq           := Make_Option(O_LI_Seq, LI, Option_of_LI_Seq);
      Opt_SP_Seq           := Make_Option(O_SP_Seq, Space_Seq, Option_of_SP_Seq);
      Opt_SP               := Make_Option(O_SP, Terminals.SP, Option_of_SP);
      Opt_Name_List        := Make_Option(O_Name_List, Name_List, Option_of_Name_List);
      Opt_Exprtail_Seq     := Make_Option(O_Exprtail_Seq, Exprtail_Seq, Option_of_Exptail_Seq);
      Opt_Tick             := Make_Option(O_Tick, Terminals.Tick, Option_of_Tick);
      Opt_Environment      := Make_Option(O_Environment, Environment, Option_of_Environment);
      Opt_PrnExp_List      := Make_Option(O_Paren_Expr_List, Paren_Expr_List, Option_of_PrnExpr_Lst);
      Opt_Env_Bar          := Make_Option(O_Env_Bar, Env_Bar, Option_of_Env_Bar);
      Opt_Exponent         := Make_Option(O_Exponent, exponent, Option_of_Exponent);
      Opt_Colon_TVExpr     := Make_Option(O_Colon_TVExpr, Colon_TVExpr, Option_of_ColonTVExpr);
      Opt_Caret_Routineref := Make_Option(O_Caret_Routineref, Caret_Routineref, Option_of_Crt_RtnRef);
      Opt_Plus_IntExpr     := Make_Option(O_Plus_IntExpr, Plus_IntExpr, Option_of_PlusIntExpr);
      Opt_DotExpr_or_AName := Make_Option(O_DotExpr_or_AName, DotExpr_or_AName, Option_of_DtExp_AName);
      Opt_actual_List      := Make_Option(O_actual_List, Actual_List, Option_of_Actual_List);

      -- Return the "and"-ed production-lists.
      return
        Option_of_Label		and
        Option_of_LI_Seq	and
        Option_of_SP_Seq	and
        Option_of_SP		and
        Option_of_Name_List	and
        Option_of_Exptail_Seq	and
        Option_of_Tick		and
        Option_of_Environment	and
        Option_of_PrnExpr_Lst	and
        Option_of_Env_Bar	and
        Option_of_Exponent	and
        Option_of_ColonTVExpr	and
        Option_of_Crt_RtnRef	and
        Option_of_PlusIntExpr	and
        Option_of_DtExp_AName	and
        Option_of_Actual_List;
   End Get_Options;

   Function Get_Sequences return Production_List.Instance is
      -- Sequence production-lists.
      Seq_of_Digit_or_Ident,
      Seq_of_Line,
      Seq_of_Space,
      Seq_of_LI,
      Seq_of_Graphic,
      Seq_of_Digit,
      Seq_of_Ext_Subtext,
      Seq_of_ExprTail		: Production_List.Instance;
   Begin
      -- Populate sequence nonterminals.
      Digit_Ident_Seq := Make_Sequence(S_Digit_or_Ident, Digit_or_Ident, Seq_of_Digit_or_Ident);
      Line_Seq        := Make_Sequence(S_Line, Line, Seq_of_Line);
      Space_Seq       := Make_Sequence(S_Space, Terminals.SP, Seq_of_Space);
      LI_Seq          := Make_Sequence(S_LI, LI, Seq_of_LI);
      Graphic_Seq     := Make_Sequence(S_Graphic, Terminals.Graphic, Seq_of_Graphic);
      Digit_Seq       := Make_Sequence(S_Digit, Terminals.Digit, Seq_of_Digit);
      Ext_Subtext_Seq := Make_Sequence(S_Ext_Subtext, Ext_Subtext, Seq_of_Ext_Subtext);
      Exprtail_Seq    := Make_Sequence(S_ExprTail, ExprTail, Seq_of_ExprTail);

      -- Return the "and"-ed production-lists.
      return
        Seq_of_Digit_or_Ident	and
        Seq_of_Line		and
        Seq_of_Space		and
        Seq_of_LI		and
        Seq_of_Graphic		and
        Seq_of_Digit		and
        Seq_of_Ext_Subtext	and
        Seq_of_ExprTail;
   End Get_Sequences;


End MParser.Nonterminals.Intermediates;
