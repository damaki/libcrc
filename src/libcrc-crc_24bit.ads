--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
pragma SPARK_Mode (On);

with LibCRC.Generic_Nbit_CRCs;

package LibCRC.CRC_24bit is new LibCRC.Generic_Nbit_CRCs
  (CRC_Type    => LibCRC.Unsigned_24,
   Shift_Left  => LibCRC.Shift_Left,
   Shift_Right => LibCRC.Shift_Right);