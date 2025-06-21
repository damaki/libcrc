--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
with Interfaces;

with LibCRC.CRC_16bit;
with LibCRC.Predefined;
with LibCRC.Predefined.RAM_Tables;
with LibCRC.Predefined.Bitwise;

with Generic_CRC_Tests;

package CRC_16_UMTS_Tests is new Generic_CRC_Tests
  (Name          => "CRC-16/UMTS",
   CRC_Type      => Interfaces.Unsigned_16,
   CRC_Nbit      => LibCRC.CRC_16bit,
   ROM_Table_CRC => LibCRC.Predefined.CRC_16_UMTS,
   RAM_Table_CRC => LibCRC.Predefined.RAM_Tables.CRC_16_UMTS,
   Bitwise_CRC   => LibCRC.Predefined.Bitwise.CRC_16_UMTS,
   Check_Value   => 16#FEE8#);