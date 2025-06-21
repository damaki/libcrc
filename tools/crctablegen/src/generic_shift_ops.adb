--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
package body Generic_Shift_Ops with
  SPARK_Mode
is

   ------------------------
   -- Generic_Shift_Left --
   ------------------------

   function Generic_Shift_Left
     (Value  : Word_Type;
      Amount : Natural)
      return Word_Type
   is
     (Word_Type (Shift_Left (Wide_Word_Type (Value), Amount) and
                   Wide_Word_Type (Word_Type'Last)));

   -------------------------
   -- Generic_Shift_Right --
   -------------------------

   function Generic_Shift_Right
     (Value  : Word_Type;
      Amount : Natural)
      return Word_Type
   is
     (Word_Type (Shift_Right (Wide_Word_Type (Value), Amount)));

end Generic_Shift_Ops;