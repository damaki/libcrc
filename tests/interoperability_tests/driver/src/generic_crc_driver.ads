--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with LibCRC;

generic
   type CRC_Type is mod <>;
package Generic_CRC_Driver is

   type CRC_Function is not null access
      function (Bytes : LibCRC.Byte_Array) return CRC_Type;

   type CRC_Info is record
      Name         : Unbounded_String;
      ROM_Func     : CRC_Function;
      RAM_Func     : CRC_Function;
      Bitwise_Func : CRC_Function;
   end record;

   type CRC_Info_Array is array (Positive range <>) of CRC_Info;

   procedure Process_Stdin (Algo : CRC_Info);
   --  Process bytes from the standard input using the specified CRC algorithm.
   --
   --  The CRC is calculated using the ROM tables, RAM tables, and bitwise
   --  CRC implementations.

end Generic_CRC_Driver;