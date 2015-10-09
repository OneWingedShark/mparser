Pragma Ada_2012;
Pragma Assertion_Policy( Check );

With
MParser.Actions,
MParser.Internals.Nonterminal;

Use
MParser.Internals.Nonterminal;

Package MParser.Nonterminals is

   S_Prime               : aliased Class  := Get (p_S_Prime);

   -- Productione
   EOL                   : aliased Class  := Get (p_EOL);
   EOR                   : aliased Class  := Get (p_EOR);
   Temp_Token            : aliased Class  := Get (p_tmp_1);
   Routine               : aliased Class  := Get (p_Routine);
   RoutineName           : aliased Class  := Get (P_Routinename);
   RoutineHead           : aliased Class  := Get (p_Routinehead);
   RoutineBody           : aliased Class  := Get (p_Routinebody);
   Name                  : aliased Class  := Get (P_Name);
   NameValue             : aliased Class  := Get (P_NameValue);
   Line                  : aliased Class  := Get (p_line);
   FormalLine            : aliased Class  := Get (p_formalline);
   LevelLine             : aliased Class  := Get (p_Levelline);
   Label                 : aliased Class  := Get (p_Label);
   LI                    : aliased Class  := Get (p_LI);
   LineBody              : aliased Class  := Get (p_LineBody);
   Commands              : aliased Class  := Get (p_Commands);
   Comment               : aliased Class  := Get (p_Comment);
   ExtSyntax             : aliased Class  := Get (p_ExtSyntax);
   FormalList            : aliased Class  := Get (p_FormalList);
   IntLit                : aliased Class  := Get (p_IntLit);
   StrLit                : aliased Class  := Get (p_StrLit);
   NumLit                : aliased Class  := Get (p_NumLit);
   ExtID                 : aliased Class  := Get (p_ExtID);
   ExtText               : aliased Class  := Get (p_ExtText);
   Expr                  : aliased Class  := Get (p_Expr);
   ExprTail              : aliased Class  := Get (p_ExprTail);
   ExprAtom              : aliased Class  := Get (p_ExprAtom);
   ExprItem              : aliased Class  := Get (p_ExprItem);
   UnaryOp               : aliased Class  := Get (p_UnaryOp);
   BinaryOp              : aliased Class  := Get (p_BinaryOp);
   TruthOp               : aliased Class  := Get (p_TruthOp);
   LogicalOp             : aliased Class  := Get (p_LogicalOp);
   Relation              : aliased Class  := Get (p_Relation);
   Pattern               : aliased Class  := Get (p_Pattern);
   ExFunc                : aliased Class  := Get (p_ExFunc);
   ExVar                 : aliased Class  := Get (p_ExVar);
   glvn                  : aliased Class  := Get (p_glvn);
   svn                   : aliased Class  := Get (p_svn);
   lvn                   : aliased Class  := Get (p_lvn);
   gvn                   : aliased Class  := Get (p_gvn);
   ssvn                  : aliased Class  := Get (p_ssvn);
   rlvn                  : aliased Class  := Get (p_rlvn);
   rgvn                  : aliased Class  := Get (p_rgvn);
   lnamind               : aliased Class  := Get (p_lnamind);
   gnamind               : aliased Class  := Get (p_gnamind);
   rexpratom             : aliased Class  := Get (p_rexpratom);
   Environment           : aliased Class  := Get (p_Environment);
   mant                  : aliased Class  := Get (p_mant);
   exponent              : aliased Class  := Get (p_exponent);
   numexpr               : aliased Class  := Get (p_numexpr);
   tvexpr                : aliased Class  := Get (p_tvexpr);
   intexpr               : aliased Class  := Get (p_intexpr);
   labelref              : aliased Class  := Get (p_labelref);
   lineref               : aliased Class  := Get (p_lineref);
   entryref              : aliased Class  := Get (p_entryref);
   externref             : aliased Class  := Get (p_externref);
   actuallist            : aliased Class  := Get (p_actuallist);
   timeout               : aliased Class  := Get (p_timeout);
   postcond              : aliased Class  := Get (p_postcond);
   dlabel                : aliased Class  := Get (p_dlabel);
   routineref            : aliased Class  := Get (p_routineref);
   externalroutinename   : aliased Class  := Get (p_externalroutinename);
   packagename           : aliased Class  := Get (p_packagename);
   actualname            : aliased Class  := Get (p_actualname);
   actual                : aliased Class  := Get (p_actual);

   -- Intermediates / Helpers
   Pct_or_Ident          : aliased Class  := Get (I_Pct_or_Ident);
   Digit_or_Ident        : aliased Class  := Get (I_Digit_or_Ident);
   Ext_Subtext           : aliased Class  := Get (I_Ext_Subtext);
   Embed_Name            : aliased Class  := Get (I_Embed_Name);
   Paren_Expr_List       : aliased Class  := Get (I_Paren_Expr_List);
   Env_Bar               : aliased Class  := Get (I_Env_Bar);
   Colon_TVExpr          : aliased Class  := Get (I_Colon_TVExpr);
   Caret_Routineref      : aliased Class  := Get (I_Caret_Routineref);
   Plus_IntExpr          : aliased Class  := Get (I_Plus_IntExpr);
   DotExpr_or_AName      : aliased Class  := Get (I_DotExpr_or_AName);

   cmd_BREAK             : aliased Class  := Get (Command_BREAK);
   cmd_CLOSE             : aliased Class  := Get (Command_CLOSE);
   cmd_DO                : aliased Class  := Get (Command_DO);
   cmd_ELSE              : aliased Class  := Get (Command_ELSE);
   cmd_FOR               : aliased Class  := Get (Command_FOR);
   cmd_GOTO              : aliased Class  := Get (Command_GOTO);
   cmd_HALT              : aliased Class  := Get (Command_HALT);
   cmd_HANG              : aliased Class  := Get (Command_HANG);
   cmd_IF                : aliased Class  := Get (Command_IF);
   cmd_JOB               : aliased Class  := Get (Command_JOB);
   cmd_KILL              : aliased Class  := Get (Command_KILL);
   cmd_LOCK              : aliased Class  := Get (Command_LOCK);
   cmd_MERGE             : aliased Class  := Get (Command_MERGE);
   cmd_NEW               : aliased Class  := Get (Command_NEW);
   cmd_OPEN              : aliased Class  := Get (Command_OPEN);
   cmd_QUIT              : aliased Class  := Get (Command_QUIT);
   cmd_READ              : aliased Class  := Get (Command_READ);
   cmd_SET               : aliased Class  := Get (Command_SET);
   cmd_TCOMMIT           : aliased Class  := Get (Command_TCOMMIT);
   cmd_TRESTART          : aliased Class  := Get (Command_TRESTART);
   cmd_TROLLBACK         : aliased Class  := Get (Command_TROLLBACK);
   cmd_TSTART            : aliased Class  := Get (Command_TSTART);
   cmd_USE               : aliased Class  := Get (Command_USE);
   cmd_VIEW              : aliased Class  := Get (Command_VIEW);
   cmd_WRITE             : aliased Class  := Get (Command_WRITE);
   cmd_XECUTE            : aliased Class  := Get (Command_XECUTE);
   cmd_Z                 : aliased Class  := Get (Command_Z);


End MParser.Nonterminals;
