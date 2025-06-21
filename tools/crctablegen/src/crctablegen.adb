--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
with Ada.Command_Line;
with Ada.Text_IO;      use Ada.Text_IO;
with Interfaces;

with LibCRC;
with LibCRC.CRC_8bit;
with LibCRC.CRC_16bit;
with LibCRC.CRC_24bit;
with LibCRC.CRC_32bit;
with LibCRC.CRC_64bit;
with LibCRC.Generic_Nbit_CRCs;

with Types; use Types;

--  This program prints a CRC table for any CRC polynomial from any size
--  from 8 bits to 64 bits.

procedure Crctablegen is

   generic
      type CRC_Type is mod <>;
      with package Base_CRC is new LibCRC.Generic_Nbit_CRCs
        (CRC_Type => CRC_Type,
         others   => <>);
   procedure Generic_Put_Table
     (Polynomial : CRC_Type;
      Reflected  : Boolean);
   --  Print the CRC table to the standard output for the given polynomial.

   -----------------------
   -- Generic_Put_Table --
   -----------------------

   procedure Generic_Put_Table
     (Polynomial : CRC_Type;
      Reflected  : Boolean)
   is
      use type Interfaces.Unsigned_8;

      package CRC_IO is new Ada.Text_IO.Modular_IO (CRC_Type);

      Table : constant Base_CRC.CRC_Table_Type :=
                (if Reflected
                 then Base_CRC.Generate_Table_Reflected
                        (Base_CRC.Bit_Reverse_CRC (Polynomial))
                 else Base_CRC.Generate_Table (Polynomial));
   begin
      for I in Table'Range loop
         if I mod 4 = 0 then
            New_Line;
         end if;

         CRC_IO.Put (Table (I), Base => 16, Width => (CRC_Type'Size / 4) + 4);
         Put (", ");
      end loop;
   end Generic_Put_Table;

   --  CRC definitions for all widths not defined in LibCRC

   package CRC_9bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC9_Type,
      Shift_Left  => Shift_Left_9,
      Shift_Right => Shift_Right_9);

   package CRC_10bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC10_Type,
      Shift_Left  => Shift_Left_10,
      Shift_Right => Shift_Right_10);

   package CRC_11bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC11_Type,
      Shift_Left  => Shift_Left_11,
      Shift_Right => Shift_Right_11);

   package CRC_12bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC12_Type,
      Shift_Left  => Shift_Left_12,
      Shift_Right => Shift_Right_12);

   package CRC_13bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC13_Type,
      Shift_Left  => Shift_Left_13,
      Shift_Right => Shift_Right_13);

   package CRC_14bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC14_Type,
      Shift_Left  => Shift_Left_14,
      Shift_Right => Shift_Right_14);

   package CRC_15bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC15_Type,
      Shift_Left  => Shift_Left_15,
      Shift_Right => Shift_Right_15);

   package CRC_17bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC17_Type,
      Shift_Left  => Shift_Left_17,
      Shift_Right => Shift_Right_17);

   package CRC_18bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC18_Type,
      Shift_Left  => Shift_Left_18,
      Shift_Right => Shift_Right_18);

   package CRC_19bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC19_Type,
      Shift_Left  => Shift_Left_19,
      Shift_Right => Shift_Right_19);

   package CRC_20bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC20_Type,
      Shift_Left  => Shift_Left_20,
      Shift_Right => Shift_Right_20);

   package CRC_21bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC21_Type,
      Shift_Left  => Shift_Left_21,
      Shift_Right => Shift_Right_21);

   package CRC_22bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC22_Type,
      Shift_Left  => Shift_Left_22,
      Shift_Right => Shift_Right_22);

   package CRC_23bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC23_Type,
      Shift_Left  => Shift_Left_23,
      Shift_Right => Shift_Right_23);

   package CRC_25bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC25_Type,
      Shift_Left  => Shift_Left_25,
      Shift_Right => Shift_Right_25);

   package CRC_26bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC26_Type,
      Shift_Left  => Shift_Left_26,
      Shift_Right => Shift_Right_26);

   package CRC_27bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC27_Type,
      Shift_Left  => Shift_Left_27,
      Shift_Right => Shift_Right_27);

   package CRC_28bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC28_Type,
      Shift_Left  => Shift_Left_28,
      Shift_Right => Shift_Right_28);

   package CRC_29bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC29_Type,
      Shift_Left  => Shift_Left_29,
      Shift_Right => Shift_Right_29);

   package CRC_30bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC30_Type,
      Shift_Left  => Shift_Left_30,
      Shift_Right => Shift_Right_30);

   package CRC_31bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC31_Type,
      Shift_Left  => Shift_Left_31,
      Shift_Right => Shift_Right_31);

   package CRC_33bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC33_Type,
      Shift_Left  => Shift_Left_33,
      Shift_Right => Shift_Right_33);

   package CRC_34bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC34_Type,
      Shift_Left  => Shift_Left_34,
      Shift_Right => Shift_Right_34);

   package CRC_35bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC35_Type,
      Shift_Left  => Shift_Left_35,
      Shift_Right => Shift_Right_35);

   package CRC_36bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC36_Type,
      Shift_Left  => Shift_Left_36,
      Shift_Right => Shift_Right_36);

   package CRC_37bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC37_Type,
      Shift_Left  => Shift_Left_37,
      Shift_Right => Shift_Right_37);

   package CRC_38bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC38_Type,
      Shift_Left  => Shift_Left_38,
      Shift_Right => Shift_Right_38);

   package CRC_39bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC39_Type,
      Shift_Left  => Shift_Left_39,
      Shift_Right => Shift_Right_39);

   package CRC_40bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC40_Type,
      Shift_Left  => Shift_Left_40,
      Shift_Right => Shift_Right_40);

   package CRC_41bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC41_Type,
      Shift_Left  => Shift_Left_41,
      Shift_Right => Shift_Right_41);

   package CRC_42bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC42_Type,
      Shift_Left  => Shift_Left_42,
      Shift_Right => Shift_Right_42);

   package CRC_43bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC43_Type,
      Shift_Left  => Shift_Left_43,
      Shift_Right => Shift_Right_43);

   package CRC_44bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC44_Type,
      Shift_Left  => Shift_Left_44,
      Shift_Right => Shift_Right_44);

   package CRC_45bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC45_Type,
      Shift_Left  => Shift_Left_45,
      Shift_Right => Shift_Right_45);

   package CRC_46bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC46_Type,
      Shift_Left  => Shift_Left_46,
      Shift_Right => Shift_Right_46);

   package CRC_47bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC47_Type,
      Shift_Left  => Shift_Left_47,
      Shift_Right => Shift_Right_47);

   package CRC_48bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC48_Type,
      Shift_Left  => Shift_Left_48,
      Shift_Right => Shift_Right_48);

   package CRC_49bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC49_Type,
      Shift_Left  => Shift_Left_49,
      Shift_Right => Shift_Right_49);

   package CRC_50bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC50_Type,
      Shift_Left  => Shift_Left_50,
      Shift_Right => Shift_Right_50);

   package CRC_51bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC51_Type,
      Shift_Left  => Shift_Left_51,
      Shift_Right => Shift_Right_51);

   package CRC_52bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC52_Type,
      Shift_Left  => Shift_Left_52,
      Shift_Right => Shift_Right_52);

   package CRC_53bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC53_Type,
      Shift_Left  => Shift_Left_53,
      Shift_Right => Shift_Right_53);

   package CRC_54bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC54_Type,
      Shift_Left  => Shift_Left_54,
      Shift_Right => Shift_Right_54);

   package CRC_55bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC55_Type,
      Shift_Left  => Shift_Left_55,
      Shift_Right => Shift_Right_55);

   package CRC_56bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC56_Type,
      Shift_Left  => Shift_Left_56,
      Shift_Right => Shift_Right_56);

   package CRC_57bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC57_Type,
      Shift_Left  => Shift_Left_57,
      Shift_Right => Shift_Right_57);

   package CRC_58bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC58_Type,
      Shift_Left  => Shift_Left_58,
      Shift_Right => Shift_Right_58);

   package CRC_59bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC59_Type,
      Shift_Left  => Shift_Left_59,
      Shift_Right => Shift_Right_59);

   package CRC_60bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC60_Type,
      Shift_Left  => Shift_Left_60,
      Shift_Right => Shift_Right_60);

   package CRC_61bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC61_Type,
      Shift_Left  => Shift_Left_61,
      Shift_Right => Shift_Right_61);

   package CRC_62bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC62_Type,
      Shift_Left  => Shift_Left_62,
      Shift_Right => Shift_Right_62);

   package CRC_63bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC63_Type,
      Shift_Left  => Shift_Left_63,
      Shift_Right => Shift_Right_63);

   --  Table generators for each CRC width

   procedure Put_8  is new Generic_Put_Table (CRC8_Type,  LibCRC.CRC_8bit);
   procedure Put_9  is new Generic_Put_Table (CRC9_Type,  CRC_9bit);
   procedure Put_10 is new Generic_Put_Table (CRC10_Type, CRC_10bit);
   procedure Put_11 is new Generic_Put_Table (CRC11_Type, CRC_11bit);
   procedure Put_12 is new Generic_Put_Table (CRC12_Type, CRC_12bit);
   procedure Put_13 is new Generic_Put_Table (CRC13_Type, CRC_13bit);
   procedure Put_14 is new Generic_Put_Table (CRC14_Type, CRC_14bit);
   procedure Put_15 is new Generic_Put_Table (CRC15_Type, CRC_15bit);
   procedure Put_16 is new Generic_Put_Table (CRC16_Type, LibCRC.CRC_16bit);
   procedure Put_17 is new Generic_Put_Table (CRC17_Type, CRC_17bit);
   procedure Put_18 is new Generic_Put_Table (CRC18_Type, CRC_18bit);
   procedure Put_19 is new Generic_Put_Table (CRC19_Type, CRC_19bit);
   procedure Put_20 is new Generic_Put_Table (CRC20_Type, CRC_20bit);
   procedure Put_21 is new Generic_Put_Table (CRC21_Type, CRC_21bit);
   procedure Put_22 is new Generic_Put_Table (CRC22_Type, CRC_22bit);
   procedure Put_23 is new Generic_Put_Table (CRC23_Type, CRC_23bit);
   procedure Put_24 is new Generic_Put_Table (CRC24_Type, LibCRC.CRC_24bit);
   procedure Put_25 is new Generic_Put_Table (CRC25_Type, CRC_25bit);
   procedure Put_26 is new Generic_Put_Table (CRC26_Type, CRC_26bit);
   procedure Put_27 is new Generic_Put_Table (CRC27_Type, CRC_27bit);
   procedure Put_28 is new Generic_Put_Table (CRC28_Type, CRC_28bit);
   procedure Put_29 is new Generic_Put_Table (CRC29_Type, CRC_29bit);
   procedure Put_30 is new Generic_Put_Table (CRC30_Type, CRC_30bit);
   procedure Put_31 is new Generic_Put_Table (CRC31_Type, CRC_31bit);
   procedure Put_32 is new Generic_Put_Table (CRC32_Type, LibCRC.CRC_32bit);
   procedure Put_33 is new Generic_Put_Table (CRC33_Type, CRC_33bit);
   procedure Put_34 is new Generic_Put_Table (CRC34_Type, CRC_34bit);
   procedure Put_35 is new Generic_Put_Table (CRC35_Type, CRC_35bit);
   procedure Put_36 is new Generic_Put_Table (CRC36_Type, CRC_36bit);
   procedure Put_37 is new Generic_Put_Table (CRC37_Type, CRC_37bit);
   procedure Put_38 is new Generic_Put_Table (CRC38_Type, CRC_38bit);
   procedure Put_39 is new Generic_Put_Table (CRC39_Type, CRC_39bit);
   procedure Put_40 is new Generic_Put_Table (CRC40_Type, CRC_40bit);
   procedure Put_41 is new Generic_Put_Table (CRC41_Type, CRC_41bit);
   procedure Put_42 is new Generic_Put_Table (CRC42_Type, CRC_42bit);
   procedure Put_43 is new Generic_Put_Table (CRC43_Type, CRC_43bit);
   procedure Put_44 is new Generic_Put_Table (CRC44_Type, CRC_44bit);
   procedure Put_45 is new Generic_Put_Table (CRC45_Type, CRC_45bit);
   procedure Put_46 is new Generic_Put_Table (CRC46_Type, CRC_46bit);
   procedure Put_47 is new Generic_Put_Table (CRC47_Type, CRC_47bit);
   procedure Put_48 is new Generic_Put_Table (CRC48_Type, CRC_48bit);
   procedure Put_49 is new Generic_Put_Table (CRC49_Type, CRC_49bit);
   procedure Put_50 is new Generic_Put_Table (CRC50_Type, CRC_50bit);
   procedure Put_51 is new Generic_Put_Table (CRC51_Type, CRC_51bit);
   procedure Put_52 is new Generic_Put_Table (CRC52_Type, CRC_52bit);
   procedure Put_53 is new Generic_Put_Table (CRC53_Type, CRC_53bit);
   procedure Put_54 is new Generic_Put_Table (CRC54_Type, CRC_54bit);
   procedure Put_55 is new Generic_Put_Table (CRC55_Type, CRC_55bit);
   procedure Put_56 is new Generic_Put_Table (CRC56_Type, CRC_56bit);
   procedure Put_57 is new Generic_Put_Table (CRC57_Type, CRC_57bit);
   procedure Put_58 is new Generic_Put_Table (CRC58_Type, CRC_58bit);
   procedure Put_59 is new Generic_Put_Table (CRC59_Type, CRC_59bit);
   procedure Put_60 is new Generic_Put_Table (CRC60_Type, CRC_60bit);
   procedure Put_61 is new Generic_Put_Table (CRC61_Type, CRC_61bit);
   procedure Put_62 is new Generic_Put_Table (CRC62_Type, CRC_62bit);
   procedure Put_63 is new Generic_Put_Table (CRC63_Type, CRC_63bit);
   procedure Put_64 is new Generic_Put_Table (CRC64_Type, LibCRC.CRC_64bit);

   --  Begin processing for Crctablegen

   Reflected : Boolean := False;

begin
   if Ada.Command_Line.Argument_Count not in 2 .. 3 then
      Put_Line (Standard_Error,
                "usage: crctablegen <bits> <polynomial> [reflected]");
      Ada.Command_Line.Set_Exit_Status (1);
      return;
   end if;

   if Ada.Command_Line.Argument_Count >= 3 then
      if Ada.Command_Line.Argument (3) /= "reflected" then
         Put_Line (Standard_Error, "argument 3 should be ""reflected""");
         Ada.Command_Line.Set_Exit_Status (1);
         return;
      end if;

      Reflected := True;
   end if;

   declare
      Width : constant Natural :=
                Natural'Value (Ada.Command_Line.Argument (1));
      Polynomial_Arg : String renames Ada.Command_Line.Argument (2);

   begin
      case Width is
         when 8  => Put_8  (CRC8_Type'Value  (Polynomial_Arg), Reflected);
         when 9  => Put_9  (CRC9_Type'Value  (Polynomial_Arg), Reflected);
         when 10 => Put_10 (CRC10_Type'Value (Polynomial_Arg), Reflected);
         when 11 => Put_11 (CRC11_Type'Value (Polynomial_Arg), Reflected);
         when 12 => Put_12 (CRC12_Type'Value (Polynomial_Arg), Reflected);
         when 13 => Put_13 (CRC13_Type'Value (Polynomial_Arg), Reflected);
         when 14 => Put_14 (CRC14_Type'Value (Polynomial_Arg), Reflected);
         when 15 => Put_15 (CRC15_Type'Value (Polynomial_Arg), Reflected);
         when 16 => Put_16 (CRC16_Type'Value (Polynomial_Arg), Reflected);
         when 17 => Put_17 (CRC17_Type'Value (Polynomial_Arg), Reflected);
         when 18 => Put_18 (CRC18_Type'Value (Polynomial_Arg), Reflected);
         when 19 => Put_19 (CRC19_Type'Value (Polynomial_Arg), Reflected);
         when 20 => Put_20 (CRC20_Type'Value (Polynomial_Arg), Reflected);
         when 21 => Put_21 (CRC21_Type'Value (Polynomial_Arg), Reflected);
         when 22 => Put_22 (CRC22_Type'Value (Polynomial_Arg), Reflected);
         when 23 => Put_23 (CRC23_Type'Value (Polynomial_Arg), Reflected);
         when 24 => Put_24 (CRC24_Type'Value (Polynomial_Arg), Reflected);
         when 25 => Put_25 (CRC25_Type'Value (Polynomial_Arg), Reflected);
         when 26 => Put_26 (CRC26_Type'Value (Polynomial_Arg), Reflected);
         when 27 => Put_27 (CRC27_Type'Value (Polynomial_Arg), Reflected);
         when 28 => Put_28 (CRC28_Type'Value (Polynomial_Arg), Reflected);
         when 29 => Put_29 (CRC29_Type'Value (Polynomial_Arg), Reflected);
         when 30 => Put_30 (CRC30_Type'Value (Polynomial_Arg), Reflected);
         when 31 => Put_31 (CRC31_Type'Value (Polynomial_Arg), Reflected);
         when 32 => Put_32 (CRC32_Type'Value (Polynomial_Arg), Reflected);
         when 33 => Put_33 (CRC33_Type'Value (Polynomial_Arg), Reflected);
         when 34 => Put_34 (CRC34_Type'Value (Polynomial_Arg), Reflected);
         when 35 => Put_35 (CRC35_Type'Value (Polynomial_Arg), Reflected);
         when 36 => Put_36 (CRC36_Type'Value (Polynomial_Arg), Reflected);
         when 37 => Put_37 (CRC37_Type'Value (Polynomial_Arg), Reflected);
         when 38 => Put_38 (CRC38_Type'Value (Polynomial_Arg), Reflected);
         when 39 => Put_39 (CRC39_Type'Value (Polynomial_Arg), Reflected);
         when 40 => Put_40 (CRC40_Type'Value (Polynomial_Arg), Reflected);
         when 41 => Put_41 (CRC41_Type'Value (Polynomial_Arg), Reflected);
         when 42 => Put_42 (CRC42_Type'Value (Polynomial_Arg), Reflected);
         when 43 => Put_43 (CRC43_Type'Value (Polynomial_Arg), Reflected);
         when 44 => Put_44 (CRC44_Type'Value (Polynomial_Arg), Reflected);
         when 45 => Put_45 (CRC45_Type'Value (Polynomial_Arg), Reflected);
         when 46 => Put_46 (CRC46_Type'Value (Polynomial_Arg), Reflected);
         when 47 => Put_47 (CRC47_Type'Value (Polynomial_Arg), Reflected);
         when 48 => Put_48 (CRC48_Type'Value (Polynomial_Arg), Reflected);
         when 49 => Put_49 (CRC49_Type'Value (Polynomial_Arg), Reflected);
         when 50 => Put_50 (CRC50_Type'Value (Polynomial_Arg), Reflected);
         when 51 => Put_51 (CRC51_Type'Value (Polynomial_Arg), Reflected);
         when 52 => Put_52 (CRC52_Type'Value (Polynomial_Arg), Reflected);
         when 53 => Put_53 (CRC53_Type'Value (Polynomial_Arg), Reflected);
         when 54 => Put_54 (CRC54_Type'Value (Polynomial_Arg), Reflected);
         when 55 => Put_55 (CRC55_Type'Value (Polynomial_Arg), Reflected);
         when 56 => Put_56 (CRC56_Type'Value (Polynomial_Arg), Reflected);
         when 57 => Put_57 (CRC57_Type'Value (Polynomial_Arg), Reflected);
         when 58 => Put_58 (CRC58_Type'Value (Polynomial_Arg), Reflected);
         when 59 => Put_59 (CRC59_Type'Value (Polynomial_Arg), Reflected);
         when 60 => Put_60 (CRC60_Type'Value (Polynomial_Arg), Reflected);
         when 61 => Put_61 (CRC61_Type'Value (Polynomial_Arg), Reflected);
         when 62 => Put_62 (CRC62_Type'Value (Polynomial_Arg), Reflected);
         when 63 => Put_63 (CRC63_Type'Value (Polynomial_Arg), Reflected);
         when 64 => Put_64 (CRC64_Type'Value (Polynomial_Arg), Reflected);

         when others =>
            Put_Line (Standard_Error, "Unsupported CRC width:" & Width'Image);
            Ada.Command_Line.Set_Exit_Status (1);
            return;
      end case;
   end;
end Crctablegen;
