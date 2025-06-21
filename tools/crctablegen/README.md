# crctablegen

This directory contains a command line program that generates a CRC table
for any CRC width and polynomial. It can generate both normal and reflected
tables.

## Building

```sh
alr build
```

The `crctablegen` executable will be put in the `./bin` directory.

## Usage

Example usage to generate a 32-bit CRC table with the polynomial `0x04c11db7`
```sh
crctablegen 32 16#04c11db7#
```

If you want a reflected table, then pass `reflected` as the third argument:
```sh
crctablegen 32 16#04c11db7# reflected
```