--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
with Interfaces;       use Interfaces;
with AUnit.Assertions; use AUnit.Assertions;

with LibCRC;
with LibCRC.CRC_32bit;
with LibCRC.Generic_Nbit_CRCs.Table_Based;
with LibCRC.Generic_Nbit_CRCs.Bitwise;

package body Reflection_Tests is

   --  Use the CRC-32 polynomial for testing
   Test_Polynomial : constant Unsigned_32 := 16#04C11DB7#;

   --  Other parameters for testing
   Test_Seed       : constant Unsigned_32 := 16#12345678#;
   Test_Final_XOR  : constant Unsigned_32 := 16#87654321#;

   Test_Table : aliased constant LibCRC.CRC_32bit.CRC_Table_Type :=
                  LibCRC.CRC_32bit.Generate_Table (Test_Polynomial);

   Test_Table_Reflected :
     aliased constant LibCRC.CRC_32bit.CRC_Table_Type :=
       LibCRC.CRC_32bit.Generate_Table_Reflected
         (LibCRC.CRC_32bit.Bit_Reverse_CRC (Test_Polynomial));

   ---------------------------
   -- Test_Table_Reflection --
   ---------------------------

   --  Test that equivalent CRCs are output for two table-based CRCs that
   --  are identical, except one uses a reflected table and the other a
   --  normal (non-reflected) table.
   --
   --  The test is performed for all possible combinations of Reflect_Input
   --  and Reflect_Output.

   procedure Test_Table_Reflection  (T : in out Test_Fixture) is
      Test_Data : constant LibCRC.Byte_Array := (1, 2, 3, 4, 5, 255, 254, 253);

   begin
      for Reflect_Input in Boolean'Range loop
         for Reflect_Output in Boolean'Range loop
            declare
               package Test_CRC is new LibCRC.CRC_32bit.Table_Based
                 (Seed                => Test_Seed,
                  Final_XOR           => Test_Final_XOR,
                  Reflect_Input       => Reflect_Input,
                  Reflect_Output      => Reflect_Output,
                  CRC_Table_Reflected => False,
                  CRC_Table           => Test_Table'Access);

               package Test_CRC_Reflected is new LibCRC.CRC_32bit.Table_Based
                 (Seed                => Test_Seed,
                  Final_XOR           => Test_Final_XOR,
                  Reflect_Input       => Reflect_Input,
                  Reflect_Output      => Reflect_Output,
                  CRC_Table_Reflected => True,
                  CRC_Table           => Test_Table_Reflected'Access);

               CRC_1 : Unsigned_32;
               CRC_2 : Unsigned_32;
            begin

               CRC_1 := Test_CRC.Calculate (Test_Data);
               CRC_2 := Test_CRC_Reflected.Calculate (Test_Data);

               Assert (CRC_1 = CRC_2,
                       "CRC mismatch for Reflect_Input = "
                         & Reflect_Input'Image & ", Reflect_Output = "
                         & Reflect_Output'Image & ":"
                         & CRC_1'Image & " !="
                         & CRC_2'Image);
            end;
         end loop;
      end loop;
   end Test_Table_Reflection;

   -----------------------------
   -- Test_Bitwise_Reflection --
   -----------------------------

   --  Test that equivalent CRCs are output for two bitwise CRCs that
   --  are identical, except one uses a reflected polynomial and the other a
   --  normal (non-reflected) polynomial.
   --
   --  The test is performed for all possible combinations of Reflect_Input
   --  and Reflect_Output.

   procedure Test_Bitwise_Reflection  (T : in out Test_Fixture) is
      Test_Data : constant LibCRC.Byte_Array := (1, 2, 3, 4, 5, 255, 254, 253);

   begin
      for Reflect_Input in Boolean'Range loop
         for Reflect_Output in Boolean'Range loop
            declare
               package Test_CRC is new LibCRC.CRC_32bit.Bitwise
                 (Polynomial           => Test_Polynomial,
                  Reflected_Polynomial => False,
                  Seed                 => Test_Seed,
                  Final_XOR            => Test_Final_XOR,
                  Reflect_Input        => Reflect_Input,
                  Reflect_Output       => Reflect_Output);

               package Test_CRC_Reflected is new LibCRC.CRC_32bit.Bitwise
                 (Polynomial           => LibCRC.CRC_32bit.Bit_Reverse_CRC
                                            (Test_Polynomial),
                  Reflected_Polynomial => True,
                  Seed                 => Test_Seed,
                  Final_XOR            => Test_Final_XOR,
                  Reflect_Input        => Reflect_Input,
                  Reflect_Output       => Reflect_Output);

               CRC_1 : Unsigned_32;
               CRC_2 : Unsigned_32;
            begin

               CRC_1 := Test_CRC.Calculate (Test_Data);
               CRC_2 := Test_CRC_Reflected.Calculate (Test_Data);

               Assert (CRC_1 = CRC_2,
                       "CRC mismatch for Reflect_Input = "
                         & Reflect_Input'Image & ", Reflect_Output = "
                         & Reflect_Output'Image & ":"
                         & CRC_1'Image & " !="
                         & CRC_2'Image);
            end;
         end loop;
      end loop;
   end Test_Bitwise_Reflection;

   ------------------
   -- Add_To_Suite --
   ------------------

   procedure Add_To_Suite (S : in out Test_Suite'Class) is
   begin
      S.Add_Test (Caller.Create ("Test table reflection equivalence",
                                 Test_Table_Reflection'Access));
      S.Add_Test (Caller.Create ("Test bitwise reflection equivalence",
                                 Test_Bitwise_Reflection'Access));
   end Add_To_Suite;

end Reflection_Tests;