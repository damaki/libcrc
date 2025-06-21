--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
with LibCRC.CRC_24bit;
with LibCRC.Predefined;
with LibCRC.Predefined.RAM_Tables;
with LibCRC.Predefined.Bitwise;

with Generic_CRC_Tests;

package CRC_24_FLEXRAY_A_Tests is new Generic_CRC_Tests
  (Name          => "CRC-24/FLEXRAY-A",
   CRC_Type      => LibCRC.Unsigned_24,
   CRC_Nbit      => LibCRC.CRC_24bit,
   ROM_Table_CRC => LibCRC.Predefined.CRC_24_FLEXRAY_A,
   RAM_Table_CRC => LibCRC.Predefined.RAM_Tables.CRC_24_FLEXRAY_A,
   Bitwise_CRC   => LibCRC.Predefined.Bitwise.CRC_24_FLEXRAY_A,
   Check_Value   => 16#7979BD#);