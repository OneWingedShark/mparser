with
MParser.Internals.LALRs,
MParser.Internals.Production_List,
OpenToken.Production.Parser.LALR.Generator
;

Package MParser.Internals.LALR_Generator is new LALRs.Generator (Token_Image_Width, Production_List);
