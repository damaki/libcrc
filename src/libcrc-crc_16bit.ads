--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
pragma SPARK_Mode (On);

with LibCRC.Generic_Nbit_CRCs;

package LibCRC.CRC_16bit is new LibCRC.Generic_Nbit_CRCs
  (CRC_Type    => Interfaces.Unsigned_16,
   Shift_Left  => Interfaces.Shift_Left,
   Shift_Right => Interfaces.Shift_Right);