with
MParser.Internals.Get_Syntax,
MParser.Internals.Get_Grammer,
MParser.Internals.Tokenizer,
MParser.Internals.LALRs,
MParser.Internals.LALR_Generator;

Function MParser.Internals.Get_Parser return LALR_Parser.Instance is
Begin
   Return Result : constant LALR_Parser.Instance:=
     LALR_Parser.Initialize(
        Analyzer => Tokenizer.Initialize (Get_Syntax),
        Table    => LALR_Generator.Generate(
--                          Known_Conflicts          => ,
                          Trace                    => Trace,
                          Put_Parse_Table          => Put_Parse_Table,
                          Ignore_Unknown_Conflicts => Ignore_Unknown_Conflicts,
                          Ignore_Unused_Tokens     => Ignore_Unused_Tokens,
                          Grammar                  => Get_Grammer
                       ) -- End call to Generate.
       );
End MParser.Internals.Get_Parser;
