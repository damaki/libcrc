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

package CRC_24_OS_9_Tests is new Generic_CRC_Tests
  (Name          => "CRC-24/OS-9",
   CRC_Type      => LibCRC.Unsigned_24,
   CRC_Nbit      => LibCRC.CRC_24bit,
   ROM_Table_CRC => LibCRC.Predefined.CRC_24_OS_9,
   RAM_Table_CRC => LibCRC.Predefined.RAM_Tables.CRC_24_OS_9,
   Bitwise_CRC   => LibCRC.Predefined.Bitwise.CRC_24_OS_9,
   Check_Value   => 16#200FA5#);