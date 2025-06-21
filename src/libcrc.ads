--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
with Interfaces; use Interfaces;

package LibCRC with
  Pure,
  SPARK_Mode,
  Always_Terminates
is

   -----------------
   -- Byte Arrays --
   -----------------

   type Byte_Array is array (Integer range <>) of Unsigned_8;

   -----------------
   -- Unsigned_24 --
   -----------------

   type Unsigned_24 is mod 2**24 with Size => 24;

   function Shift_Left
     (Value  : Unsigned_24;
      Amount : Natural)
      return Unsigned_24
   is
     (Unsigned_24 (Shift_Left (Unsigned_32 (Value), Amount) and 16#FF_FF_FF#))
   with
     Pre => Amount <= 24;

   function Shift_Right
     (Value  : Unsigned_24;
      Amount : Natural)
      return Unsigned_24
   is
     (Unsigned_24 (Shift_Right (Unsigned_32 (Value), Amount)))
   with
     Pre => Amount <= 24;

   --------------------
   -- Bit Operations --
   --------------------

   function Bit_Reverse (Byte : Unsigned_8) return Unsigned_8 with
     Global => null;
   --  Reverse bits in a byte.
   --
   --  E.g. Bit_Reverse (2#1101_0001#) = 2#1000_1011#

end LibCRC;
