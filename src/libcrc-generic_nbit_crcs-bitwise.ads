--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--

--  This package implements CRCs that are calculated bit-by-bit.
--
--  This implementation is slower than the table-based implementation, but is
--  very small and uses minimal RAM.

generic
   Polynomial : CRC_Type;
   --  The CRC polynomial to use.

   Reflected_Polynomial : Boolean;
   --  Specifies whether the Polynomial is in bit-reversed format.
   --
   --  When this is True, then the polynomial is bit-reversed. For example,
   --  the Unsigned_8 value 16#E0# represents the polynomial x^8 + x^2 + x + 1
   --
   --  When this is False then the polynomial is not reversed. For example,
   --  the Unsigned_8 value 16#07# represents the polynomial x^8 + x^2 + x + 1
   --
   --  When Reflect_Input is True then it is recommended to also use a
   --  reflected polynomial, as this slightly improves performance.

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

package LibCRC.Generic_Nbit_CRCs.Bitwise with
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

end LibCRC.Generic_Nbit_CRCs.Bitwise;