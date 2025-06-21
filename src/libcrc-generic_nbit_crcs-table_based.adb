--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
package body LibCRC.Generic_Nbit_CRCs.Table_Based with SPARK_Mode is

   ---------------
   -- Calculate --
   ---------------

   function Calculate (Bytes : Byte_Array) return CRC_Type is
      Ctx : Context;
   begin
      Reset (Ctx);
      Update (Ctx, Bytes);
      return Get_CRC (Ctx);
   end Calculate;

   -----------
   -- Reset --
   -----------

   procedure Reset
     (Ctx           : out Context;
      Initial_Value :     CRC_Type := Seed)
   is
   begin
      if CRC_Table_Reflected then
         Ctx := Context (Bit_Reverse_CRC (Initial_Value));
      else
         Ctx := Context (Initial_Value);
      end if;
   end Reset;

   ------------
   -- Update --
   ------------

   procedure Update
     (Ctx       : in out Context;
      Bytes     :        Byte_Array)
   is
   begin
      if Reflect_Input then
         if CRC_Table_Reflected then
            Update_Normal_Input_Reflected_Polynomial
              (CRC_Type (Ctx), Bytes, CRC_Table.all);
         else
            Update_Reflect_Input_Normal_Polynomial
              (CRC_Type (Ctx), Bytes, CRC_Table.all);
         end if;
      else
         if CRC_Table_Reflected then
            Update_Reflect_Input_Reflected_Polynomial
              (CRC_Type (Ctx), Bytes, CRC_Table.all);
         else
            Update_Normal_Input_Normal_Polynomial
              (CRC_Type (Ctx), Bytes, CRC_Table.all);
         end if;
      end if;
   end Update;

   -------------
   -- Get_CRC --
   -------------

   function Get_CRC (Ctx : Context) return CRC_Type is
      CRC : CRC_Type := CRC_Type (Ctx);
   begin
      if Reflect_Output then
         if not CRC_Table_Reflected then
            CRC := Bit_Reverse_CRC (CRC);
         end if;
      end if;

      return CRC xor Final_XOR;
   end Get_CRC;

end LibCRC.Generic_Nbit_CRCs.Table_Based;