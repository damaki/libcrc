--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
with Interfaces;

with LibCRC;
with LibCRC.CRC_8bit;
with LibCRC.CRC_16bit;
with LibCRC.CRC_24bit;
with LibCRC.CRC_32bit;
with LibCRC.CRC_64bit;
with LibCRC.Predefined_Constant_Tables;
with LibCRC.Predefined_Elaborated_Tables;

with Generic_CRC_Table_Tests;
with Reflection_Tests;

package body CRC_Table_Test_Suites
is

   package C renames LibCRC.Predefined_Constant_Tables;
   package E renames LibCRC.Predefined_Elaborated_Tables;

   --  8-bit tables

   package Table_8_Poly_2F_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_8_Poly_2F",
      CRC_Type      => Interfaces.Unsigned_8,
      Polynomial    => 16#2F#,
      CRC_Nbit      => LibCRC.CRC_8bit,
      ROM_Table     => C.Table_8_Poly_2F'Access,
      ROM_Table_Ref => C.Table_8_Poly_2F_Reflected'Access,
      RAM_Table     => E.Table_8_Poly_2F'Access,
      RAM_Table_Ref => E.Table_8_Poly_2F_Reflected'Access);

   package Table_8_Poly_A7_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_8_Poly_A7",
      CRC_Type      => Interfaces.Unsigned_8,
      Polynomial    => 16#A7#,
      CRC_Nbit      => LibCRC.CRC_8bit,
      ROM_Table     => C.Table_8_Poly_A7'Access,
      ROM_Table_Ref => C.Table_8_Poly_A7_Reflected'Access,
      RAM_Table     => E.Table_8_Poly_A7'Access,
      RAM_Table_Ref => E.Table_8_Poly_A7_Reflected'Access);

   package Table_8_Poly_39_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_8_Poly_39",
      CRC_Type      => Interfaces.Unsigned_8,
      Polynomial    => 16#39#,
      CRC_Nbit      => LibCRC.CRC_8bit,
      ROM_Table     => C.Table_8_Poly_39'Access,
      ROM_Table_Ref => C.Table_8_Poly_39_Reflected'Access,
      RAM_Table     => E.Table_8_Poly_39'Access,
      RAM_Table_Ref => E.Table_8_Poly_39_Reflected'Access);

   package Table_8_Poly_1D_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_8_Poly_1D",
      CRC_Type      => Interfaces.Unsigned_8,
      Polynomial    => 16#1D#,
      CRC_Nbit      => LibCRC.CRC_8bit,
      ROM_Table     => C.Table_8_Poly_1D'Access,
      ROM_Table_Ref => C.Table_8_Poly_1D_Reflected'Access,
      RAM_Table     => E.Table_8_Poly_1D'Access,
      RAM_Table_Ref => E.Table_8_Poly_1D_Reflected'Access);

   package Table_8_Poly_31_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_8_Poly_31",
      CRC_Type      => Interfaces.Unsigned_8,
      Polynomial    => 16#31#,
      CRC_Nbit      => LibCRC.CRC_8bit,
      ROM_Table     => C.Table_8_Poly_31'Access,
      ROM_Table_Ref => C.Table_8_Poly_31_Reflected'Access,
      RAM_Table     => E.Table_8_Poly_31'Access,
      RAM_Table_Ref => E.Table_8_Poly_31_Reflected'Access);

   package Table_8_Poly_07_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_8_Poly_07",
      CRC_Type      => Interfaces.Unsigned_8,
      Polynomial    => 16#07#,
      CRC_Nbit      => LibCRC.CRC_8bit,
      ROM_Table     => C.Table_8_Poly_07'Access,
      ROM_Table_Ref => C.Table_8_Poly_07_Reflected'Access,
      RAM_Table     => E.Table_8_Poly_07'Access,
      RAM_Table_Ref => E.Table_8_Poly_07_Reflected'Access);

   --  16-bit tables

   package Table_16_Poly_1021_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_16_Poly_1021",
      CRC_Type      => Interfaces.Unsigned_16,
      Polynomial    => 16#1021#,
      CRC_Nbit      => LibCRC.CRC_16bit,
      ROM_Table     => C.Table_16_Poly_1021'Access,
      ROM_Table_Ref => C.Table_16_Poly_1021_Reflected'Access,
      RAM_Table     => E.Table_16_Poly_1021'Access,
      RAM_Table_Ref => E.Table_16_Poly_1021_Reflected'Access);

   package Table_16_Poly_8005_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_16_Poly_8005",
      CRC_Type      => Interfaces.Unsigned_16,
      Polynomial    => 16#8005#,
      CRC_Nbit      => LibCRC.CRC_16bit,
      ROM_Table     => C.Table_16_Poly_8005'Access,
      ROM_Table_Ref => C.Table_16_Poly_8005_Reflected'Access,
      RAM_Table     => E.Table_16_Poly_8005'Access,
      RAM_Table_Ref => E.Table_16_Poly_8005_Reflected'Access);

   package Table_16_Poly_0589_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_16_Poly_0589",
      CRC_Type      => Interfaces.Unsigned_16,
      Polynomial    => 16#0589#,
      CRC_Nbit      => LibCRC.CRC_16bit,
      ROM_Table     => C.Table_16_Poly_0589'Access,
      ROM_Table_Ref => C.Table_16_Poly_0589_Reflected'Access,
      RAM_Table     => E.Table_16_Poly_0589'Access,
      RAM_Table_Ref => E.Table_16_Poly_0589_Reflected'Access);

   package Table_16_Poly_5935_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_16_Poly_5935",
      CRC_Type      => Interfaces.Unsigned_16,
      Polynomial    => 16#5935#,
      CRC_Nbit      => LibCRC.CRC_16bit,
      ROM_Table     => C.Table_16_Poly_5935'Access,
      ROM_Table_Ref => C.Table_16_Poly_5935_Reflected'Access,
      RAM_Table     => E.Table_16_Poly_5935'Access,
      RAM_Table_Ref => E.Table_16_Poly_5935_Reflected'Access);

   package Table_16_Poly_080B_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_16_Poly_080B",
      CRC_Type      => Interfaces.Unsigned_16,
      Polynomial    => 16#080B#,
      CRC_Nbit      => LibCRC.CRC_16bit,
      ROM_Table     => C.Table_16_Poly_080B'Access,
      ROM_Table_Ref => C.Table_16_Poly_080B_Reflected'Access,
      RAM_Table     => E.Table_16_Poly_080B'Access,
      RAM_Table_Ref => E.Table_16_Poly_080B_Reflected'Access);

   package Table_16_Poly_755B_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_16_Poly_755B",
      CRC_Type      => Interfaces.Unsigned_16,
      Polynomial    => 16#755B#,
      CRC_Nbit      => LibCRC.CRC_16bit,
      ROM_Table     => C.Table_16_Poly_755B'Access,
      ROM_Table_Ref => C.Table_16_Poly_755B_Reflected'Access,
      RAM_Table     => E.Table_16_Poly_755B'Access,
      RAM_Table_Ref => E.Table_16_Poly_755B_Reflected'Access);

   package Table_16_Poly_1DCF_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_16_Poly_1DCF",
      CRC_Type      => Interfaces.Unsigned_16,
      Polynomial    => 16#1DCF#,
      CRC_Nbit      => LibCRC.CRC_16bit,
      ROM_Table     => C.Table_16_Poly_1DCF'Access,
      ROM_Table_Ref => C.Table_16_Poly_1DCF_Reflected'Access,
      RAM_Table     => E.Table_16_Poly_1DCF'Access,
      RAM_Table_Ref => E.Table_16_Poly_1DCF_Reflected'Access);

   package Table_16_Poly_8BB7_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_16_Poly_8BB7",
      CRC_Type      => Interfaces.Unsigned_16,
      Polynomial    => 16#8BB7#,
      CRC_Nbit      => LibCRC.CRC_16bit,
      ROM_Table     => C.Table_16_Poly_8BB7'Access,
      ROM_Table_Ref => C.Table_16_Poly_8BB7_Reflected'Access,
      RAM_Table     => E.Table_16_Poly_8BB7'Access,
      RAM_Table_Ref => E.Table_16_Poly_8BB7_Reflected'Access);

   package Table_16_Poly_3D65_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_16_Poly_3D65",
      CRC_Type      => Interfaces.Unsigned_16,
      Polynomial    => 16#3D65#,
      CRC_Nbit      => LibCRC.CRC_16bit,
      ROM_Table     => C.Table_16_Poly_3D65'Access,
      ROM_Table_Ref => C.Table_16_Poly_3D65_Reflected'Access,
      RAM_Table     => E.Table_16_Poly_3D65'Access,
      RAM_Table_Ref => E.Table_16_Poly_3D65_Reflected'Access);

   package Table_16_Poly_A097_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_16_Poly_A097",
      CRC_Type      => Interfaces.Unsigned_16,
      Polynomial    => 16#A097#,
      CRC_Nbit      => LibCRC.CRC_16bit,
      ROM_Table     => C.Table_16_Poly_A097'Access,
      ROM_Table_Ref => C.Table_16_Poly_A097_Reflected'Access,
      RAM_Table     => E.Table_16_Poly_A097'Access,
      RAM_Table_Ref => E.Table_16_Poly_A097_Reflected'Access);

   --  24-bit tables

   package Table_24_Poly_00065B_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_24_Poly_00065B",
      CRC_Type      => LibCRC.Unsigned_24,
      Polynomial    => 16#00065B#,
      CRC_Nbit      => LibCRC.CRC_24bit,
      ROM_Table     => C.Table_24_Poly_00065B'Access,
      ROM_Table_Ref => C.Table_24_Poly_00065B_Reflected'Access,
      RAM_Table     => E.Table_24_Poly_00065B'Access,
      RAM_Table_Ref => E.Table_24_Poly_00065B_Reflected'Access);

   package Table_24_Poly_864CFB_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_24_Poly_864CFB",
      CRC_Type      => LibCRC.Unsigned_24,
      Polynomial    => 16#864CFB#,
      CRC_Nbit      => LibCRC.CRC_24bit,
      ROM_Table     => C.Table_24_Poly_864CFB'Access,
      ROM_Table_Ref => C.Table_24_Poly_864CFB_Reflected'Access,
      RAM_Table     => E.Table_24_Poly_864CFB'Access,
      RAM_Table_Ref => E.Table_24_Poly_864CFB_Reflected'Access);

   package Table_24_Poly_5D6DCB_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_24_Poly_5D6DCB",
      CRC_Type      => LibCRC.Unsigned_24,
      Polynomial    => 16#5D6DCB#,
      CRC_Nbit      => LibCRC.CRC_24bit,
      ROM_Table     => C.Table_24_Poly_5D6DCB'Access,
      ROM_Table_Ref => C.Table_24_Poly_5D6DCB_Reflected'Access,
      RAM_Table     => E.Table_24_Poly_5D6DCB'Access,
      RAM_Table_Ref => E.Table_24_Poly_5D6DCB_Reflected'Access);

   package Table_24_Poly_800063_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_24_Poly_800063",
      CRC_Type      => LibCRC.Unsigned_24,
      Polynomial    => 16#800063#,
      CRC_Nbit      => LibCRC.CRC_24bit,
      ROM_Table     => C.Table_24_Poly_800063'Access,
      ROM_Table_Ref => C.Table_24_Poly_800063_Reflected'Access,
      RAM_Table     => E.Table_24_Poly_800063'Access,
      RAM_Table_Ref => E.Table_24_Poly_800063_Reflected'Access);

   --  32-bit tables

   package Table_32_Poly_04C11DB7_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_32_Poly_04C11DB7",
      CRC_Type      => Interfaces.Unsigned_32,
      Polynomial    => 16#04C11DB7#,
      CRC_Nbit      => LibCRC.CRC_32bit,
      ROM_Table     => C.Table_32_Poly_04C11DB7'Access,
      ROM_Table_Ref => C.Table_32_Poly_04C11DB7_Reflected'Access,
      RAM_Table     => E.Table_32_Poly_04C11DB7'Access,
      RAM_Table_Ref => E.Table_32_Poly_04C11DB7_Reflected'Access);

   package Table_32_Poly_1EDC6F41_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_32_Poly_1EDC6F41",
      CRC_Type      => Interfaces.Unsigned_32,
      Polynomial    => 16#1EDC6F41#,
      CRC_Nbit      => LibCRC.CRC_32bit,
      ROM_Table     => C.Table_32_Poly_1EDC6F41'Access,
      ROM_Table_Ref => C.Table_32_Poly_1EDC6F41_Reflected'Access,
      RAM_Table     => E.Table_32_Poly_1EDC6F41'Access,
      RAM_Table_Ref => E.Table_32_Poly_1EDC6F41_Reflected'Access);

   package Table_32_Poly_741B8CD7_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_32_Poly_741B8CD7",
      CRC_Type      => Interfaces.Unsigned_32,
      Polynomial    => 16#741B8CD7#,
      CRC_Nbit      => LibCRC.CRC_32bit,
      ROM_Table     => C.Table_32_Poly_741B8CD7'Access,
      ROM_Table_Ref => C.Table_32_Poly_741B8CD7_Reflected'Access,
      RAM_Table     => E.Table_32_Poly_741B8CD7'Access,
      RAM_Table_Ref => E.Table_32_Poly_741B8CD7_Reflected'Access);

   package Table_32_Poly_000000AF_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_32_Poly_000000AF",
      CRC_Type      => Interfaces.Unsigned_32,
      Polynomial    => 16#000000AF#,
      CRC_Nbit      => LibCRC.CRC_32bit,
      ROM_Table     => C.Table_32_Poly_000000AF'Access,
      ROM_Table_Ref => C.Table_32_Poly_000000AF_Reflected'Access,
      RAM_Table     => E.Table_32_Poly_000000AF'Access,
      RAM_Table_Ref => E.Table_32_Poly_000000AF_Reflected'Access);

   package Table_32_Poly_814141AB_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_32_Poly_814141AB",
      CRC_Type      => Interfaces.Unsigned_32,
      Polynomial    => 16#814141AB#,
      CRC_Nbit      => LibCRC.CRC_32bit,
      ROM_Table     => C.Table_32_Poly_814141AB'Access,
      ROM_Table_Ref => C.Table_32_Poly_814141AB_Reflected'Access,
      RAM_Table     => E.Table_32_Poly_814141AB'Access,
      RAM_Table_Ref => E.Table_32_Poly_814141AB_Reflected'Access);

   package Table_32_Poly_F4ACFB13_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_32_Poly_F4ACFB13",
      CRC_Type      => Interfaces.Unsigned_32,
      Polynomial    => 16#F4ACFB13#,
      CRC_Nbit      => LibCRC.CRC_32bit,
      ROM_Table     => C.Table_32_Poly_F4ACFB13'Access,
      ROM_Table_Ref => C.Table_32_Poly_F4ACFB13_Reflected'Access,
      RAM_Table     => E.Table_32_Poly_F4ACFB13'Access,
      RAM_Table_Ref => E.Table_32_Poly_F4ACFB13_Reflected'Access);

   package Table_32_Poly_A833982B_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_32_Poly_A833982B",
      CRC_Type      => Interfaces.Unsigned_32,
      Polynomial    => 16#A833982B#,
      CRC_Nbit      => LibCRC.CRC_32bit,
      ROM_Table     => C.Table_32_Poly_A833982B'Access,
      ROM_Table_Ref => C.Table_32_Poly_A833982B_Reflected'Access,
      RAM_Table     => E.Table_32_Poly_A833982B'Access,
      RAM_Table_Ref => E.Table_32_Poly_A833982B_Reflected'Access);

   --  64-bit tables

   package Table_64_Poly_000000000000001B_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_64_Poly_000000000000001B",
      CRC_Type      => Interfaces.Unsigned_64,
      Polynomial    => 16#000000000000001B#,
      CRC_Nbit      => LibCRC.CRC_64bit,
      ROM_Table     => C.Table_64_Poly_000000000000001B'Access,
      ROM_Table_Ref => C.Table_64_Poly_000000000000001B_Reflected'Access,
      RAM_Table     => E.Table_64_Poly_000000000000001B'Access,
      RAM_Table_Ref => E.Table_64_Poly_000000000000001B_Reflected'Access);

   package Table_64_Poly_42F0E1EBA9EA3693_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_64_Poly_42F0E1EBA9EA3693",
      CRC_Type      => Interfaces.Unsigned_64,
      Polynomial    => 16#42F0E1EBA9EA3693#,
      CRC_Nbit      => LibCRC.CRC_64bit,
      ROM_Table     => C.Table_64_Poly_42F0E1EBA9EA3693'Access,
      ROM_Table_Ref => C.Table_64_Poly_42F0E1EBA9EA3693_Reflected'Access,
      RAM_Table     => E.Table_64_Poly_42F0E1EBA9EA3693'Access,
      RAM_Table_Ref => E.Table_64_Poly_42F0E1EBA9EA3693_Reflected'Access);

   package Table_64_Poly_AD93D23594C935A9_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_64_Poly_AD93D23594C935A9",
      CRC_Type      => Interfaces.Unsigned_64,
      Polynomial    => 16#AD93D23594C935A9#,
      CRC_Nbit      => LibCRC.CRC_64bit,
      ROM_Table     => C.Table_64_Poly_AD93D23594C935A9'Access,
      ROM_Table_Ref => C.Table_64_Poly_AD93D23594C935A9_Reflected'Access,
      RAM_Table     => E.Table_64_Poly_AD93D23594C935A9'Access,
      RAM_Table_Ref => E.Table_64_Poly_AD93D23594C935A9_Reflected'Access);

   package Table_64_Poly_259C84CBA6426349_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_64_Poly_259C84CBA6426349",
      CRC_Type      => Interfaces.Unsigned_64,
      Polynomial    => 16#259C84CBA6426349#,
      CRC_Nbit      => LibCRC.CRC_64bit,
      ROM_Table     => C.Table_64_Poly_259C84CBA6426349'Access,
      ROM_Table_Ref => C.Table_64_Poly_259C84CBA6426349_Reflected'Access,
      RAM_Table     => E.Table_64_Poly_259C84CBA6426349'Access,
      RAM_Table_Ref => E.Table_64_Poly_259C84CBA6426349_Reflected'Access);

   package Table_64_Poly_AD93D23594C93659_Tests is new Generic_CRC_Table_Tests
     (Name          => "Table_64_Poly_AD93D23594C93659",
      CRC_Type      => Interfaces.Unsigned_64,
      Polynomial    => 16#AD93D23594C93659#,
      CRC_Nbit      => LibCRC.CRC_64bit,
      ROM_Table     => C.Table_64_Poly_AD93D23594C93659'Access,
      ROM_Table_Ref => C.Table_64_Poly_AD93D23594C93659_Reflected'Access,
      RAM_Table     => E.Table_64_Poly_AD93D23594C93659'Access,
      RAM_Table_Ref => E.Table_64_Poly_AD93D23594C93659_Reflected'Access);

   function Suite return Access_Test_Suite
   is
      S : constant Access_Test_Suite := new Test_Suite;
   begin
      Table_8_Poly_2F_Tests.Add_To_Suite (S.all);
      Table_8_Poly_A7_Tests.Add_To_Suite (S.all);
      Table_8_Poly_39_Tests.Add_To_Suite (S.all);
      Table_8_Poly_1D_Tests.Add_To_Suite (S.all);
      Table_8_Poly_31_Tests.Add_To_Suite (S.all);
      Table_8_Poly_07_Tests.Add_To_Suite (S.all);

      Table_16_Poly_1021_Tests.Add_To_Suite (S.all);
      Table_16_Poly_8005_Tests.Add_To_Suite (S.all);
      Table_16_Poly_0589_Tests.Add_To_Suite (S.all);
      Table_16_Poly_5935_Tests.Add_To_Suite (S.all);
      Table_16_Poly_080B_Tests.Add_To_Suite (S.all);
      Table_16_Poly_755B_Tests.Add_To_Suite (S.all);
      Table_16_Poly_1DCF_Tests.Add_To_Suite (S.all);
      Table_16_Poly_8BB7_Tests.Add_To_Suite (S.all);
      Table_16_Poly_3D65_Tests.Add_To_Suite (S.all);
      Table_16_Poly_A097_Tests.Add_To_Suite (S.all);

      Table_24_Poly_00065B_Tests.Add_To_Suite (S.all);
      Table_24_Poly_864CFB_Tests.Add_To_Suite (S.all);
      Table_24_Poly_5D6DCB_Tests.Add_To_Suite (S.all);
      Table_24_Poly_800063_Tests.Add_To_Suite (S.all);

      Table_32_Poly_04C11DB7_Tests.Add_To_Suite (S.all);
      Table_32_Poly_1EDC6F41_Tests.Add_To_Suite (S.all);
      Table_32_Poly_741B8CD7_Tests.Add_To_Suite (S.all);
      Table_32_Poly_000000AF_Tests.Add_To_Suite (S.all);
      Table_32_Poly_814141AB_Tests.Add_To_Suite (S.all);
      Table_32_Poly_F4ACFB13_Tests.Add_To_Suite (S.all);
      Table_32_Poly_A833982B_Tests.Add_To_Suite (S.all);

      Table_64_Poly_000000000000001B_Tests.Add_To_Suite (S.all);
      Table_64_Poly_42F0E1EBA9EA3693_Tests.Add_To_Suite (S.all);
      Table_64_Poly_AD93D23594C935A9_Tests.Add_To_Suite (S.all);
      Table_64_Poly_259C84CBA6426349_Tests.Add_To_Suite (S.all);
      Table_64_Poly_AD93D23594C93659_Tests.Add_To_Suite (S.all);

      Reflection_Tests.Add_To_Suite (S.all);

      return S;
   end Suite;

end CRC_Table_Test_Suites;