--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--

--  This package provides the basis for calculating CRCs using tables.

generic
   Seed : CRC_Type;
   --  The default initial value for the CRC computation.

   Final_XOR : CRC_Type;
   --  Bitmask to be exclusive-ored with the calculated CRC to produce the
   --  final result.

   Reflect_Input : Boolean;
   --  Whether the input data is reflected (bit reversed) during the CRC
   --  computation.

   Reflect_Output : Boolean;
   --  Whether the computed CRC is reflected (bit reversed) before applying the
   --  Final_XOR.

   CRC_Table_Reflected : Boolean;
   --  Indicates whether the CRC_Table is a reflected table.
   --
   --  It's more efficient (faster) to use reflected tables when Reflect_Input
   --  is true, but it is not required to produce the correct output.

   CRC_Table : CRC_Table_Access;
   --  The CRC table to use for the computation.
   --
   --  If CRC_Table_Reflected is True, then this table should be generated from
   --  the reflected polynomial (see Generate_Table_Reflected).
   --
   --  An access to the table is used here to allow for sharing memory between
   --  multiple CRC algorithms with the same polynomial. Without an access
   --  type, GNAT copies the table for each generic instance.

package LibCRC.Generic_Nbit_CRCs.Table_Based with
  Preelaborate,
  SPARK_Mode,
  Always_Terminates
is

   ---------------------
   -- Single-Part CRC --
   ---------------------

   function Calculate (Bytes : Byte_Array) return CRC_Type with
     Inline,
     Global => null;
   --  Calculate the CRC over one byte array

   --------------------
   -- Multi-Part CRC --
   --------------------

   --  The following subprograms provide a means for computing the CRC of a
   --  message that consists of multiple parts by performing the following
   --  steps on a Context object:
   --   1. Call Reset to start a new CRC computation.
   --   2. Call Update one or more times to calculate the CRC over multiple
   --      data buffers.
   --   3. Call Get_CRC to finish the CRC computation and return the calculted
   --      CRC.

   type Context is private;

   procedure Reset
     (Ctx           : out Context;
      Initial_Value :     CRC_Type := Seed)
   with
     Inline,
     Global  => null,
     Depends => (Ctx => Initial_Value);

   procedure Update
     (Ctx   : in out Context;
      Bytes :        Byte_Array)
   with
     Inline,
     Global  => null,
     Depends => (Ctx =>+ Bytes);

   function Get_CRC (Ctx : Context) return CRC_Type with
     Inline,
     Global => null;

private

   type Context is new CRC_Type;

end LibCRC.Generic_Nbit_CRCs.Table_Based;