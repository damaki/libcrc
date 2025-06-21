--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
with Ada.Unchecked_Deallocation;
with Ada.Text_IO;        use Ada.Text_IO;
with Ada.Streams.Stream_IO;
with Ada.Streams.Stream_IO.C_Streams;
with Interfaces.C_Streams; use Interfaces.C_Streams;

with Support.Stream_Byte_Arrays;

package body Generic_CRC_Driver is

   Max_Buffer_Size : constant := 128 * 1024 * 1024;

   type Byte_Array_Access is access LibCRC.Byte_Array;

   procedure Free is new Ada.Unchecked_Deallocation
     (LibCRC.Byte_Array, Byte_Array_Access);

   package CRC_IO is new Ada.Text_IO.Modular_IO (CRC_Type);

   -------------------
   -- Process_Stdin --
   -------------------

   procedure Process_Stdin (Algo : CRC_Info) is
      File   : Ada.Streams.Stream_IO.File_Type;
      Buffer : Byte_Array_Access :=
                 new LibCRC.Byte_Array (1 .. Max_Buffer_Size);
      Length : Natural;
      Pos    : Natural := Buffer'First;
      CRC    : CRC_Type;

   begin
      Ada.Streams.Stream_IO.C_Streams.Open
        (File     => File,
         Mode     => Ada.Streams.Stream_IO.In_File,
         C_Stream => Interfaces.C_Streams.stdin);

      set_binary_mode
        (fileno (Ada.Streams.Stream_IO.C_Streams.C_Stream (File)));

      loop
         Support.Stream_Byte_Arrays.Read_Byte_Array
         (Stream => Ada.Streams.Stream_IO.Stream (File).all,
            Item   => Buffer (Pos .. Buffer'Last),
            Length => Length);

         exit when Length = 0;

         Pos := Pos + Length;

         exit when Pos > Buffer'Last;
      end loop;

      if Pos > Buffer'Last then
         raise Constraint_Error with "Maximum buffer size reached";
      end if;

      Put_Line (To_String (Algo.Name));

      CRC := Algo.ROM_Func (Buffer (1 .. Pos - 1));
      CRC_IO.Put (CRC, Base => 16);
      New_Line;

      CRC := Algo.RAM_Func (Buffer (1 .. Pos - 1));
      CRC_IO.Put (CRC, Base => 16);
      New_Line;

      CRC := Algo.Bitwise_Func (Buffer (1 .. Pos - 1));
      CRC_IO.Put (CRC, Base => 16);
      New_Line;

      Free (Buffer);

   exception
      when others =>
         Free (Buffer);
         raise;
   end Process_Stdin;

end Generic_CRC_Driver;