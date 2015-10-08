Pragma Ada_2012;
Pragma Assertion_Policy( Check );

With
MParser.Actions,
MParser.Tokens;

Use
MParser.Tokens;

Package MParser.Terminals is

   SP                    : aliased Class := Get (t_SP);
   CR                    : aliased Class := Get (t_CR);
   LF                    : aliased Class := Get (t_LF);
   FF                    : aliased Class := Get (t_FF);
   EOF                   : aliased Class := Get (End_Of_File);

   Pct                   : aliased Class := Get (t_Pct);
   Dot                   : aliased Class := Get (t_Dot);
   Semicolon             : aliased Class := Get (t_Semicolon);
   LParen                : aliased Class := Get (t_lparen);
   RParen                : aliased Class := Get (t_rparen);
   Amp                   : aliased Class := Get (t_Amp);
   Bar                   : aliased Class := Get (t_Bar);
   Tick                  : aliased Class := Get (t_Tick);
   Comma                 : aliased Class := Get (t_Comma);
   Question              : aliased Class := Get (t_Question);
   Exclaimation          : aliased Class := Get (t_Exclaimation);
   Underscore            : aliased Class := Get (t_Underscore);
   Plus                  : aliased Class := Get (t_Plus);
   Hyphen                : aliased Class := Get (t_Hyphen);
   Star                  : aliased Class := Get (t_Star);
   Slash                 : aliased Class := Get (t_Slash);
   Pound                 : aliased Class := Get (t_Pound);
   Backslash             : aliased Class := Get (t_Backslash);
   DoubleStar            : aliased Class := Get (t_DoubleStar);
   Equal                 : aliased Class := Get (t_Equal);
   Less_Than             : aliased Class := Get (t_Less_Than);
   Greater_Than          : aliased Class := Get (t_Greater_Than);
   LBracket              : aliased Class := Get (t_LBracket);
   RBracket              : aliased Class := Get (t_RBracket);
   DoubleRBracket        : aliased Class := Get (t_DoubleRBracket);
   At_Sign               : aliased Class := Get (t_At_Sign);
   Caret                 : aliased Class := Get (t_Caret);
   Digit                 : aliased Class := Get (t_Digit);
   Ident                 : aliased Class := Get (t_Ident);
   Control               : aliased Class := Get (t_Control);
   Graphic               : aliased Class := Get (t_Graphic);

   -- Renames
   Space                 : Class renames SP;

End MParser.Terminals;
