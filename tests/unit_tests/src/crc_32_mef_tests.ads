--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
with Interfaces;

with LibCRC.CRC_32bit;
with LibCRC.Predefined;
with LibCRC.Predefined.RAM_Tables;
with LibCRC.Predefined.Bitwise;

with Generic_CRC_Tests;

package CRC_32_MEF_Tests is new Generic_CRC_Tests
  (Name          => "CRC-32/MEF",
   CRC_Type      => Interfaces.Unsigned_32,
   CRC_Nbit      => LibCRC.CRC_32bit,
   ROM_Table_CRC => LibCRC.Predefined.CRC_32_MEF,
   RAM_Table_CRC => LibCRC.Predefined.RAM_Tables.CRC_32_MEF,
   Bitwise_CRC   => LibCRC.Predefined.Bitwise.CRC_32_MEF,
   Check_Value   => 16#D2C22F51#);