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
      pragma Warnings
        (GNATprove, Off, "statement has no effect",
         Reason =>
           "Statement has effect for different generic instantiations");

      if CRC_Table_Reflected then

         pragma Warnings (GNATprove, On, "statement has no effect");

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
      pragma Warnings
        (GNATprove, Off, "statement has no effect",
         Reason =>
           "Statement has effect for different generic instantiations");

      if Reflect_Input then
         if CRC_Table_Reflected then

            pragma Warnings (GNATprove, On, "statement has no effect");

            Update_Normal_Input_Reflected_Polynomial
              (CRC_Type (Ctx), Bytes, CRC_Table.all);
         else
            Update_Reflect_Input_Normal_Polynomial
              (CRC_Type (Ctx), Bytes, CRC_Table.all);
         end if;
      else
         pragma Warnings
           (GNATprove, Off, "statement has no effect",
            Reason =>
              "Statement has effect for different generic instantiations");

         if CRC_Table_Reflected then

            pragma Warnings (GNATprove, On, "statement has no effect");

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
      pragma Warnings
        (GNATprove, Off, "statement has no effect",
         Reason =>
           "Statement has effect for different generic instantiations");

      if Reflect_Output /= CRC_Table_Reflected then

         pragma Warnings (GNATprove, On, "statement has no effect");

         CRC := Bit_Reverse_CRC (CRC);
      end if;

      return CRC xor Final_XOR;
   end Get_CRC;

end LibCRC.Generic_Nbit_CRCs.Table_Based;