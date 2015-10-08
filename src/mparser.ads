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
      t_Digit,		-- '0'..'9'
      t_Ident,		-- 'A'-'Z' & 'a'-'z' & 128+
      t_Control,	-- 0..31 & 127
      t_Graphic,	-- ~t_Control
      Epsilon,		-- Epsiolon is the null-string component; used to make things optional.
      Bad_Token,
      End_of_File,

      -- Intermediate nonterminals
      I_Pct_or_Ident,
      I_Digit_or_Ident,
--      I_Lvl_or_Fml,

      -- Option nonterminals
      O_Label,
      O_LI_Seq,
      O_SP_Seq,
      O_Name_List,

      -- Sequences
      S_Digit_or_Ident,
      S_Line,
      S_Space,
      S_LI,
      S_Graphic,
      S_Digit,

      -- Lists
      L_Name,

      p_S_Prime,
      p_EOL,
      p_EOR,
      p_Routine,
      P_Routinename,
      p_Routinehead,
      p_Routinebody,
      p_Name,
      p_Line,
      p_LevelLine,
      p_FormalLine,
      p_Label,
      p_LI,
      p_LineBody,
      p_Commands,
      p_Comment,
      p_ExtSyntax,
      p_FormalList,
      p_IntLit,
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
