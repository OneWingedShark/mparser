with
MParser.Internals.LALRs,
MParser.Internals.Parser_Lists,
OpenToken.Production.Parser.LALR.Parser
;

Package MParser.Internals.LALR_Parser is new MParser.Internals.LALRs.Parser
  (
   First_Parser_Label => First_Parser_Label,
   Parser_Lists       => Parser_Lists
  );
