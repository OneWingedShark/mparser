with
Ada.Characters.Latin_1,
Ada.Strings.Maps.Constants,

OpenToken.Recognizer.String,
OpenToken.Recognizer.Character_Set,
OpenToken.Recognizer.Graphic_Character,
OpenToken.Recognizer.CSV_Field,
OpenToken.Recognizer.Nothing,
OpenToken.Recognizer.End_Of_File,
OpenToken.Recognizer.CSV_Field,
OpenToken.Recognizer.Separator,
OpenToken.Recognizer.Keyword;
with OpenToken.Token.Enumerated.Analyzer;

Function MParser.Internals.Get_Syntax return Tokenizer.Syntax is
   use MParser, Ada.Characters, Ada.Strings.Maps, Ada.Strings.Maps.Constants;
   use type Ada.Strings.Maps.Character_Set;


   Package R renames OpenToken.Recognizer;

   Function Keyword( S : String; Case_Sensitive : Boolean := False ) return Tokenizer.Recognizable_Token is
     ( Tokenizer.Get (R.Keyword.Get(S, Case_Sensitive  => Case_Sensitive)) );
   Function Separator( S : String ) return Tokenizer.Recognizable_Token is
     ( Tokenizer.Get (R.Separator.Get(S)) );
   Function Character( Accept_Set : Character_Set ) return Tokenizer.Recognizable_Token is
     ( Tokenizer.Get(R.Graphic_Character.Get(Exclude => not Accept_Set)) );

   Default : constant Tokenizer.Recognizable_Token:=
     Tokenizer.Get (OpenToken.Recognizer.Nothing.Get);

   Function "+"( Right : Standard.Character ) return String is
      (1 => Right);

   High_Set : Constant Character_Set:= not ISO_646_Set;

begin
   Return Result : constant Tokenizer.Syntax :=
     (
      t_SP	=>	Separator( +Latin_1.Space ),
      t_CR	=>	Separator( +Latin_1.CR ),
      t_LF	=>	Separator( +Latin_1.LF ),
      t_FF	=>	Separator( +Latin_1.FF ),

      t_Pct	=>	Character( To_Set('%') ),
      t_Dot	=>	Separator( +'.' ),
      t_Semicolon=>	Separator( +';' ),
      t_lparen	=>	Separator( +'(' ),
      t_rparen	=>	Separator( +')' ),
      t_Comma	=>	Separator( +',' ),
      t_Amp	=>	Separator( +'&' ),
      t_Bar	=>	Separator( +'|' ),
      t_Tick	=>	Separator( +''' ),
      t_Question=>	Separator( +'?' ),
      t_Exclaimation=>	Separator( +'!' ),
      t_Underscore=>	Separator( +'_' ),
      t_Plus	=>	Separator( +'+' ),
      t_Hyphen	=>	Separator( +'-' ),
      t_Star	=>	Separator( +'*' ),
      t_Slash	=>	Separator( +'/' ),
      t_Pound	=>	Separator( +'#' ),
      t_Backslash=>	Separator( +'\' ),
      t_DoubleStar=>	Separator( "**" ),
      t_Equal	=>	Separator( +'=' ),
      t_Less_Than=>	Separator( +'<' ),
      t_Greater_Than=>	Separator( +'>' ),
      t_LBracket=>	Separator( +'[' ),
      t_RBracket=>	Separator( +']' ),
      t_DoubleRBracket=>Separator( "]]" ),
      t_At_Sign	=>	Separator( +'@' ),
      t_Caret	=>	Separator( +'^' ),
      t_Quote	=>	Separator( +'"' ),
      t_E	=>	Separator( +'E' ),
      t_Dollar	=>	Separator( +'$' ),
      t_Colon	=>	Separator( +':' ),
      t_Digit	=>	Character(Decimal_Digit_Set),
      t_Ident	=>	Character(Upper_Set or Lower_Set or High_Set),
      t_Control	=>	Character(Control_Set),
      t_Graphic	=>	Character(not Control_Set),
      t_String	=>	Tokenizer.Get(R.String.Get),

      -- Short-Commands
      c_B	=>	Keyword("B"),
      c_C	=>	Keyword("C"),
      c_D	=>	Keyword("D"),
      c_E	=>	Keyword("E"),
      c_F	=>	Keyword("F"),
      c_G	=>	Keyword("G"),
      c_H1	=>	Keyword("H"),
      c_H2	=>	Keyword("H"),
      c_I	=>	Keyword("I"),
      c_J	=>	Keyword("J"),
      c_K	=>	Keyword("K"),
      c_L	=>	Keyword("L"),
      c_M	=>	Keyword("M"),
      c_N	=>	Keyword("N"),
      c_O	=>	Keyword("O"),
      c_Q	=>	Keyword("Q"),
      c_R	=>	Keyword("R"),
      c_S	=>	Keyword("S"),
      c_TC	=>	Keyword("TC"),
      c_TRE	=>	Keyword("TRE"),
      c_TRO	=>	Keyword("TRO"),
      c_TS	=>	Keyword("TS"),
      c_U	=>	Keyword("U"),
      c_V	=>	Keyword("V"),
      c_W	=>	Keyword("W"),
      c_X	=>	Keyword("X"),
      c_Z	=>	Keyword("Z"),

      -- Long-commands.
      c_BREAK	=>	Keyword("BREAK"),
      c_CLOSE	=>	Keyword("CLOSE"),
      c_DO	=>	Keyword("DO"),
      c_ELSE	=>	Keyword("ELSE"),
      c_FOR	=>	Keyword("FOR"),
      c_GOTO	=>	Keyword("GOTO"),
      c_HALT	=>	Keyword("HALT"),
      c_HANG	=>	Keyword("HANG"),
      c_IF	=>	Keyword("IF"),
      c_JOB	=>	Keyword("JOB"),
      c_KILL	=>	Keyword("KILL"),
      c_LOCK	=>	Keyword("LOCK"),
      c_MERGE	=>	Keyword("MERGE"),
      c_NEW	=>	Keyword("NEW"),
      c_OPEN	=>	Keyword("OPEN"),
      c_QUIT	=>	Keyword("QUIT"),
      c_READ	=>	Keyword("READ"),
      c_SET	=>	Keyword("SET"),
      c_TCOMMIT	=>	Keyword("TCOMMIT"),
      c_TRESTART=>	Keyword("TRESTART"),
      c_TROLLBACK=>	Keyword("TROLLBACK"),
      c_TSTART	=>	Keyword("TSTART"),
      c_USE	=>	Keyword("USE"),
      c_VIEW	=>	Keyword("VIEW"),
      c_WRITE	=>	Keyword("WRITE"),
      c_XECUTE	=>	Keyword("XECUTE"),

---- STUFF FROM IDL SYNTAX THAT MIGHT BE USEFUL.
------------------------------------------------
--
--        Whitespace	=>	Tokenizer.Get(R.Character_Set.Get
--                                             (R.Character_Set.Standard_Whitespace)
--                                               ),
--        Name		=>	Tokenizer.Get(
--                                   R.Identifier.Get(
--                                    Start_Chars   => Letter_Set,
--                                    Body_Chars    => Alphanumeric_Set or To_Set('_'),
--                                    Has_Separator => False
--                                   )
--                                  ),
      Epsilon		=>	Default,
      Bad_Token		=>	Default,
      End_of_File	=>	Tokenizer.Get(R.End_Of_File.Get(True))
     );

     --(Others => Default);
End MParser.Internals.Get_Syntax;
