--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
with Interfaces;

--  This package provides common parts for all CRCs of a specific bit-size.

generic
   type CRC_Type is mod <>;

   with function Shift_Left
          (Value : CRC_Type;
           Amount : Natural) return CRC_Type;

   with function Shift_Right
          (Value : CRC_Type;
           Amount : Natural) return CRC_Type;

package LibCRC.Generic_Nbit_CRCs with
  Preelaborate,
  SPARK_Mode,
  Always_Terminates
is

   pragma Compile_Time_Error
     (CRC_Type'Size < 8, "minimum supported CRC size is 8 bits");

   type CRC_Table_Type is array (Interfaces.Unsigned_8) of CRC_Type;

   type CRC_Table_Access is not null access constant CRC_Table_Type;

   function Generate_Table (Polynomial : CRC_Type) return CRC_Table_Type;
   --  Generate a CRC table for the given polynomial.
   --
   --  The N-bit polynomial is provided in implicit x^N term notation.
   --  For example, the 8-bit value 16#07# represents the polynomial
   --  x^8 + x^2 + x^1 + 1.

   function Generate_Table_Reflected
     (Polynomial : CRC_Type)
      return CRC_Table_Type;
   --  Generate a reflected CRC table for the given reflected polynomial.
   --
   --  The provided Polynomial must be bit-reversed. For example, the 8-bit
   --  value 16#E0# represents the polynomial x^8 + x^2 + x + 1.

   function Bit_Reverse_CRC (Word : CRC_Type) return CRC_Type with
     Global => null;
   --  Reverse the bits in a CRC

private

   ----------------------------
   -- Bitwise CRC Operations --
   ----------------------------

   function Byte_CRC
     (CRC        : CRC_Type;
      Polynomial : CRC_Type)
      return CRC_Type;

   function Byte_CRC_Reflected
     (CRC        : CRC_Type;
      Polynomial : CRC_Type)
      return CRC_Type;

   procedure Update_Bitwise_Normal_Input_Normal_Polynomial
     (CRC        : in out CRC_Type;
      Bytes      :        Byte_Array;
      Polynomial :        CRC_Type);

   procedure Update_Bitwise_Reflect_Input_Normal_Polynomial
     (CRC        : in out CRC_Type;
      Bytes      :        Byte_Array;
      Polynomial :        CRC_Type);

   procedure Update_Bitwise_Normal_Input_Reflected_Polynomial
     (CRC        : in out CRC_Type;
      Bytes      :        Byte_Array;
      Polynomial :        CRC_Type);

   procedure Update_Bitwise_Reflect_Input_Reflected_Polynomial
     (CRC        : in out CRC_Type;
      Bytes      :        Byte_Array;
      Polynomial :        CRC_Type);

   ----------------------------
   -- Table-based Operations --
   ----------------------------

   procedure Update_Normal_Input_Normal_Polynomial
     (CRC       : in out CRC_Type;
      Bytes     :        Byte_Array;
      CRC_Table :        CRC_Table_Type)
   with
     Global  => null,
     Depends => (CRC =>+ (Bytes, CRC_Table));
   --  Update the CRC computation over a byte array.
   --
   --  The input bytes are not reflected before being processed.
   --
   --  The CRC_Table is assumed to not be in reflected form.

   procedure Update_Reflect_Input_Normal_Polynomial
     (CRC       : in out CRC_Type;
      Bytes     :        Byte_Array;
      CRC_Table :        CRC_Table_Type)
   with
     Global  => null,
     Depends => (CRC =>+ (Bytes, CRC_Table));
   --  Update the CRC computation over a byte array.
   --
   --  The input bytes are reflected (bit-reversed) before being processed.
   --
   --  The CRC_Table is assumed to not be in reflected form.

   procedure Update_Normal_Input_Reflected_Polynomial
     (CRC       : in out CRC_Type;
      Bytes     :        Byte_Array;
      CRC_Table :        CRC_Table_Type)
   with
     Global  => null,
     Depends => (CRC =>+ (Bytes, CRC_Table));
   --  Update the CRC computation over a byte array.
   --
   --  The input bytes are not reflected before being processed.
   --
   --  The CRC_Table is assumed to be in reflected form.

   procedure Update_Reflect_Input_Reflected_Polynomial
     (CRC       : in out CRC_Type;
      Bytes     :        Byte_Array;
      CRC_Table :        CRC_Table_Type)
   with
     Global  => null,
     Depends => (CRC =>+ (Bytes, CRC_Table));
   --  Update the CRC computation over a byte array.
   --
   --  The input bytes are reflected (bit-reversed) before being processed.
   --
   --  The CRC_Table is assumed to be in reflected form.

end LibCRC.Generic_Nbit_CRCs;