--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
with LibCRC.CRC_8bit;
with LibCRC.CRC_16bit;
with LibCRC.CRC_24bit;
with LibCRC.CRC_32bit;
with LibCRC.CRC_64bit;

--  This package provides CRC tables for some predefined polynomials.
--  The tables are generated at run-time during elaboration, so they are
--  always stored in RAM.
--
--  The table names are in the format Table_<bits>_Poly_<poly>[_Reflected]
--  where:
--   * <bits> is the size of the CRC in bits, e.g. 32 for a 32-bit CRC.
--   * <poly> is the CRC polynomial in hexadecimal with an implicit x^<bits>
--     term. The LSB is the +1 term. For example, the 8-bit polynomial 16#07#
--     (2#0000_0111#) represents the polynomial: x^8 + x^2 + x^1 + 1
--   * The _Reflected suffix is present when the CRC table is computed from the
--     reflected (bit reversed) polynomial. Such tables are more efficient when
--     used with CRC algorithms which use Reflect_Input = True.

package LibCRC.Predefined_Elaborated_Tables with
  SPARK_Mode,
  Always_Terminates
is

   --========================================================================--
   --                              8-bit Tables                              --
   --========================================================================--

   Table_8_Poly_2F : aliased constant CRC_8bit.CRC_Table_Type :=
     CRC_8bit.Generate_Table (Polynomial => 16#2F#);

   Table_8_Poly_2F_Reflected : aliased constant CRC_8bit.CRC_Table_Type :=
     CRC_8bit.Generate_Table_Reflected
       (Polynomial => CRC_8bit.Bit_Reverse_CRC (16#2F#));

   Table_8_Poly_A7 : aliased constant CRC_8bit.CRC_Table_Type :=
     CRC_8bit.Generate_Table (Polynomial => 16#A7#);

   Table_8_Poly_A7_Reflected : aliased constant CRC_8bit.CRC_Table_Type :=
     CRC_8bit.Generate_Table_Reflected
       (Polynomial => CRC_8bit.Bit_Reverse_CRC (16#A7#));

   Table_8_Poly_39 : aliased constant CRC_8bit.CRC_Table_Type :=
     CRC_8bit.Generate_Table (Polynomial => 16#39#);

   Table_8_Poly_39_Reflected : aliased constant CRC_8bit.CRC_Table_Type :=
     CRC_8bit.Generate_Table_Reflected
       (Polynomial => CRC_8bit.Bit_Reverse_CRC (16#39#));

   Table_8_Poly_1D : aliased constant CRC_8bit.CRC_Table_Type :=
     CRC_8bit.Generate_Table (Polynomial => 16#1D#);

   Table_8_Poly_1D_Reflected : aliased constant CRC_8bit.CRC_Table_Type :=
     CRC_8bit.Generate_Table_Reflected
       (Polynomial => CRC_8bit.Bit_Reverse_CRC (16#1D#));

   Table_8_Poly_31 : aliased constant CRC_8bit.CRC_Table_Type :=
     CRC_8bit.Generate_Table (Polynomial => 16#31#);

   Table_8_Poly_31_Reflected : aliased constant CRC_8bit.CRC_Table_Type :=
     CRC_8bit.Generate_Table_Reflected
       (Polynomial => CRC_8bit.Bit_Reverse_CRC (16#31#));

   Table_8_Poly_07 : aliased constant CRC_8bit.CRC_Table_Type :=
     CRC_8bit.Generate_Table (Polynomial => 16#07#);

   Table_8_Poly_07_Reflected : aliased constant CRC_8bit.CRC_Table_Type :=
     CRC_8bit.Generate_Table_Reflected
       (Polynomial => CRC_8bit.Bit_Reverse_CRC (16#07#));

   --========================================================================--
   --                              16-bit Tables                             --
   --========================================================================--

   Table_16_Poly_1021 : aliased constant CRC_16bit.CRC_Table_Type :=
     CRC_16bit.Generate_Table (Polynomial => 16#1021#);

   Table_16_Poly_1021_Reflected : aliased constant CRC_16bit.CRC_Table_Type :=
     CRC_16bit.Generate_Table_Reflected
       (Polynomial => CRC_16bit.Bit_Reverse_CRC (16#1021#));

   Table_16_Poly_8005 : aliased constant CRC_16bit.CRC_Table_Type :=
     CRC_16bit.Generate_Table (Polynomial => 16#8005#);

   Table_16_Poly_8005_Reflected : aliased constant CRC_16bit.CRC_Table_Type :=
     CRC_16bit.Generate_Table_Reflected
       (Polynomial => CRC_16bit.Bit_Reverse_CRC (16#8005#));

   Table_16_Poly_0589 : aliased constant CRC_16bit.CRC_Table_Type :=
     CRC_16bit.Generate_Table (Polynomial => 16#0589#);

   Table_16_Poly_0589_Reflected : aliased constant CRC_16bit.CRC_Table_Type :=
     CRC_16bit.Generate_Table_Reflected
       (Polynomial => CRC_16bit.Bit_Reverse_CRC (16#0589#));

   Table_16_Poly_5935 : aliased constant CRC_16bit.CRC_Table_Type :=
     CRC_16bit.Generate_Table (Polynomial => 16#5935#);

   Table_16_Poly_5935_Reflected : aliased constant CRC_16bit.CRC_Table_Type :=
     CRC_16bit.Generate_Table_Reflected
       (Polynomial => CRC_16bit.Bit_Reverse_CRC (16#5935#));

   Table_16_Poly_080B : aliased constant CRC_16bit.CRC_Table_Type :=
     CRC_16bit.Generate_Table (Polynomial => 16#080B#);

   Table_16_Poly_080B_Reflected : aliased constant CRC_16bit.CRC_Table_Type :=
     CRC_16bit.Generate_Table_Reflected
       (Polynomial => CRC_16bit.Bit_Reverse_CRC (16#080B#));

   Table_16_Poly_755B : aliased constant CRC_16bit.CRC_Table_Type :=
     CRC_16bit.Generate_Table (Polynomial => 16#755B#);

   Table_16_Poly_755B_Reflected : aliased constant CRC_16bit.CRC_Table_Type :=
     CRC_16bit.Generate_Table_Reflected
       (Polynomial => CRC_16bit.Bit_Reverse_CRC (16#755B#));

   Table_16_Poly_1DCF : aliased constant CRC_16bit.CRC_Table_Type :=
     CRC_16bit.Generate_Table (Polynomial => 16#1DCF#);

   Table_16_Poly_1DCF_Reflected : aliased constant CRC_16bit.CRC_Table_Type :=
     CRC_16bit.Generate_Table_Reflected
       (Polynomial => CRC_16bit.Bit_Reverse_CRC (16#1DCF#));

   Table_16_Poly_8BB7 : aliased constant CRC_16bit.CRC_Table_Type :=
     CRC_16bit.Generate_Table (Polynomial => 16#8BB7#);

   Table_16_Poly_8BB7_Reflected : aliased constant CRC_16bit.CRC_Table_Type :=
     CRC_16bit.Generate_Table_Reflected
       (Polynomial => CRC_16bit.Bit_Reverse_CRC (16#8BB7#));

   Table_16_Poly_3D65 : aliased constant CRC_16bit.CRC_Table_Type :=
     CRC_16bit.Generate_Table (Polynomial => 16#3D65#);

   Table_16_Poly_3D65_Reflected : aliased constant CRC_16bit.CRC_Table_Type :=
     CRC_16bit.Generate_Table_Reflected
       (Polynomial => CRC_16bit.Bit_Reverse_CRC (16#3D65#));

   Table_16_Poly_A097 : aliased constant CRC_16bit.CRC_Table_Type :=
     CRC_16bit.Generate_Table (Polynomial => 16#A097#);

   Table_16_Poly_A097_Reflected : aliased constant CRC_16bit.CRC_Table_Type :=
     CRC_16bit.Generate_Table_Reflected
       (Polynomial => CRC_16bit.Bit_Reverse_CRC (16#A097#));

   --========================================================================--
   --                              24-bit Tables                             --
   --========================================================================--

   Table_24_Poly_00065B : aliased constant CRC_24bit.CRC_Table_Type :=
     CRC_24bit.Generate_Table (Polynomial => 16#00065B#);

   Table_24_Poly_00065B_Reflected :
     aliased constant CRC_24bit.CRC_Table_Type :=
       CRC_24bit.Generate_Table_Reflected
         (Polynomial => CRC_24bit.Bit_Reverse_CRC (16#00065B#));

   Table_24_Poly_864CFB : aliased constant CRC_24bit.CRC_Table_Type :=
     CRC_24bit.Generate_Table (Polynomial => 16#864CFB#);

   Table_24_Poly_864CFB_Reflected :
     aliased constant CRC_24bit.CRC_Table_Type :=
       CRC_24bit.Generate_Table_Reflected
         (Polynomial => CRC_24bit.Bit_Reverse_CRC (16#864CFB#));

   Table_24_Poly_5D6DCB : aliased constant CRC_24bit.CRC_Table_Type :=
     CRC_24bit.Generate_Table (Polynomial => 16#5D6DCB#);

   Table_24_Poly_5D6DCB_Reflected :
     aliased constant CRC_24bit.CRC_Table_Type :=
       CRC_24bit.Generate_Table_Reflected
         (Polynomial => CRC_24bit.Bit_Reverse_CRC (16#5D6DCB#));

   Table_24_Poly_800063 : aliased constant CRC_24bit.CRC_Table_Type :=
     CRC_24bit.Generate_Table (Polynomial => 16#800063#);

   Table_24_Poly_800063_Reflected :
     aliased constant CRC_24bit.CRC_Table_Type :=
       CRC_24bit.Generate_Table_Reflected
         (Polynomial => CRC_24bit.Bit_Reverse_CRC (16#800063#));

   --========================================================================--
   --                              32-bit Tables                             --
   --========================================================================--

   Table_32_Poly_04C11DB7 : aliased constant CRC_32bit.CRC_Table_Type :=
     CRC_32bit.Generate_Table (Polynomial => 16#04C11DB7#);

   Table_32_Poly_04C11DB7_Reflected :
     aliased constant CRC_32bit.CRC_Table_Type :=
       CRC_32bit.Generate_Table_Reflected
         (Polynomial => CRC_32bit.Bit_Reverse_CRC (16#04C11DB7#));

   Table_32_Poly_1EDC6F41 : aliased constant CRC_32bit.CRC_Table_Type :=
     CRC_32bit.Generate_Table (Polynomial => 16#1EDC6F41#);

   Table_32_Poly_1EDC6F41_Reflected :
     aliased constant CRC_32bit.CRC_Table_Type :=
       CRC_32bit.Generate_Table_Reflected
         (Polynomial => CRC_32bit.Bit_Reverse_CRC (16#1EDC6F41#));

   Table_32_Poly_741B8CD7 : aliased constant CRC_32bit.CRC_Table_Type :=
     CRC_32bit.Generate_Table (Polynomial => 16#741B8CD7#);

   Table_32_Poly_741B8CD7_Reflected :
     aliased constant CRC_32bit.CRC_Table_Type :=
       CRC_32bit.Generate_Table_Reflected
         (Polynomial => CRC_32bit.Bit_Reverse_CRC (16#741B8CD7#));

   Table_32_Poly_000000AF : aliased constant CRC_32bit.CRC_Table_Type :=
     CRC_32bit.Generate_Table (Polynomial => 16#000000AF#);

   Table_32_Poly_000000AF_Reflected :
     aliased constant CRC_32bit.CRC_Table_Type :=
       CRC_32bit.Generate_Table_Reflected
         (Polynomial => CRC_32bit.Bit_Reverse_CRC (16#000000AF#));

   Table_32_Poly_814141AB : aliased constant CRC_32bit.CRC_Table_Type :=
     CRC_32bit.Generate_Table (Polynomial => 16#814141AB#);

   Table_32_Poly_814141AB_Reflected :
     aliased constant CRC_32bit.CRC_Table_Type :=
       CRC_32bit.Generate_Table_Reflected
         (Polynomial => CRC_32bit.Bit_Reverse_CRC (16#814141AB#));

   Table_32_Poly_F4ACFB13 : aliased constant CRC_32bit.CRC_Table_Type :=
     CRC_32bit.Generate_Table (Polynomial => 16#F4ACFB13#);

   Table_32_Poly_F4ACFB13_Reflected :
     aliased constant CRC_32bit.CRC_Table_Type :=
       CRC_32bit.Generate_Table_Reflected
         (Polynomial => CRC_32bit.Bit_Reverse_CRC (16#F4ACFB13#));

   Table_32_Poly_A833982B : aliased constant CRC_32bit.CRC_Table_Type :=
     CRC_32bit.Generate_Table (Polynomial => 16#A833982B#);

   Table_32_Poly_A833982B_Reflected :
     aliased constant CRC_32bit.CRC_Table_Type :=
       CRC_32bit.Generate_Table_Reflected
         (Polynomial => CRC_32bit.Bit_Reverse_CRC (16#A833982B#));

   --========================================================================--
   --                              64-bit Tables                             --
   --========================================================================--

   Table_64_Poly_000000000000001B :
     aliased constant CRC_64bit.CRC_Table_Type :=
       CRC_64bit.Generate_Table (Polynomial => 16#000000000000001B#);

   Table_64_Poly_000000000000001B_Reflected :
     aliased constant CRC_64bit.CRC_Table_Type :=
       CRC_64bit.Generate_Table_Reflected
         (Polynomial => CRC_64bit.Bit_Reverse_CRC (16#000000000000001B#));

   Table_64_Poly_42F0E1EBA9EA3693 :
     aliased constant CRC_64bit.CRC_Table_Type :=
       CRC_64bit.Generate_Table (Polynomial => 16#42F0E1EBA9EA3693#);

   Table_64_Poly_42F0E1EBA9EA3693_Reflected :
     aliased constant CRC_64bit.CRC_Table_Type :=
       CRC_64bit.Generate_Table_Reflected
         (Polynomial => CRC_64bit.Bit_Reverse_CRC (16#42F0E1EBA9EA3693#));

   Table_64_Poly_AD93D23594C935A9 :
     aliased constant CRC_64bit.CRC_Table_Type :=
       CRC_64bit.Generate_Table (Polynomial => 16#AD93D23594C935A9#);

   Table_64_Poly_AD93D23594C935A9_Reflected :
     aliased constant CRC_64bit.CRC_Table_Type :=
       CRC_64bit.Generate_Table_Reflected
         (Polynomial => CRC_64bit.Bit_Reverse_CRC (16#AD93D23594C935A9#));

   Table_64_Poly_259C84CBA6426349 :
     aliased constant CRC_64bit.CRC_Table_Type :=
       CRC_64bit.Generate_Table (Polynomial => 16#259C84CBA6426349#);

   Table_64_Poly_259C84CBA6426349_Reflected :
     aliased constant CRC_64bit.CRC_Table_Type :=
       CRC_64bit.Generate_Table_Reflected
         (Polynomial => CRC_64bit.Bit_Reverse_CRC (16#259C84CBA6426349#));

   Table_64_Poly_AD93D23594C93659 :
     aliased constant CRC_64bit.CRC_Table_Type :=
       CRC_64bit.Generate_Table (Polynomial => 16#AD93D23594C93659#);

   Table_64_Poly_AD93D23594C93659_Reflected :
     aliased constant CRC_64bit.CRC_Table_Type :=
       CRC_64bit.Generate_Table_Reflected
         (Polynomial => CRC_64bit.Bit_Reverse_CRC (16#AD93D23594C93659#));

end LibCRC.Predefined_Elaborated_Tables;