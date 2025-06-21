--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
package Generic_Shift_Ops with
  Pure,
  SPARK_Mode,
  Always_Terminates
is

   generic
      type Word_Type is mod <>;
      type Wide_Word_Type is mod <>;

      with function Shift_Left
             (Value  : Wide_Word_Type;
              Amount : Natural)
              return Wide_Word_Type;
   function Generic_Shift_Left
     (Value  : Word_Type;
      Amount : Natural)
      return Word_Type;
   --  Implement Shift_Left in terms of a wider type. For example, to shift
   --  a 4-bit type by doing an intermediate conversion to a wider 8-bit type,
   --  for which a Shift_Left function is already defined.

   generic
      type Word_Type is mod <>;
      type Wide_Word_Type is mod <>;

      with function Shift_Right
             (Value  : Wide_Word_Type;
              Amount : Natural)
              return Wide_Word_Type;
   function Generic_Shift_Right
     (Value  : Word_Type;
      Amount : Natural)
      return Word_Type;
   --  Implement Shift_Right in terms of a wider type. For example, to shift
   --  a 4-bit type by doing an intermediate conversion to a wider 8-bit type,
   --  for which a Shift_Right function is already defined.

end Generic_Shift_Ops;