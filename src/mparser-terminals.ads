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
   Quote                 : aliased Class := Get (t_Quote);
   E                     : aliased Class := Get (t_E);
   Dollar                : aliased Class := Get (t_Dollar);
   Colon                 : aliased Class := Get (t_Colon);
   Digit                 : aliased Class := Get (t_Digit);
   Ident                 : aliased Class := Get (t_Ident);
   Control               : aliased Class := Get (t_Control);
   Graphic               : aliased Class := Get (t_Graphic);
   String_Element        : aliased Class := Get (t_String);

   -- Short Commands,
   sc_BREAK             : aliased Class  := Get (C_B);
   sc_CLOSE             : aliased Class  := Get (C_C);
   sc_DO                : aliased Class  := Get (C_D);
   sc_ELSE              : aliased Class  := Get (C_E);
   sc_FOR               : aliased Class  := Get (C_F);
   sc_GOTO              : aliased Class  := Get (C_G);
   sc_HALT              : aliased Class  := Get (C_H1);
   sc_HANG              : aliased Class  := Get (C_H2);
   sc_IF                : aliased Class  := Get (C_I);
   sc_JOB               : aliased Class  := Get (C_J);
   sc_KILL              : aliased Class  := Get (C_K);
   sc_LOCK              : aliased Class  := Get (C_L);
   sc_MERGE             : aliased Class  := Get (C_M);
   sc_NEW               : aliased Class  := Get (C_N);
   sc_OPEN              : aliased Class  := Get (C_O);
   sc_QUIT              : aliased Class  := Get (C_Q);
   sc_READ              : aliased Class  := Get (C_R);
   sc_SET               : aliased Class  := Get (C_S);
   sc_TCOMMIT           : aliased Class  := Get (C_TC);
   sc_TRESTART          : aliased Class  := Get (C_TRE);
   sc_TROLLBACK         : aliased Class  := Get (C_TRO);
   sc_TSTART            : aliased Class  := Get (C_TS);
   sc_USE               : aliased Class  := Get (C_U);
   sc_VIEW              : aliased Class  := Get (C_V);
   sc_WRITE             : aliased Class  := Get (C_W);
   sc_XECUTE            : aliased Class  := Get (C_X);
   sc_Z                 : aliased Class  := Get (C_Z);

   -- Long Commands.
   lc_BREAK             : aliased Class  := Get (C_BREAK);
   lc_CLOSE             : aliased Class  := Get (C_CLOSE);
   lc_DO                : aliased Class  := Get (C_DO);
   lc_ELSE              : aliased Class  := Get (C_ELSE);
   lc_FOR               : aliased Class  := Get (C_FOR);
   lc_GOTO              : aliased Class  := Get (C_GOTO);
   lc_HALT              : aliased Class  := Get (C_HALT);
   lc_HANG              : aliased Class  := Get (C_HANG);
   lc_IF                : aliased Class  := Get (C_IF);
   lc_JOB               : aliased Class  := Get (C_JOB);
   lc_KILL              : aliased Class  := Get (C_KILL);
   lc_LOCK              : aliased Class  := Get (C_LOCK);
   lc_MERGE             : aliased Class  := Get (C_MERGE);
   lc_NEW               : aliased Class  := Get (C_NEW);
   lc_OPEN              : aliased Class  := Get (C_OPEN);
   lc_QUIT              : aliased Class  := Get (C_QUIT);
   lc_READ              : aliased Class  := Get (C_READ);
   lc_SET               : aliased Class  := Get (C_SET);
   lc_TCOMMIT           : aliased Class  := Get (C_TCOMMIT);
   lc_TRESTART          : aliased Class  := Get (C_TRESTART);
   lc_TROLLBACK         : aliased Class  := Get (C_TROLLBACK);
   lc_TSTART            : aliased Class  := Get (C_TSTART);
   lc_USE               : aliased Class  := Get (C_USE);
   lc_VIEW              : aliased Class  := Get (C_VIEW);
   lc_WRITE             : aliased Class  := Get (C_WRITE);
   lc_XECUTE            : aliased Class  := Get (C_XECUTE);
   --lc_Z                 : aliased Class  := Get (C_Z);

   -- Renames
   Space                 : Class renames SP;

End MParser.Terminals;
