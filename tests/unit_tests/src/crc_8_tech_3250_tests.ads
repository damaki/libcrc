--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
with Interfaces;

with LibCRC.CRC_8bit;
with LibCRC.Predefined;
with LibCRC.Predefined.RAM_Tables;
with LibCRC.Predefined.Bitwise;

with Generic_CRC_Tests;

package CRC_8_TECH_3250_Tests is new Generic_CRC_Tests
  (Name          => "CRC-8/TECH-3250",
   CRC_Type      => Interfaces.Unsigned_8,
   CRC_Nbit      => LibCRC.CRC_8bit,
   ROM_Table_CRC => LibCRC.Predefined.CRC_8_TECH_3250,
   RAM_Table_CRC => LibCRC.Predefined.RAM_Tables.CRC_8_TECH_3250,
   Bitwise_CRC   => LibCRC.Predefined.Bitwise.CRC_8_TECH_3250,
   Check_Value   => 16#97#);