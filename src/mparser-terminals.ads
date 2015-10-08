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
   Comma                 : aliased Class := Get (t_Comma);
   Digit                 : aliased Class := Get (t_Digit);
   Ident                 : aliased Class := Get (t_Ident);
   Control               : aliased Class := Get (t_Control);
   Graphic               : aliased Class := Get (t_Graphic);


   -- Renames
   Space                 : Class renames SP;

End MParser.Terminals;
