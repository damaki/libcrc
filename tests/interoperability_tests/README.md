# Interoperability Tests

These tests compare the output of LibCRC against another implementation
(Python's [crcmod](https://pypi.org/project/crcmod/)) to verify that they
produce the same outputs for the same CRC algorithm.

## Requirements

The following Python dependencies are required:
 * Python >= 3.9
 * [pytest](https://pypi.org/project/pytest/)
 * [crcmod](https://pypi.org/project/crcmod/)

## Running the Tests

Before running the tests, the `driver` program needs to be built. This program
is a test driver that wraps LibCRC to perform the CRC calculation.

```sh
cd driver
alr build
```

Then, run `pytest` in this directory:
```sh
pytest
```