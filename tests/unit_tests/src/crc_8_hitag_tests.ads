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

package CRC_8_HITAG_Tests is new Generic_CRC_Tests
  (Name          => "CRC-8/HITAG",
   CRC_Type      => Interfaces.Unsigned_8,
   CRC_Nbit      => LibCRC.CRC_8bit,
   ROM_Table_CRC => LibCRC.Predefined.CRC_8_HITAG,
   RAM_Table_CRC => LibCRC.Predefined.RAM_Tables.CRC_8_HITAG,
   Bitwise_CRC   => LibCRC.Predefined.Bitwise.CRC_8_HITAG,
   Check_Value   => 16#B4#);