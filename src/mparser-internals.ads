Pragma Ada_2012;

Package MParser.Internals with Pure is

   First_Parser_Label       : constant := 1;
   First_State_Index        : constant := First_Parser_Label;
   Token_Image_Width        : constant := MUMPS_Token'Width;

   Trace                    : Constant Boolean := False;
   Put_Parse_Table          : Constant Boolean := False;
   Ignore_Unknown_Conflicts : Constant Boolean := False;
   Ignore_Unused_Tokens     : Constant Boolean := True;

End MParser.Internals;
