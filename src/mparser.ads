Pragma Ada_2012;
Pragma Assertion_Policy( Check );

Package MParser with Pure is

   Type MUMPS_Token is
     (
      One,
      Two,
      Three,
      Bad_Token,
      End_of_File,

      p_S_Prime,
      p_tmp_1
     );


   Function Image( Input : MUMPS_Token ) return String;

   First_Terminal : Constant MUMPS_Token;
   Last_Terminal  : Constant MUMPS_Token;

Private
   First_Terminal : Constant MUMPS_Token := MUMPS_Token'First;
   Last_Terminal  : Constant MUMPS_Token := End_of_File;

   Function Image( Input : MUMPS_Token ) return String
     renames MUMPS_Token'Image;
End MParser;
