--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
with Interfaces;

with LibCRC.CRC_64bit;
with LibCRC.Predefined;
with LibCRC.Predefined.RAM_Tables;
with LibCRC.Predefined.Bitwise;

with Generic_CRC_Tests;

package CRC_64_WE_Tests is new Generic_CRC_Tests
  (Name          => "CRC-64/WE",
   CRC_Type      => Interfaces.Unsigned_64,
   CRC_Nbit      => LibCRC.CRC_64bit,
   ROM_Table_CRC => LibCRC.Predefined.CRC_64_WE,
   RAM_Table_CRC => LibCRC.Predefined.RAM_Tables.CRC_64_WE,
   Bitwise_CRC   => LibCRC.Predefined.Bitwise.CRC_64_WE,
   Check_Value   => 16#62EC59E3F1A4F00A#);