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
      t_Digit,		-- '0'..'9'
      t_Ident,		-- 'A'-'Z' & 'a'-'z' & 128+
      t_Control,	-- 0..31 & 127
      t_Graphic,	-- ~t_Control
      t_String,
      Epsilon,		-- Epsiolon is the null-string component; used to make things optional.
      Bad_Token,
      End_of_File,

      -- Intermediate nonterminals
      I_Pct_or_Ident,
      I_Digit_or_Ident,
      I_Ext_Subtext,
      I_Embed_Name,
      I_Paren_Expr_List,
      I_Env_Bar,
--      I_Lvl_or_Fml,

      -- Option nonterminals
      O_Label,
      O_LI_Seq,
      O_SP_Seq,
      O_Name_List,
      O_Exprtail_Seq,
      O_Tick,
      O_Environment,
      O_Paren_Expr_List,
      O_Env_Bar,
      O_Exponent,

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
      p_externref,
      p_actuallist,

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
