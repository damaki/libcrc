--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
with AUnit.Test_Fixtures;
with AUnit.Test_Suites;   use AUnit.Test_Suites;
with AUnit.Test_Caller;

with LibCRC.Generic_Nbit_CRCs;
with LibCRC.Generic_Nbit_CRCs.Table_Based;
with LibCRC.Generic_Nbit_CRCs.Bitwise;

--  These tests verify that the ROM/RAM/bitwise implementations of a predefined
--  CRC algorithm produce the correct outputs.
--
--  The correctness of the CRC algorithm (i.e. that it produces the correct
--  CRC) is verified by computing the CRC of the ASCII string "123456789"
--  and asserting that the computed CRC matches the provided Check_Value.
--
--  The ROM/RAM/bitwise implementations are also compared against each other
--  for other various inputs to verify that they produce identical outputs.

generic
   Name : String;

   type CRC_Type is mod <>;

   with package CRC_Nbit is new LibCRC.Generic_Nbit_CRCs
          (CRC_Type => CRC_Type, others => <>);

   with package ROM_Table_CRC is new CRC_Nbit.Table_Based (<>);
   with package RAM_Table_CRC is new CRC_Nbit.Table_Based (<>);
   with package Bitwise_CRC   is new CRC_Nbit.Bitwise     (<>);

   Check_Value : CRC_Type;
   --  Expected CRC value of the ASCII string "123456789"

package Generic_CRC_Tests is

   type Test_Fixture is new AUnit.Test_Fixtures.Test_Fixture with null record;

   procedure Test_Byte_CRC (T : in out Test_Fixture);
   procedure Test_Short_Message (T : in out Test_Fixture);
   procedure Test_Short_Zeroes (T : in out Test_Fixture);
   procedure Test_Check_Value_ROM (T : in out Test_Fixture);
   procedure Test_Check_Value_RAM (T : in out Test_Fixture);
   procedure Test_Check_Value_Bitwise (T : in out Test_Fixture);

   procedure Add_To_Suite (S : in out Test_Suite'Class);

private

   package Caller is new AUnit.Test_Caller (Test_Fixture);

end Generic_CRC_Tests;