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


   -- Intermediates / Helpers
   Pct_or_Ident          : aliased Class  := Get (I_Pct_or_Ident);
   Digit_or_Ident        : aliased Class  := Get (I_Digit_or_Ident);

End MParser.Nonterminals;
