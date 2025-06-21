--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
package body LibCRC with
  SPARK_Mode
is

   -----------------
   -- Bit_Reverse --
   -----------------

   function Bit_Reverse
     (Byte : Interfaces.Unsigned_8)
      return Interfaces.Unsigned_8
   is
      Nybble_LUT : constant array (Unsigned_8 range 0 .. 15) of Unsigned_8 :=
                     (2#0000# => 2#0000#,
                      2#0001# => 2#1000#,
                      2#0010# => 2#0100#,
                      2#0011# => 2#1100#,
                      2#0100# => 2#0010#,
                      2#0101# => 2#1010#,
                      2#0110# => 2#0110#,
                      2#0111# => 2#1110#,
                      2#1000# => 2#0001#,
                      2#1001# => 2#1001#,
                      2#1010# => 2#0101#,
                      2#1011# => 2#1101#,
                      2#1100# => 2#0011#,
                      2#1101# => 2#1011#,
                      2#1110# => 2#0111#,
                      2#1111# => 2#1111#);
   begin
      return Shift_Left (Nybble_LUT (Byte and 16#0F#), 4) or
               Nybble_LUT (Shift_Right (Byte, 4));
   end Bit_Reverse;

end LibCRC;
