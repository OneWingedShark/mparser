Pragma Ada_2012;

With
MParser.Tokens,
MParser.Internals.Token_List,
MParser.Internals.Nonterminal,
OpenToken.Production;

Package MParser.Internals.Production is new OpenToken.Production(
           Token       => Tokens,
           Token_List  => Token_List,
           Nonterminal => Nonterminal
                                                  );
