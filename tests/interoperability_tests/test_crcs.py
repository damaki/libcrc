"""Interoperablility tests for LibCRC

These tests compare the output of LibCRC against Python's crcmod for a variety
of predefined algorithms.
"""

import pytest
import crcmod.predefined
from pathlib import Path
import subprocess
import random

# List of CRC algorithms that are compared between libcrc and crcmod.
#
# Some predefined algorithms in crcmod are not used for interoperability testing:
# * crc-8-itu: No equivalent algorithm in libcrc
# * crc-8-rohc: No equivalent algorithm in libcrc
# * crc-8-wcdma: No equivalent algorithm in libcrc
# * crc-64: The algorithm named "CRC_64" in libcrc uses a different polynomial,
#   based on the definition from the RevEng CRC catalogue.
# * crc-64-jones: No equivalent algorithm in libcrc
test_algorithms = [
    # fmt: off
    # libcrc name          crcmod name
    ("CRC-8",              "crc-8"),
    ("CRC-8/DARC",         "crc-8-darc"),
    ("CRC-8/I-CODE",       "crc-8-i-code"),
    ("CRC-8/MAXIM",        "crc-8-maxim"),
    ("CRC-16",             "crc-16"),
    ("CRC-16/BUYPASS",     "crc-16-buypass"),
    ("CRC-16/DDS-110",     "crc-16-dds-110"),
    ("CRC-16/DECT-R",      "crc-16-dect"),
    ("CRC-16/DNP",         "crc-16-dnp"),
    ("CRC-16/EN-13757",    "crc-16-en-13757"),
    ("CRC-16/GENIBUS",     "crc-16-genibus"),
    ("CRC-16/MAXIM",       "crc-16-maxim"),
    ("CRC-16/MCRF4XX",     "crc-16-mcrf4xx"),
    ("CRC-16/T10-DIF",     "crc-16-t10-dif"),
    ("CRC-16/TELEDISK",    "crc-16-teledisk"),
    ("CRC-16/USB",         "crc-16-usb"),
    ("X-25",               "x-25"),
    ("XMODEM",             "xmodem"),
    ("CRC-16/MODBUS",      "modbus"),
    ("CRC-16/KERMIT",      "kermit"),
    ("CRC-16/CCITT-FALSE", "crc-ccitt-false"),
    ("CRC-16/AUG-CCITT",   "crc-aug-ccitt"),
    ("CRC-24/FLEXRAY-A",   "crc-24-flexray-a"),
    ("CRC-24/FLEXRAY-B",   "crc-24-flexray-b"),
    ("CRC-32",             "crc-32"),
    ("CRC-32/BZIP2",       "crc-32-bzip2"),
    ("CRC-32C",            "crc-32c"),
    ("CRC-32D",            "crc-32d"),
    ("CRC-32/MPEG-2",      "crc-32-mpeg"),
    ("CRC-32/POSIX",       "posix"),
    ("CRC-32Q",            "crc-32q"),
    ("CRC-32/JAMCRC",      "jamcrc"),
    ("CRC-32/XFER",        "xfer"),
    ("CRC-64/WE",          "crc-64-we"),
    # fmt: on
]


def run_libcrc_driver(crc_name: str, data: bytes):
    completed_process = subprocess.run(
        args=[Path("driver") / "bin" / "driver", crc_name],
        input=data,
        stdout=subprocess.PIPE,
    )

    assert completed_process.returncode == 0

    # The driver outputs four lines. The first line is the CRC name, then the
    # next three lines are the calculated CRCs (one per ROM/RAM/bitwise
    # implementation). E.g.:
    #
    # CRC-8/DARC
    # 16#FA#
    # 16#FA#
    # 16#FA#

    print(completed_process.stdout.decode())

    return [
        int(line.strip().removeprefix("16#").removesuffix("#"), 16)
        for line in completed_process.stdout.decode()
        .rstrip("\n")
        .strip()
        .splitlines()[1:]
    ]


def run_test(libcrc_name, crcmod_name, test_data: bytes):
    crcmod_crc = crcmod.predefined.mkPredefinedCrcFun(crcmod_name)(test_data)
    libcrc_crc = run_libcrc_driver(libcrc_name, test_data)

    assert hex(crcmod_crc) == hex(libcrc_crc[0])
    assert hex(crcmod_crc) == hex(libcrc_crc[1])
    assert hex(crcmod_crc) == hex(libcrc_crc[2])


@pytest.mark.parametrize(
    "libcrc_name,crcmod_name", test_algorithms, ids=[x[0] for x in test_algorithms]
)
def test_empty(request: pytest.FixtureRequest, libcrc_name: str, crcmod_name: str):
    """Test that libcrc and crcmod produce the same CRC for an empty input"""
    run_test(libcrc_name, crcmod_name, test_data=bytes())


@pytest.mark.parametrize(
    "libcrc_name,crcmod_name", test_algorithms, ids=[x[0] for x in test_algorithms]
)
def test_zeroes(request: pytest.FixtureRequest, libcrc_name: str, crcmod_name: str):
    """Test that libcrc and crcmod produce the same CRC for a sequence of 128 zeroes"""
    run_test(libcrc_name, crcmod_name, test_data=bytes(128))


@pytest.mark.parametrize(
    "libcrc_name,crcmod_name", test_algorithms, ids=[x[0] for x in test_algorithms]
)
def test_123456789(request: pytest.FixtureRequest, libcrc_name: str, crcmod_name: str):
    """Test that libcrc and crcmod produce the same CRC for the ASCII string '123456789'"""
    run_test(libcrc_name, crcmod_name, test_data="123456789".encode("ASCII"))


@pytest.mark.parametrize(
    "libcrc_name,crcmod_name", test_algorithms, ids=[x[0] for x in test_algorithms]
)
def test_long_random(
    request: pytest.FixtureRequest, libcrc_name: str, crcmod_name: str
):
    """Test that libcrc and crcmod produce the same CRC for a sequence of 512kiB of random bytes"""
    random.seed(123456789)
    run_test(libcrc_name, crcmod_name, test_data=random.randbytes(512 * 1024))
