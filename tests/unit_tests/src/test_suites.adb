--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--

with CRC_Test_Suites;
with CRC_Table_Test_Suites;

package body Test_Suites
is

   function Suite return Access_Test_Suite
   is
      S : constant Access_Test_Suite := new Test_Suite;
   begin
      Add_Test (S, CRC_Test_Suites.Suite);
      Add_Test (S, CRC_Table_Test_Suites.Suite);

      return S;
   end Suite;

end Test_Suites;