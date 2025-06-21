# LibCRC

LibCRC is an Ada/SPARK library for computing Cyclic Redundancy Checks (CRC).
It supports any CRC with a size of at least 8 bits and provides several CRCs
with well-known[1] polynomials.

## Features

LibCRC is designed for resource-constrained environments, where ROM and/or RAM
may be limited.

The package `LibCRC.Predefined` provides a number of well-known CRC algorithms[1].

The implementations in package `LibCRC.Predefined` use ROM tables.
Alternate implementations are also provided to give a choice between different
trade offs, depending on your requirements:

| Method     | Package                        | ROM usage | RAM usage | Performance |
|------------|--------------------------------|-----------|-----------|-------------|
| ROM tables | `LibCRC.Predefined`            | High      | Low       | Fast        |
| RAM tables | `LibCRC.Predefined.RAM_Tables` | Low       | High      | Fast        |
| Bitwise    | `LibCRC.Predefined.Bitwise`    | Low       | Low       | Slow        |

## License

Apache-2.0

## Usage

Use Alire to add a dependency on libcrc to your project:

```sh
alr with libcrc
```

To calculate a CRC using one of the predefined algorithms (CRC-32 in this
example) over a single byte array:
```ada
with Interfaces;
with LibCRC;
with LibCRC.Predefined;

procedure Example is
   Buffer : constant LibCRC.Byte_Array (1 .. 5) := (1, 2, 3, 4, 5);
   CRC    : Interfaces.Unsigned_32;
begin
    CRC := LibCRC.Predefined.CRC_32.Calculate (Buffer);
end Example;
```

If the data to be processed is fragmented across multiple buffers:
```ada
with Interfaces;
with LibCRC;
with LibCRC.Predefined;

procedure Example is
   Buffer_1 : constant LibCRC.Byte_Array (1 .. 3) := (1, 2, 3);
   Buffer_2 : constant LibCRC.Byte_Array (1 .. 2) := (4, 5);
   Ctx      : LibCRC.Predefined.CRC_32.Context;
   CRC      : Interfaces.Unsigned_32;
begin
    LibCRC.Predefined.CRC_32.Reset (Ctx);
    LibCRC.Predefined.CRC_32.Update (Ctx, Buffer_1);
    LibCRC.Predefined.CRC_32.Update (Ctx, Buffer_2);
    CRC := LibCRC.Predefined.CRC_32.Get_CRC (Ctx);
end Example;
```

## Custom Polynomials

If you want to use a polynomial that is not provided in `LibCRC.Predefined`,
then you can instantiate your own CRC using one of the following packages,
depending on your requirements:
 * `LibCRC.Generic_Nbit_CRCs.Table_Based` for a table-based CRC
   (you can store the table in either ROM or RAM).
 * `LibCRC.Generic_Nbit_CRCs.Bitwise` for a bit-by-bit (slow) CRC.

Let's use the CRC-32 algorithm as an example, which has the following parameters:
 * Polynomial: x^32 + x^26 + x^23 + x^22 + x^16 + x^12 + x^11 + x^10 + x^8 + x^7 + x^5 + x^4 + x^2 + x + 1
 * Initial value: 0xFFFFFFFF
 * Final XOR: 0xFFFFFFFF
 * Reflect input: True
 * Reflect output: True

the CRC can be instantiated using the RAM table method as follows:
```ada
with LibCRC.CRC_32bit;
with LibCRC.Generic_Nbit_CRCs.Table_Based;

package Example is

   CRC_32_Reflected_Table : aliased constant CRC_32bit.CRC_Table_Type :=
     CRC_32bit.Generate_Table_Reflected
       (Polynomial => CRC_32bit.Bit_Reverse_CRC (16#04C1_1DB7#));

   package CRC_32 is new LibCRC.CRC_32bit.Table_Based
     (Seed                => 16#FFFF_FFFF#,
      Final_XOR           => 16#FFFF_FFFF#,
      Reflect_Input       => True,
      Reflect_Output      => True,
      CRC_Table_Reflected => True,
      CRC_Table           => CRC_32_Reflected_Table'Access);

end Example;
```

> :info: If `Reflect_Input` is `True` then it is recommended (but not mandatory)
> to use a reflected CRC table, which is computed from the bit-reversed CRC
> polynomial as demonstrated above.
>
> It is possible to use a non-reflected CRC table when `Reflect_Input` is true,
> though the CRC computation will be a bit slower as the CRC algorithm will
> bit-reverse each byte of the input instead to ensure the correct CRC is
> calculated.
>
> The following example demonstrates creating the same CRC algorithm as above,
> but using the non-reflected table:
```ada
with LibCRC.CRC_32bit;
with LibCRC.Generic_Nbit_CRCs.Table_Based;

package Example is

   CRC_32_Reflected_Table : aliased constant CRC_32bit.CRC_Table_Type :=
     CRC_32bit.Generate_Table (Polynomial => 16#04C1_1DB7#);

   package CRC_32 is new LibCRC.CRC_32bit.Table_Based
     (Seed                => 16#FFFF_FFFF#,
      Final_XOR           => 16#FFFF_FFFF#,
      Reflect_Input       => True,
      Reflect_Output      => True,
      CRC_Table_Reflected => False,
      CRC_Table           => CRC_32_Table'Access);

end Example;
```

### Custom Width CRC

If your CRC is not a 8, 16, 24, 32, or 64 bits, then you will also need to
instantiate `LibCRC.Generic_Nbit_CRCs`. For example, for a 10-bit CRC with
the following parameters:
* Polynomial: x^10 + x^9 + x^5 + x^4 + x + 1
* Initial value: 0x000
* Final XOR: 0x000
* Reflect Input: False
* Reflect Output: False

```
with Interfaces; use Interfaces;
with LibCRC.Generic_Nbit_CRCs;
with LibCRC.Generic_Nbit_CRCs.Table_Based;

package Example is

   --  Define a 10-bit CRC type

   type CRC10_Type is mod 2**10 with Size => 10;

   --  Shift left/right operations are also needed. We can implement them
   --  in terms of another, larger type that has Shift_Left and Shift_Right,
   --  such as Unsigned_16.

   function Shift_Left (Value : CRC10_Type; Amount : Natural) return CRC10_Type
   is
     (CRC10_Type (Shift_Left (Unsigned_16 (Value), Amount) and 16#2FF#));

   function Shift_Right (Value : CRC10_Type; Amount : Natural) return CRC10_Type
   is
     (CRC10_Type (Shift_Right (Unsigned_16 (Value), Amount)));

   --  Instantiate LibCRC.Generic_Nbit_CRC for our 10-bit CRC type

   package CRC_10bit is new LibCRC.Generic_Nbit_CRCs
     (CRC_Type    => CRC10_Type,
      Shift_Left  => Shift_Left,
      Shift_Right => Shift_Right);

   --  Now we can create our CRC
   --  (using the RAM table-based implementation in this example)

   CRC_10_Table : aliased constant CRC_10bit.CRC_Table_Type :=
     CRC_10bit.Generate_Table (Polynomial => 16#233#);

   package CRC_10 is new CRC_10bit.Table_Based
     (Seed                => 16#000#,
      Final_XOR           => 16#000#,
      Reflect_Input       => False,
      Reflect_Output      => False,
      CRC_Table_Reflected => False,
      CRC_Table           => CRC_10_Table'Access);

end Example;
```

## References

[1] CRC RevEng Catalogue https://reveng.sourceforge.io/crc-catalogue/
  (Accessed 20 June 2025)
