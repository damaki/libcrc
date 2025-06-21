--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
package body LibCRC.Generic_Nbit_CRCs with SPARK_Mode is

   --------------------
   -- Generate_Table --
   --------------------

   function Generate_Table (Polynomial : CRC_Type) return CRC_Table_Type is
      CRC : CRC_Type;
   begin
      return Table : CRC_Table_Type do
         for I in Table'Range loop
            CRC       := Shift_Left (CRC_Type (I), CRC_Type'Size - 8);
            Table (I) := Byte_CRC (CRC, Polynomial);
         end loop;
      end return;
   end Generate_Table;

   ------------------------------
   -- Generate_Table_Reflected --
   ------------------------------

   function Generate_Table_Reflected
     (Polynomial : CRC_Type)
      return CRC_Table_Type
   is
      CRC : CRC_Type;
   begin
      return Table : CRC_Table_Type do
         for I in Table'Range loop
            CRC       := CRC_Type (I);
            Table (I) := Byte_CRC_Reflected (CRC, Polynomial);
         end loop;
      end return;
   end Generate_Table_Reflected;

   ---------------------
   -- Bit_Reverse_CRC --
   ---------------------

   function Bit_Reverse_CRC (Word : CRC_Type) return CRC_Type is
      Result : CRC_Type := 0;
      Temp   : CRC_Type := Word;

   begin
      for I in reverse Natural range 0 .. CRC_Type'Size - 1 loop
         Result := Result or Shift_Left (Temp and 1, I);
         Temp   := Shift_Right (Temp, 1);
      end loop;

      return Result;
   end Bit_Reverse_CRC;

   --------------
   -- Byte_CRC --
   --------------

   function Byte_CRC
     (CRC        : CRC_Type;
      Polynomial : CRC_Type)
      return CRC_Type
   is
      MSB    : constant CRC_Type := Shift_Left (1, CRC_Type'Size - 1);
      Result : CRC_Type          := CRC;
   begin
      for I in Natural range 0 .. 7 loop
         if (Result and MSB) /= 0 then
            Result := Shift_Left (Result, 1) xor Polynomial;
         else
            Result := Shift_Left (Result, 1);
         end if;
      end loop;

      return Result;
   end Byte_CRC;

   ------------------------
   -- Byte_CRC_Reflected --
   ------------------------

   function Byte_CRC_Reflected
     (CRC        : CRC_Type;
      Polynomial : CRC_Type)
      return CRC_Type
   is
      Result : CRC_Type := CRC;
   begin
      for I in Natural range 0 .. 7 loop
         if (Result and 1) /= 0 then
            Result := Shift_Right (Result, 1) xor Polynomial;
         else
            Result := Shift_Right (Result, 1);
         end if;
      end loop;

      return Result;
   end Byte_CRC_Reflected;

   ---------------------------------------------------
   -- Update_Bitwise_Normal_Input_Normal_Polynomial --
   ---------------------------------------------------

   procedure Update_Bitwise_Normal_Input_Normal_Polynomial
     (CRC        : in out CRC_Type;
      Bytes      :        Byte_Array;
      Polynomial :        CRC_Type)
   is
   begin
      for B of Bytes loop
         CRC := CRC xor Shift_Left (CRC_Type (B), CRC_Type'Size - 8);
         CRC := Byte_CRC (CRC, Polynomial);
      end loop;
   end Update_Bitwise_Normal_Input_Normal_Polynomial;

   ----------------------------------------------------
   -- Update_Bitwise_Reflect_Input_Normal_Polynomial --
   ----------------------------------------------------

   procedure Update_Bitwise_Reflect_Input_Normal_Polynomial
     (CRC        : in out CRC_Type;
      Bytes      :        Byte_Array;
      Polynomial :        CRC_Type)
   is
   begin
      for B of Bytes loop
         CRC := CRC xor
                Shift_Left (CRC_Type (Bit_Reverse (B)), CRC_Type'Size - 8);
         CRC := Byte_CRC (CRC, Polynomial);
      end loop;
   end Update_Bitwise_Reflect_Input_Normal_Polynomial;

   ------------------------------------------------------
   -- Update_Bitwise_Normal_Input_Reflected_Polynomial --
   ------------------------------------------------------

   procedure Update_Bitwise_Normal_Input_Reflected_Polynomial
     (CRC        : in out CRC_Type;
      Bytes      :        Byte_Array;
      Polynomial :        CRC_Type)
   is
   begin
      for B of Bytes loop
         CRC := CRC xor CRC_Type (B);
         CRC := Byte_CRC_Reflected (CRC, Polynomial);
      end loop;
   end Update_Bitwise_Normal_Input_Reflected_Polynomial;

   -------------------------------------------------------
   -- Update_Bitwise_Reflect_Input_Reflected_Polynomial --
   -------------------------------------------------------

   procedure Update_Bitwise_Reflect_Input_Reflected_Polynomial
     (CRC        : in out CRC_Type;
      Bytes      :        Byte_Array;
      Polynomial :        CRC_Type)
   is
   begin
      for B of Bytes loop
         CRC := CRC xor CRC_Type (Bit_Reverse (B));
         CRC := Byte_CRC_Reflected (CRC, Polynomial);
      end loop;
   end Update_Bitwise_Reflect_Input_Reflected_Polynomial;

   -------------------------------------------
   -- Update_Normal_Input_Normal_Polynomial --
   -------------------------------------------

   procedure Update_Normal_Input_Normal_Polynomial
     (CRC       : in out CRC_Type;
      Bytes     :        Byte_Array;
      CRC_Table :        CRC_Table_Type)
   is
      Data : Unsigned_8;

   begin
      for B of Bytes loop
         Data := B xor Unsigned_8 (Shift_Right (CRC, CRC_Type'Size - 8));
         CRC  := CRC_Table (Data) xor Shift_Left (CRC, 8);
      end loop;
   end Update_Normal_Input_Normal_Polynomial;

   --------------------------------------------
   -- Update_Reflect_Input_Normal_Polynomial --
   --------------------------------------------

   procedure Update_Reflect_Input_Normal_Polynomial
     (CRC       : in out CRC_Type;
      Bytes     :        Byte_Array;
      CRC_Table :        CRC_Table_Type)
   is
      Data : Unsigned_8;

   begin
      for B of Bytes loop
         Data := Bit_Reverse (B);
         Data := Data xor Unsigned_8 (Shift_Right (CRC, CRC_Type'Size - 8));
         CRC  := CRC_Table (Data) xor Shift_Left (CRC, 8);
      end loop;
   end Update_Reflect_Input_Normal_Polynomial;

   ----------------------------------------------
   -- Update_Normal_Input_Reflected_Polynomial --
   ----------------------------------------------

   procedure Update_Normal_Input_Reflected_Polynomial
     (CRC       : in out CRC_Type;
      Bytes     :        Byte_Array;
      CRC_Table :        CRC_Table_Type)
   is
      Data : Unsigned_8;

   begin
      for B of Bytes loop
         Data := B xor Unsigned_8 (CRC and 16#FF#);
         CRC  := CRC_Table (Data) xor Shift_Right (CRC, 8);
      end loop;
   end Update_Normal_Input_Reflected_Polynomial;

   -----------------------------------------------
   -- Update_Reflect_Input_Reflected_Polynomial --
   -----------------------------------------------

   procedure Update_Reflect_Input_Reflected_Polynomial
     (CRC       : in out CRC_Type;
      Bytes     :        Byte_Array;
      CRC_Table :        CRC_Table_Type)
   is
      Data : Unsigned_8;

   begin
      for B of Bytes loop
         Data := Bit_Reverse (B);
         Data := Data xor Unsigned_8 (CRC and 16#FF#);
         CRC  := CRC_Table (Data) xor Shift_Right (CRC, 8);
      end loop;
   end Update_Reflect_Input_Reflected_Polynomial;

end LibCRC.Generic_Nbit_CRCs;