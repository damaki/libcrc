--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
with Interfaces;

with LibCRC;

with Generic_Shift_Ops; use Generic_Shift_Ops;

--  This package defines CRC types and shift operations for various CRC widths
--  that are not provided by LibCRC (e.g. 33-bit CRC type).

package Types with
  Pure,
  SPARK_Mode
is

   -------------------------------
   --  CRC types for each width --
   -------------------------------

   subtype CRC8_Type  is Interfaces.Unsigned_8;
   type    CRC9_Type  is mod 2**9  with Size => 9;
   type    CRC10_Type is mod 2**10 with Size => 10;
   type    CRC11_Type is mod 2**11 with Size => 11;
   type    CRC12_Type is mod 2**12 with Size => 12;
   type    CRC13_Type is mod 2**13 with Size => 13;
   type    CRC14_Type is mod 2**14 with Size => 14;
   type    CRC15_Type is mod 2**15 with Size => 15;
   subtype CRC16_Type is Interfaces.Unsigned_16;
   type    CRC17_Type is mod 2**17 with Size => 17;
   type    CRC18_Type is mod 2**18 with Size => 18;
   type    CRC19_Type is mod 2**19 with Size => 19;
   type    CRC20_Type is mod 2**20 with Size => 20;
   type    CRC21_Type is mod 2**21 with Size => 21;
   type    CRC22_Type is mod 2**22 with Size => 22;
   type    CRC23_Type is mod 2**23 with Size => 23;
   subtype CRC24_Type is LibCRC.Unsigned_24;
   type    CRC25_Type is mod 2**25 with Size => 25;
   type    CRC26_Type is mod 2**26 with Size => 26;
   type    CRC27_Type is mod 2**27 with Size => 27;
   type    CRC28_Type is mod 2**28 with Size => 28;
   type    CRC29_Type is mod 2**29 with Size => 29;
   type    CRC30_Type is mod 2**30 with Size => 30;
   type    CRC31_Type is mod 2**31 with Size => 31;
   subtype CRC32_Type is Interfaces.Unsigned_32;
   type    CRC33_Type is mod 2**33 with Size => 33;
   type    CRC34_Type is mod 2**34 with Size => 34;
   type    CRC35_Type is mod 2**35 with Size => 35;
   type    CRC36_Type is mod 2**36 with Size => 36;
   type    CRC37_Type is mod 2**37 with Size => 37;
   type    CRC38_Type is mod 2**38 with Size => 38;
   type    CRC39_Type is mod 2**39 with Size => 39;
   type    CRC40_Type is mod 2**40 with Size => 40;
   type    CRC41_Type is mod 2**41 with Size => 41;
   type    CRC42_Type is mod 2**42 with Size => 42;
   type    CRC43_Type is mod 2**43 with Size => 43;
   type    CRC44_Type is mod 2**44 with Size => 44;
   type    CRC45_Type is mod 2**45 with Size => 45;
   type    CRC46_Type is mod 2**46 with Size => 46;
   type    CRC47_Type is mod 2**47 with Size => 47;
   type    CRC48_Type is mod 2**48 with Size => 48;
   type    CRC49_Type is mod 2**49 with Size => 49;
   type    CRC50_Type is mod 2**50 with Size => 50;
   type    CRC51_Type is mod 2**51 with Size => 51;
   type    CRC52_Type is mod 2**52 with Size => 52;
   type    CRC53_Type is mod 2**53 with Size => 53;
   type    CRC54_Type is mod 2**54 with Size => 54;
   type    CRC55_Type is mod 2**55 with Size => 55;
   type    CRC56_Type is mod 2**56 with Size => 56;
   type    CRC57_Type is mod 2**57 with Size => 57;
   type    CRC58_Type is mod 2**58 with Size => 58;
   type    CRC59_Type is mod 2**59 with Size => 59;
   type    CRC60_Type is mod 2**60 with Size => 60;
   type    CRC61_Type is mod 2**61 with Size => 61;
   type    CRC62_Type is mod 2**62 with Size => 62;
   type    CRC63_Type is mod 2**63 with Size => 63;
   subtype CRC64_Type is Interfaces.Unsigned_64;

   --  Shift_Left operations for each non-multiple-of-8 type

   function Shift_Left_9 is new Generic_Shift_Left
     (CRC9_Type, CRC16_Type, Interfaces.Shift_Left);

   function Shift_Left_10 is new Generic_Shift_Left
     (CRC10_Type, CRC16_Type, Interfaces.Shift_Left);

   function Shift_Left_11 is new Generic_Shift_Left
     (CRC11_Type, CRC16_Type, Interfaces.Shift_Left);

   function Shift_Left_12 is new Generic_Shift_Left
     (CRC12_Type, CRC16_Type, Interfaces.Shift_Left);

   function Shift_Left_13 is new Generic_Shift_Left
     (CRC13_Type, CRC16_Type, Interfaces.Shift_Left);

   function Shift_Left_14 is new Generic_Shift_Left
     (CRC14_Type, CRC16_Type, Interfaces.Shift_Left);

   function Shift_Left_15 is new Generic_Shift_Left
     (CRC15_Type, CRC16_Type, Interfaces.Shift_Left);

   function Shift_Left_17 is new Generic_Shift_Left
     (CRC17_Type, CRC32_Type, Interfaces.Shift_Left);

   function Shift_Left_18 is new Generic_Shift_Left
     (CRC18_Type, CRC32_Type, Interfaces.Shift_Left);

   function Shift_Left_19 is new Generic_Shift_Left
     (CRC19_Type, CRC32_Type, Interfaces.Shift_Left);

   function Shift_Left_20 is new Generic_Shift_Left
     (CRC20_Type, CRC32_Type, Interfaces.Shift_Left);

   function Shift_Left_21 is new Generic_Shift_Left
     (CRC21_Type, CRC32_Type, Interfaces.Shift_Left);

   function Shift_Left_22 is new Generic_Shift_Left
     (CRC22_Type, CRC32_Type, Interfaces.Shift_Left);

   function Shift_Left_23 is new Generic_Shift_Left
     (CRC23_Type, CRC32_Type, Interfaces.Shift_Left);

   function Shift_Left_25 is new Generic_Shift_Left
     (CRC25_Type, CRC32_Type, Interfaces.Shift_Left);

   function Shift_Left_26 is new Generic_Shift_Left
     (CRC26_Type, CRC32_Type, Interfaces.Shift_Left);

   function Shift_Left_27 is new Generic_Shift_Left
     (CRC27_Type, CRC32_Type, Interfaces.Shift_Left);

   function Shift_Left_28 is new Generic_Shift_Left
     (CRC28_Type, CRC32_Type, Interfaces.Shift_Left);

   function Shift_Left_29 is new Generic_Shift_Left
     (CRC29_Type, CRC32_Type, Interfaces.Shift_Left);

   function Shift_Left_30 is new Generic_Shift_Left
     (CRC30_Type, CRC32_Type, Interfaces.Shift_Left);

   function Shift_Left_31 is new Generic_Shift_Left
     (CRC31_Type, CRC32_Type, Interfaces.Shift_Left);

   function Shift_Left_33 is new Generic_Shift_Left
     (CRC33_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_34 is new Generic_Shift_Left
     (CRC34_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_35 is new Generic_Shift_Left
     (CRC35_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_36 is new Generic_Shift_Left
     (CRC36_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_37 is new Generic_Shift_Left
     (CRC37_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_38 is new Generic_Shift_Left
     (CRC38_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_39 is new Generic_Shift_Left
     (CRC39_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_40 is new Generic_Shift_Left
     (CRC40_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_41 is new Generic_Shift_Left
     (CRC41_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_42 is new Generic_Shift_Left
     (CRC42_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_43 is new Generic_Shift_Left
     (CRC43_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_44 is new Generic_Shift_Left
     (CRC44_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_45 is new Generic_Shift_Left
     (CRC45_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_46 is new Generic_Shift_Left
     (CRC46_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_47 is new Generic_Shift_Left
     (CRC47_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_48 is new Generic_Shift_Left
     (CRC48_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_49 is new Generic_Shift_Left
     (CRC49_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_50 is new Generic_Shift_Left
     (CRC50_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_51 is new Generic_Shift_Left
     (CRC51_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_52 is new Generic_Shift_Left
     (CRC52_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_53 is new Generic_Shift_Left
     (CRC53_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_54 is new Generic_Shift_Left
     (CRC54_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_55 is new Generic_Shift_Left
     (CRC55_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_56 is new Generic_Shift_Left
     (CRC56_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_57 is new Generic_Shift_Left
     (CRC57_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_58 is new Generic_Shift_Left
     (CRC58_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_59 is new Generic_Shift_Left
     (CRC59_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_60 is new Generic_Shift_Left
     (CRC60_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_61 is new Generic_Shift_Left
     (CRC61_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_62 is new Generic_Shift_Left
     (CRC62_Type, CRC64_Type, Interfaces.Shift_Left);

   function Shift_Left_63 is new Generic_Shift_Left
     (CRC63_Type, CRC64_Type, Interfaces.Shift_Left);

   --  Shift_Right operations for each non-multiple-of-8 type

   function Shift_Right_9 is new Generic_Shift_Right
     (CRC9_Type, CRC16_Type, Interfaces.Shift_Right);

   function Shift_Right_10 is new Generic_Shift_Right
     (CRC10_Type, CRC16_Type, Interfaces.Shift_Right);

   function Shift_Right_11 is new Generic_Shift_Right
     (CRC11_Type, CRC16_Type, Interfaces.Shift_Right);

   function Shift_Right_12 is new Generic_Shift_Right
     (CRC12_Type, CRC16_Type, Interfaces.Shift_Right);

   function Shift_Right_13 is new Generic_Shift_Right
     (CRC13_Type, CRC16_Type, Interfaces.Shift_Right);

   function Shift_Right_14 is new Generic_Shift_Right
     (CRC14_Type, CRC16_Type, Interfaces.Shift_Right);

   function Shift_Right_15 is new Generic_Shift_Right
     (CRC15_Type, CRC16_Type, Interfaces.Shift_Right);

   function Shift_Right_17 is new Generic_Shift_Right
     (CRC17_Type, CRC32_Type, Interfaces.Shift_Right);

   function Shift_Right_18 is new Generic_Shift_Right
     (CRC18_Type, CRC32_Type, Interfaces.Shift_Right);

   function Shift_Right_19 is new Generic_Shift_Right
     (CRC19_Type, CRC32_Type, Interfaces.Shift_Right);

   function Shift_Right_20 is new Generic_Shift_Right
     (CRC20_Type, CRC32_Type, Interfaces.Shift_Right);

   function Shift_Right_21 is new Generic_Shift_Right
     (CRC21_Type, CRC32_Type, Interfaces.Shift_Right);

   function Shift_Right_22 is new Generic_Shift_Right
     (CRC22_Type, CRC32_Type, Interfaces.Shift_Right);

   function Shift_Right_23 is new Generic_Shift_Right
     (CRC23_Type, CRC32_Type, Interfaces.Shift_Right);

   function Shift_Right_25 is new Generic_Shift_Right
     (CRC25_Type, CRC32_Type, Interfaces.Shift_Right);

   function Shift_Right_26 is new Generic_Shift_Right
     (CRC26_Type, CRC32_Type, Interfaces.Shift_Right);

   function Shift_Right_27 is new Generic_Shift_Right
     (CRC27_Type, CRC32_Type, Interfaces.Shift_Right);

   function Shift_Right_28 is new Generic_Shift_Right
     (CRC28_Type, CRC32_Type, Interfaces.Shift_Right);

   function Shift_Right_29 is new Generic_Shift_Right
     (CRC29_Type, CRC32_Type, Interfaces.Shift_Right);

   function Shift_Right_30 is new Generic_Shift_Right
     (CRC30_Type, CRC32_Type, Interfaces.Shift_Right);

   function Shift_Right_31 is new Generic_Shift_Right
     (CRC31_Type, CRC32_Type, Interfaces.Shift_Right);

   function Shift_Right_33 is new Generic_Shift_Right
     (CRC33_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_34 is new Generic_Shift_Right
     (CRC34_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_35 is new Generic_Shift_Right
     (CRC35_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_36 is new Generic_Shift_Right
     (CRC36_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_37 is new Generic_Shift_Right
     (CRC37_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_38 is new Generic_Shift_Right
     (CRC38_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_39 is new Generic_Shift_Right
     (CRC39_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_40 is new Generic_Shift_Right
     (CRC40_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_41 is new Generic_Shift_Right
     (CRC41_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_42 is new Generic_Shift_Right
     (CRC42_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_43 is new Generic_Shift_Right
     (CRC43_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_44 is new Generic_Shift_Right
     (CRC44_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_45 is new Generic_Shift_Right
     (CRC45_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_46 is new Generic_Shift_Right
     (CRC46_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_47 is new Generic_Shift_Right
     (CRC47_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_48 is new Generic_Shift_Right
     (CRC48_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_49 is new Generic_Shift_Right
     (CRC49_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_50 is new Generic_Shift_Right
     (CRC50_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_51 is new Generic_Shift_Right
     (CRC51_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_52 is new Generic_Shift_Right
     (CRC52_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_53 is new Generic_Shift_Right
     (CRC53_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_54 is new Generic_Shift_Right
     (CRC54_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_55 is new Generic_Shift_Right
     (CRC55_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_56 is new Generic_Shift_Right
     (CRC56_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_57 is new Generic_Shift_Right
     (CRC57_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_58 is new Generic_Shift_Right
     (CRC58_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_59 is new Generic_Shift_Right
     (CRC59_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_60 is new Generic_Shift_Right
     (CRC60_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_61 is new Generic_Shift_Right
     (CRC61_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_62 is new Generic_Shift_Right
     (CRC62_Type, CRC64_Type, Interfaces.Shift_Right);

   function Shift_Right_63 is new Generic_Shift_Right
     (CRC63_Type, CRC64_Type, Interfaces.Shift_Right);

end Types;