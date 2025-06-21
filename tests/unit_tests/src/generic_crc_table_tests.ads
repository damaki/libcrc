
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
with AUnit.Test_Fixtures;
with AUnit.Test_Suites;   use AUnit.Test_Suites;
with AUnit.Test_Caller;

with LibCRC.Generic_Nbit_CRCs;

--  These tests check that the ROM and RAM tables have the expected content
--  for a given polynomial.

generic
   Name : String;

   type CRC_Type is mod <>;

   Polynomial : CRC_Type;

   with package CRC_Nbit is new LibCRC.Generic_Nbit_CRCs
          (CRC_Type => CRC_Type, others => <>);

   ROM_Table     : CRC_Nbit.CRC_Table_Access;
   ROM_Table_Ref : CRC_Nbit.CRC_Table_Access;
   RAM_Table     : CRC_Nbit.CRC_Table_Access;
   RAM_Table_Ref : CRC_Nbit.CRC_Table_Access;

package Generic_CRC_Table_Tests is

   type Test_Fixture is new AUnit.Test_Fixtures.Test_Fixture with null record;

   procedure Test_Compare_ROM_RAM_Tables (T : in out Test_Fixture);
   procedure Test_Compare_ROM_Tables (T : in out Test_Fixture);
   procedure Test_Compare_RAM_Tables (T : in out Test_Fixture);
   procedure Test_ROM_Table_Content (T : in out Test_Fixture);
   procedure Test_RAM_Table_Content (T : in out Test_Fixture);
   procedure Test_ROM_Table_Reflected_Content (T : in out Test_Fixture);
   procedure Test_RAM_Table_Reflected_Content (T : in out Test_Fixture);

   procedure Add_To_Suite (S : in out Test_Suite'Class);

private

   package Caller is new AUnit.Test_Caller (Test_Fixture);

end Generic_CRC_Table_Tests;