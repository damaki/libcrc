--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
with Interfaces;       use Interfaces;
with AUnit.Assertions; use AUnit.Assertions;

with LibCRC;

package body Generic_CRC_Tests is

   Check_Data : constant LibCRC.Byte_Array (1 .. 9) :=
     (Character'Pos ('1'),
      Character'Pos ('2'),
      Character'Pos ('3'),
      Character'Pos ('4'),
      Character'Pos ('5'),
      Character'Pos ('6'),
      Character'Pos ('7'),
      Character'Pos ('8'),
      Character'Pos ('9'));

   -------------------
   -- Test_Byte_CRC --
   -------------------

   --  This test checks all CRC implementations produce the same CRC for all
   --  possible single-byte messages.

   procedure Test_Byte_CRC (T : in out Test_Fixture) is
      C1 : ROM_Table_CRC.Context;
      C2 : RAM_Table_CRC.Context;
      C3 : Bitwise_CRC.Context;

      CRC_1 : CRC_Type;
      CRC_2 : CRC_Type;
      CRC_3 : CRC_Type;

   begin
      for Byte in Unsigned_8'Range loop
         ROM_Table_CRC.Reset (C1);
         ROM_Table_CRC.Update (C1, LibCRC.Byte_Array'(1 => Byte));
         CRC_1 := ROM_Table_CRC.Get_CRC (C1);

         RAM_Table_CRC.Reset (C2);
         RAM_Table_CRC.Update (C2, LibCRC.Byte_Array'(1 => Byte));
         CRC_2 := RAM_Table_CRC.Get_CRC (C2);

         Bitwise_CRC.Reset (C3);
         Bitwise_CRC.Update (C3, LibCRC.Byte_Array'(1 => Byte));
         CRC_3 := Bitwise_CRC.Get_CRC (C3);

         Assert (CRC_1 = CRC_2,
                 "CRC mismatch for byte (ROM vs RAM tables)" & Byte'Image
                   & ": " & CRC_1'Image & " !=" & CRC_2'Image);

         Assert (CRC_1 = CRC_3,
                 "CRC mismatch for byte (ROM tables vs bitwise)" & Byte'Image
                   & ": " & CRC_1'Image & " !=" & CRC_3'Image);
      end loop;
   end Test_Byte_CRC;

   ------------------------
   -- Test_Short_Message --
   ------------------------

   --  This test checks the Fixed and Runtime table implementations produce the
   --  same CRC for a short 12-byte message.

   procedure Test_Short_Message (T : in out Test_Fixture) is
      Message : constant LibCRC.Byte_Array :=
        (0, 1, 2, 3, 4, 5, 250, 251, 252, 253, 254, 255);

      C1 : ROM_Table_CRC.Context;
      C2 : RAM_Table_CRC.Context;
      C3 : Bitwise_CRC.Context;

      CRC_1 : CRC_Type;
      CRC_2 : CRC_Type;
      CRC_3 : CRC_Type;

   begin
      ROM_Table_CRC.Reset (C1);
      ROM_Table_CRC.Update (C1, Message);
      CRC_1 := ROM_Table_CRC.Get_CRC (C1);

      RAM_Table_CRC.Reset (C2);
      RAM_Table_CRC.Update (C2, Message);
      CRC_2 := RAM_Table_CRC.Get_CRC (C2);

      Bitwise_CRC.Reset (C3);
      Bitwise_CRC.Update (C3, Message);
      CRC_3 := Bitwise_CRC.Get_CRC (C3);

      Assert (CRC_1 = CRC_2,
              "CRC mismatch (ROM vs RAM tables): "
                & CRC_1'Image & " !=" & CRC_2'Image);

      Assert (CRC_1 = CRC_3,
              "CRC mismatch (ROM tables vs bitwise): "
                & CRC_1'Image & " !=" & CRC_3'Image);
   end Test_Short_Message;

   ------------------------
   -- Test_Short_Zeroes --
   ------------------------

   --  This test checks the Fixed and Runtime table implementations produce the
   --  same CRC for a short 12-byte consisting of all zeroes.

   procedure Test_Short_Zeroes (T : in out Test_Fixture) is
      Zeroes : constant LibCRC.Byte_Array (1 .. 12) := (others => 0);

      C1 : ROM_Table_CRC.Context;
      C2 : RAM_Table_CRC.Context;
      C3 : Bitwise_CRC.Context;

      CRC_1 : CRC_Type;
      CRC_2 : CRC_Type;
      CRC_3 : CRC_Type;

   begin
      ROM_Table_CRC.Reset (C1);
      ROM_Table_CRC.Update (C1, Zeroes);
      CRC_1 := ROM_Table_CRC.Get_CRC (C1);

      RAM_Table_CRC.Reset (C2);
      RAM_Table_CRC.Update (C2, Zeroes);
      CRC_2 := RAM_Table_CRC.Get_CRC (C2);

      Bitwise_CRC.Reset (C3);
      Bitwise_CRC.Update (C3, Zeroes);
      CRC_3 := Bitwise_CRC.Get_CRC (C3);

      Assert (CRC_1 = CRC_2,
              "CRC mismatch ROM vs RAM tables: " &
                CRC_1'Image & " !=" & CRC_2'Image);

      Assert (CRC_1 = CRC_3,
              "CRC mismatch ROM tables vs bitwise: " &
                CRC_1'Image & " !=" & CRC_3'Image);
   end Test_Short_Zeroes;

   --------------------------
   -- Test_Check_Value_ROM --
   --------------------------

   procedure Test_Check_Value_ROM (T : in out Test_Fixture) is
      CRC : CRC_Type;
   begin
      CRC := ROM_Table_CRC.Calculate (Check_Data);
      Assert (CRC = Check_Value,
              "CRC mismatch: " &
                CRC'Image & " !=" & Check_Value'Image);
   end Test_Check_Value_ROM;

   --------------------------
   -- Test_Check_Value_RAM --
   --------------------------

   procedure Test_Check_Value_RAM (T : in out Test_Fixture) is
      CRC : CRC_Type;
   begin
      CRC := RAM_Table_CRC.Calculate (Check_Data);
      Assert (CRC = Check_Value,
              "CRC mismatch: " &
                CRC'Image & " !=" & Check_Value'Image);
   end Test_Check_Value_RAM;

   ------------------------------
   -- Test_Check_Value_Bitwise --
   ------------------------------

   procedure Test_Check_Value_Bitwise (T : in out Test_Fixture) is
      CRC : CRC_Type;
   begin
      CRC := Bitwise_CRC.Calculate (Check_Data);
      Assert (CRC = Check_Value,
              "CRC mismatch: " &
                CRC'Image & " !=" & Check_Value'Image);
   end Test_Check_Value_Bitwise;

   ------------------
   -- Add_To_Suite --
   ------------------

   procedure Add_To_Suite (S : in out Test_Suite'Class) is
   begin
      S.Add_Test (Caller.Create (Name & " ROM vs RAM vs bitwise (1 byte)",
                                 Test_Byte_CRC'Access));
      S.Add_Test (Caller.Create (Name & " ROM vs RAM vs bitwise (short msg)",
                                 Test_Short_Message'Access));
      S.Add_Test (Caller.Create (Name & " ROM vs RAM vs bitwise (zeroes)",
                                 Test_Short_Zeroes'Access));
      S.Add_Test (Caller.Create (Name & " check value (ROM tables)",
                                 Test_Check_Value_ROM'Access));
      S.Add_Test (Caller.Create (Name & " check value (RAM tables)",
                                 Test_Check_Value_RAM'Access));
      S.Add_Test (Caller.Create (Name & " check value (Bitwise)",
                                 Test_Check_Value_Bitwise'Access));
   end Add_To_Suite;

end Generic_CRC_Tests;