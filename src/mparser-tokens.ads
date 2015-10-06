Pragma Ada_2012;
Pragma Assertion_Policy( Check );

with
OpenToken.Token.Enumerated;

Package MParser.Tokens is new
  OpenToken.Token.Enumerated(
    Token_ID       => MUMPS_Token,
    First_Terminal => First_Terminal,
    Last_Terminal  => Last_Terminal,
    Token_Image    => Image
                            );
