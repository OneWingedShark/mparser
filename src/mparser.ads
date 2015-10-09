Pragma Ada_2012;
Pragma Assertion_Policy( Check );

Package MParser with Pure is

   Type MUMPS_Token is
     (

      t_SP,		-- (space)
      t_CR,		-- (carriage-return)
      t_LF,		-- (line-feed)
      t_FF,		-- (form-feed)

      t_Pct,		-- '%'
      t_Dot,		-- '.'
      t_Semicolon,	-- ';'
      t_lparen,		-- '('
      t_rparen,		-- ')'
      t_Comma,		-- ','
      t_Amp,		-- '&'
      t_Bar,		-- '|'
      t_Tick,		-- '''
      t_Question,	-- '?'
      t_Exclaimation,	-- '!'
      t_Underscore,	-- '_'
      t_Plus,		-- '+'
      t_Hyphen,		-- '-'
      t_Star,		-- '*'
      t_Slash,		-- '/'
      t_Pound,		-- '#'
      t_Backslash,	-- '\'
      t_DoubleStar,	-- "**"
      t_Equal,		-- '='
      t_Less_Than,	-- '<'
      t_Greater_Than,	-- '>'
      t_LBracket,	-- '['
      t_RBracket,	-- ']'
      t_DoubleRBracket,	-- "]]"
      t_At_Sign,	-- '@'
      t_Caret,		-- '^'
      t_Quote,		-- '"'
      t_E,		-- 'E'
      t_Dollar,		-- '$'
      t_Colon,		-- ':'
      t_Digit,		-- '0'..'9'
      t_Ident,		-- 'A'-'Z' & 'a'-'z' & 128+
      t_Control,	-- 0..31 & 127
      t_Graphic,	-- ~t_Control
      t_String,

      -- Short Commands
      c_B,
      c_C,
      c_D,
      c_E,
      c_F,
      c_G,
      c_H1,
      c_H2,
      c_I,
      c_J,
      c_K,
      c_L,
      c_M,
      c_N,
      c_O,
      c_Q,
      c_R,
      c_S,
      c_TC,
      c_TRE,
      c_TRO,
      c_TS,
      c_U,
      c_V,
      c_W,
      c_X,
      c_Z,

      -- Long Commands
      c_BREAK,
      c_CLOSE,
      c_DO,
      c_ELSE,
      c_FOR,
      c_GOTO,
      c_HALT,
      c_HANG,
      c_IF,
      c_JOB,
      c_KILL,
      c_LOCK,
      c_MERGE,
      c_NEW,
      c_OPEN,
      c_QUIT,
      c_READ,
      c_SET,
      c_TCOMMIT,
      c_TRESTART,
      c_TROLLBACK,
      c_TSTART,
      c_USE,
      c_VIEW,
      c_WRITE,
      c_XECUTE,

      Epsilon,		-- Epsiolon is the null-string component; used to make things optional.
      Bad_Token,
      End_of_File,

      -- Commands
      Command_BREAK,
      Command_CLOSE,
      Command_DO,
      Command_ELSE,
      Command_FOR,
      Command_GOTO,
      Command_HALT,
      Command_HANG,
      Command_IF,
      Command_JOB,
      Command_KILL,
      Command_LOCK,
      Command_MERGE,
      Command_NEW,
      Command_OPEN,
      Command_QUIT,
      Command_READ,
      Command_SET,
      Command_TCOMMIT,
      Command_TRESTART,
      Command_TROLLBACK,
      Command_TSTART,
      Command_USE,
      Command_VIEW,
      Command_WRITE,
      Command_XECUTE,
      Command_Z,

      -- Syntax for given commands
      Syntax_BREAK,
      Syntax_CLOSE,
      Syntax_DO,
      Syntax_ELSE,
      Syntax_FOR,
      Syntax_GOTO,
      Syntax_HALT,
      Syntax_HANG,
      Syntax_IF,
      Syntax_JOB,
      Syntax_KILL,
      Syntax_LOCK,
      Syntax_MERGE,
      Syntax_NEW,
      Syntax_OPEN,
      Syntax_QUIT,
      Syntax_READ,
      Syntax_SET,
      Syntax_TCOMMIT,
      Syntax_TRESTART,
      Syntax_TROLLBACK,
      Syntax_TSTART,
      Syntax_USE,
      Syntax_VIEW,
      Syntax_WRITE,
      Syntax_XECUTE,
      Syntax_Z,

      -- Intermediate nonterminals
      I_Pct_or_Ident,
      I_Digit_or_Ident,
      I_Ext_Subtext,
      I_Embed_Name,
      I_Paren_Expr_List,
      I_Env_Bar,
      I_Colon_TVExpr,
      I_Caret_Routineref,
      I_Plus_IntExpr,
      I_DotExpr_or_AName,

      -- Option nonterminals
      O_Label,
      O_LI_Seq,
      O_SP_Seq,
      O_SP,
      O_Name_List,
      O_Exprtail_Seq,
      O_Tick,
      O_Environment,
      O_Paren_Expr_List,
      O_Env_Bar,
      O_Exponent,
      O_Colon_TVExpr,
      O_Caret_Routineref,
      O_Plus_IntExpr,
      O_DotExpr_or_AName,
      O_Actual_List,

      -- Sequences
      S_Digit_or_Ident,
      S_Line,
      S_Space,
      S_LI,
      S_Graphic,
      S_Digit,
      S_Ext_Subtext,
      S_ExprTail,

      -- Lists
      L_Name,
      L_Expr,
      L_Actual,
      L_Close_Arg,
      L_Do_Arg,
      L_forparameter,
      L_gotoargument,
      L_hangargument,
      L_ifargument,
      L_jobargument,
      L_killargument,
      L_lockargument,
      L_mergeargument,
      L_newargument,
      L_openargument,
      L_readargument,
      L_setargument,
      L_tstartargument,
      L_useargument,
      L_writeargument,
      L_xecute,

      p_S_Prime,
      p_EOL,
      p_EOR,
      p_Routine,
      P_Routinename,
      p_Routinehead,
      p_Routinebody,
      p_Name,
      P_NameValue,
      p_Line,
      p_LevelLine,
      p_FormalLine,
      p_Label,
      p_LI,
      p_LineBody,
      p_Commands,
      p_Comment,
      p_ExtSyntax,
      p_ExtText,
      p_ExtID,
      p_FormalList,
      p_IntLit,
      p_StrLit,
      p_NumLit,
      p_Expr,
      p_ExprTail,
      p_ExprAtom,
      p_ExprItem,
      p_RExprAtom,
      p_UnaryOp,
      p_BinaryOp,
      p_TruthOp,
      p_LogicalOp,
      p_Relation,
      p_Pattern,
      p_ExFunc,
      p_ExVar,
      p_glvn,
      p_svn,
      p_lvn,
      p_gvn,
      p_ssvn,
      p_rlvn,
      p_rgvn,
      p_lnamind,
      p_gnamind,
      p_Environment,
      p_mant,
      p_exponent,
      p_numexpr,
      p_tvexpr,
      p_intexpr,
      p_labelref,
      p_lineref,
      p_entryref,
      p_externref,
      p_actuallist,
      p_timeout,
      p_postcond,
      p_dlabel,
      p_routineref,
      p_externalroutinename,
      p_packagename,
      p_actualname,
      p_actual,
      p_CloseArgument,
      p_DoArgument,
      p_ForParameter,
      p_GotoArgument,
      p_HangArgument,
      p_IfArgument,
      p_JobArgument,
      p_KillArgument,
      p_LockArgument,
      p_MergeArgument,
      p_NewArgument,
      p_OpenArgument,
      p_ReadArgument,
      p_SetArgument,
      p_TStartArgument,
      p_UseArgument,
      p_WriteArgument,
      p_XecuteArgument,

      p_charset,
      p_tmp_1
     );


   Function Image( Input : MUMPS_Token ) return String;

   First_Terminal : Constant MUMPS_Token;
   Last_Terminal  : Constant MUMPS_Token;

Private
   First_Terminal : Constant MUMPS_Token := MUMPS_Token'First;
   Last_Terminal  : Constant MUMPS_Token := End_of_File;

   Function Image( Input : MUMPS_Token ) return String
     renames MUMPS_Token'Image;
End MParser;
