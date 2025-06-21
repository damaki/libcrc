--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
with LibCRC.Generic_Nbit_CRCs.Bitwise;

--  This package instantiates various CRCs that calculate the CRC bit-by-bit.

package LibCRC.Predefined.Bitwise with
  Preelaborate,
  SPARK_Mode,
  Always_Terminates
is

   --========================================================================--
   --                                8-bit CRC                               --
   --========================================================================--

   package CRC_8_AUTOSAR is new CRC_8bit.Bitwise
     (Polynomial           => 16#2F#,
      Reflected_Polynomial => False,
      Seed                 => 16#FF#,
      Final_XOR            => 16#FF#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_8_BLUETOOTH is new CRC_8bit.Bitwise
     (Polynomial           => 16#A7#,
      Reflected_Polynomial => False,
      Seed                 => 16#00#,
      Final_XOR            => 16#00#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_8_DARC is new CRC_8bit.Bitwise
     (Polynomial           => 16#39#,
      Reflected_Polynomial => False,
      Seed                 => 16#00#,
      Final_XOR            => 16#00#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_8_HITAG is new CRC_8bit.Bitwise
     (Polynomial           => 16#1D#,
      Reflected_Polynomial => False,
      Seed                 => 16#FF#,
      Final_XOR            => 16#00#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_8_I_CODE is new CRC_8bit.Bitwise
     (Polynomial           => 16#1D#,
      Reflected_Polynomial => False,
      Seed                 => 16#FD#,
      Final_XOR            => 16#00#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_8_MAXIM_DOW is new CRC_8bit.Bitwise
     (Polynomial           => 16#31#,
      Reflected_Polynomial => False,
      Seed                 => 16#00#,
      Final_XOR            => 16#00#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_8_MAXIM renames CRC_8_MAXIM_DOW;
   package DOW_CRC     renames CRC_8_MAXIM_DOW;

   package CRC_8_MIFARE_MAD is new CRC_8bit.Bitwise
     (Polynomial           => 16#1D#,
      Reflected_Polynomial => False,
      Seed                 => 16#C7#,
      Final_XOR            => 16#00#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_8_NRSC_5 is new CRC_8bit.Bitwise
     (Polynomial           => 16#31#,
      Reflected_Polynomial => False,
      Seed                 => 16#FF#,
      Final_XOR            => 16#00#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_8_OPENSAFETY is new CRC_8bit.Bitwise
     (Polynomial           => 16#2F#,
      Reflected_Polynomial => False,
      Seed                 => 16#00#,
      Final_XOR            => 16#00#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_8_SAE_J1850 is new CRC_8bit.Bitwise
     (Polynomial           => 16#1D#,
      Reflected_Polynomial => False,
      Seed                 => 16#FF#,
      Final_XOR            => 16#FF#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_8_SMBUS is new CRC_8bit.Bitwise
     (Polynomial           => 16#07#,
      Reflected_Polynomial => False,
      Seed                 => 16#00#,
      Final_XOR            => 16#00#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_8 renames CRC_8_SMBUS;

   package CRC_8_TECH_3250 is new CRC_8bit.Bitwise
     (Polynomial           => 16#1D#,
      Reflected_Polynomial => False,
      Seed                 => 16#FF#,
      Final_XOR            => 16#00#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_8_AES renames CRC_8_TECH_3250;
   package CRC_8_EBU renames CRC_8_TECH_3250;

   --========================================================================--
   --                               16-bit CRC                               --
   --========================================================================--

   package CRC_16_ARC is new CRC_16bit.Bitwise
     (Polynomial           => 16#8005#,
      Reflected_Polynomial => False,
      Seed                 => 16#0000#,
      Final_XOR            => 16#0000#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package ARC        renames CRC_16_ARC;
   package CRC_16     renames CRC_16_ARC;
   package CRC_16_LHA renames CRC_16_ARC;
   package CRC_16_IBM renames CRC_16_ARC;

   package CRC_16_DDS_110 is new CRC_16bit.Bitwise
     (Polynomial           => 16#8005#,
      Reflected_Polynomial => False,
      Seed                 => 16#800D#,
      Final_XOR            => 16#0000#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_16_DECT_R is new CRC_16bit.Bitwise
     (Polynomial           => 16#0589#,
      Reflected_Polynomial => False,
      Seed                 => 16#0000#,
      Final_XOR            => 16#0001#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package R_CRC_16 renames CRC_16_DECT_R;

   package CRC_16_DECT_X is new CRC_16bit.Bitwise
     (Polynomial           => 16#0589#,
      Reflected_Polynomial => False,
      Seed                 => 16#0000#,
      Final_XOR            => 16#0000#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package X_CRC_16 renames CRC_16_DECT_X;

   package CRC_16_DNP is new CRC_16bit.Bitwise
     (Polynomial           => 16#3D65#,
      Reflected_Polynomial => False,
      Seed                 => 16#0000#,
      Final_XOR            => 16#FFFF#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_16_EN_13757 is new CRC_16bit.Bitwise
     (Polynomial           => 16#3D65#,
      Reflected_Polynomial => False,
      Seed                 => 16#0000#,
      Final_XOR            => 16#FFFF#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_16_GENIBUS is new CRC_16bit.Bitwise
     (Polynomial           => 16#1021#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFF#,
      Final_XOR            => 16#FFFF#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_16_DARC     renames CRC_16_GENIBUS;
   package CRC_16_EPC      renames CRC_16_GENIBUS;
   package CRC_16_EPC_C1G2 renames CRC_16_GENIBUS;
   package CRC_16_I_CODE   renames CRC_16_GENIBUS;

   package CRC_16_GSM is new CRC_16bit.Bitwise
     (Polynomial           => 16#1021#,
      Reflected_Polynomial => False,
      Seed                 => 16#0000#,
      Final_XOR            => 16#FFFF#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_16_IBM_3740 is new CRC_16bit.Bitwise
     (Polynomial           => 16#1021#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFF#,
      Final_XOR            => 16#0000#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_16_AUTOSAR     renames CRC_16_IBM_3740;
   package CRC_16_CCITT_FALSE renames CRC_16_IBM_3740;

   package CRC_16_IBM_SDLC is new CRC_16bit.Bitwise
     (Polynomial           => 16#1021#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFF#,
      Final_XOR            => 16#FFFF#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_16_ISO_HDLC          renames CRC_16_IBM_SDLC;
   package CRC_16_ISO_IEC_14443_3_B renames CRC_16_IBM_SDLC;
   package CRC_16_X_25              renames CRC_16_IBM_SDLC;
   package CRC_B                    renames CRC_16_IBM_SDLC;
   package X_25                     renames CRC_16_IBM_SDLC;

   package CRC_16_ISO_IEC_14443_3_A is new CRC_16bit.Bitwise
     (Polynomial           => 16#1021#,
      Reflected_Polynomial => False,
      Seed                 => 16#C6C6#,
      Final_XOR            => 16#0000#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_A renames CRC_16_ISO_IEC_14443_3_A;

   package CRC_16_KERMIT is new CRC_16bit.Bitwise
     (Polynomial           => 16#1021#,
      Reflected_Polynomial => False,
      Seed                 => 16#0000#,
      Final_XOR            => 16#0000#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_16_BLUETOOTH  renames CRC_16_KERMIT;
   package CRC_16_CCITT      renames CRC_16_KERMIT;
   package CRC_16_CCITT_TRUE renames CRC_16_KERMIT;
   package CRC_16_V_41_LSB   renames CRC_16_KERMIT;
   package CRC_CCITT         renames CRC_16_KERMIT;
   package KERMIT            renames CRC_16_KERMIT;

   package CRC_16_M17 is new CRC_16bit.Bitwise
     (Polynomial           => 16#5935#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFF#,
      Final_XOR            => 16#0000#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_16_MAXIM_DOW is new CRC_16bit.Bitwise
     (Polynomial           => 16#8005#,
      Reflected_Polynomial => False,
      Seed                 => 16#0000#,
      Final_XOR            => 16#FFFF#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_16_MAXIM renames CRC_16_MAXIM_DOW;

   package CRC_16_MCRF4XX is new CRC_16bit.Bitwise
     (Polynomial           => 16#1021#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFF#,
      Final_XOR            => 16#0000#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_16_MODBUS is new CRC_16bit.Bitwise
     (Polynomial           => 16#8005#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFF#,
      Final_XOR            => 16#0000#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_16_NRSC_5 is new CRC_16bit.Bitwise
     (Polynomial           => 16#080B#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFF#,
      Final_XOR            => 16#0000#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_16_OPENSAFETY_A is new CRC_16bit.Bitwise
     (Polynomial           => 16#5935#,
      Reflected_Polynomial => False,
      Seed                 => 16#0000#,
      Final_XOR            => 16#0000#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_16_OPENSAFETY_B is new CRC_16bit.Bitwise
     (Polynomial           => 16#755B#,
      Reflected_Polynomial => False,
      Seed                 => 16#0000#,
      Final_XOR            => 16#0000#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_16_PROFIBUS is new CRC_16bit.Bitwise
     (Polynomial           => 16#1DCF#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFF#,
      Final_XOR            => 16#FFFF#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_16_IEC_61158_2 renames CRC_16_PROFIBUS;

   package CRC_16_SPI_FUJITSU is new CRC_16bit.Bitwise
     (Polynomial           => 16#1021#,
      Reflected_Polynomial => False,
      Seed                 => 16#1D0F#,
      Final_XOR            => 16#0000#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_16_AUG_CCITT renames CRC_16_SPI_FUJITSU;

   package CRC_16_T10_DIF is new CRC_16bit.Bitwise
     (Polynomial           => 16#8BB7#,
      Reflected_Polynomial => False,
      Seed                 => 16#0000#,
      Final_XOR            => 16#0000#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_16_TELEDISK is new CRC_16bit.Bitwise
     (Polynomial           => 16#A097#,
      Reflected_Polynomial => False,
      Seed                 => 16#0000#,
      Final_XOR            => 16#0000#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_16_TMS37157 is new CRC_16bit.Bitwise
     (Polynomial           => 16#1021#,
      Reflected_Polynomial => False,
      Seed                 => 16#89EC#,
      Final_XOR            => 16#0000#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_16_UMTS is new CRC_16bit.Bitwise
     (Polynomial           => 16#8005#,
      Reflected_Polynomial => False,
      Seed                 => 16#0000#,
      Final_XOR            => 16#0000#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_16_BUYPASS  renames CRC_16_UMTS;
   package CRC_16_VERIFONE renames CRC_16_UMTS;

   package CRC_16_USB is new CRC_16bit.Bitwise
     (Polynomial           => 16#8005#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFF#,
      Final_XOR            => 16#FFFF#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_16_XMODEM is new CRC_16bit.Bitwise
     (Polynomial           => 16#1021#,
      Reflected_Polynomial => False,
      Seed                 => 16#0000#,
      Final_XOR            => 16#0000#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_16_ACORN    renames CRC_16_XMODEM;
   package CRC_16_LTE      renames CRC_16_XMODEM;
   package CRC_16_V_41_MSB renames CRC_16_XMODEM;
   package XMODEM          renames CRC_16_XMODEM;
   package ZMODEM          renames CRC_16_XMODEM;

   --========================================================================--
   --                               24-bit CRC                               --
   --========================================================================--

   package CRC_24_BLE is new LibCRC.CRC_24bit.Bitwise
     (Polynomial           => 16#00065B#,
      Reflected_Polynomial => False,
      Seed                 => 16#555555#,
      Final_XOR            => 16#000000#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_24_FLEXRAY_A is new LibCRC.CRC_24bit.Bitwise
     (Polynomial           => 16#5D6DCB#,
      Reflected_Polynomial => False,
      Seed                 => 16#FEDCBA#,
      Final_XOR            => 16#000000#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_24_FLEXRAY_B is new LibCRC.CRC_24bit.Bitwise
     (Polynomial           => 16#5D6DCB#,
      Reflected_Polynomial => False,
      Seed                 => 16#ABCDEF#,
      Final_XOR            => 16#000000#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_24_OPENPGP is new LibCRC.CRC_24bit.Bitwise
     (Polynomial           => 16#864CFB#,
      Reflected_Polynomial => False,
      Seed                 => 16#B704CE#,
      Final_XOR            => 16#000000#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_24 renames CRC_24_OPENPGP;

   package CRC_24_OS_9 is new LibCRC.CRC_24bit.Bitwise
     (Polynomial           => 16#800063#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFFFF#,
      Final_XOR            => 16#FFFFFF#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   --========================================================================--
   --                               32-bit CRC                               --
   --========================================================================--

   package CRC_32_AIXM is new LibCRC.CRC_32bit.Bitwise
     (Polynomial           => 16#814141AB#,
      Reflected_Polynomial => False,
      Seed                 => 16#00000000#,
      Final_XOR            => 16#00000000#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_32Q renames CRC_32_AIXM;

   package CRC_32_AUTOSAR is new LibCRC.CRC_32bit.Bitwise
     (Polynomial           => 16#F4ACFB13#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFFFFFF#,
      Final_XOR            => 16#FFFFFFFF#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_32_BASE91_D is new LibCRC.CRC_32bit.Bitwise
     (Polynomial           => 16#A833982B#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFFFFFF#,
      Final_XOR            => 16#FFFFFFFF#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_32D renames CRC_32_BASE91_D;

   package CRC_32_BZIP2 is new LibCRC.CRC_32bit.Bitwise
     (Polynomial           => 16#04C11DB7#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFFFFFF#,
      Final_XOR            => 16#FFFFFFFF#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_32_AAL5   renames CRC_32_BZIP2;
   package CRC_32_DECT_B renames CRC_32_BZIP2;
   package B_CRC_32      renames CRC_32_BZIP2;

   package CRC_32_CKSUM is new LibCRC.CRC_32bit.Bitwise
     (Polynomial           => 16#04C11DB7#,
      Reflected_Polynomial => False,
      Seed                 => 16#00000000#,
      Final_XOR            => 16#FFFFFFFF#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CKSUM        renames CRC_32_CKSUM;
   package CRC_32_POSIX renames CRC_32_CKSUM;

   package CRC_32_ISCSI is new LibCRC.CRC_32bit.Bitwise
     (Polynomial           => 16#1EDC6F41#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFFFFFF#,
      Final_XOR            => 16#FFFFFFFF#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_32_BASE91_C   renames CRC_32_ISCSI;
   package CRC_32_CASTAGNOLI renames CRC_32_ISCSI;
   package CRC_32_INTERLAKEN renames CRC_32_ISCSI;
   package CRC_32C           renames CRC_32_ISCSI;
   package CRC_32_NVME       renames CRC_32_ISCSI;

   package CRC_32_ISO_HDLC is new LibCRC.CRC_32bit.Bitwise
     (Polynomial           => 16#04C11DB7#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFFFFFF#,
      Final_XOR            => 16#FFFFFFFF#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_32       renames CRC_32_ISO_HDLC;
   package CRC_32_ADCCP renames CRC_32_ISO_HDLC;
   package CRC_32_V_42  renames CRC_32_ISO_HDLC;
   package CRC_32_XZ    renames CRC_32_ISO_HDLC;
   package PKZIP        renames CRC_32_ISO_HDLC;

   package CRC_32_JAMCRC is new LibCRC.CRC_32bit.Bitwise
     (Polynomial           => 16#04C11DB7#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFFFFFF#,
      Final_XOR            => 16#00000000#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package JAMCRC renames CRC_32_JAMCRC;

   package CRC_32_MEF is new LibCRC.CRC_32bit.Bitwise
     (Polynomial           => 16#741B8CD7#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFFFFFF#,
      Final_XOR            => 16#00000000#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_32_MPEG_2 is new LibCRC.CRC_32bit.Bitwise
     (Polynomial           => 16#04C11DB7#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFFFFFF#,
      Final_XOR            => 16#00000000#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_32_XFER is new LibCRC.CRC_32bit.Bitwise
     (Polynomial           => 16#000000AF#,
      Reflected_Polynomial => False,
      Seed                 => 16#00000000#,
      Final_XOR            => 16#00000000#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   --========================================================================--
   --                               64-bit CRC                               --
   --========================================================================--

   package CRC_64_ECMA_182 is new LibCRC.CRC_64bit.Bitwise
     (Polynomial           => 16#42F0E1EBA9EA3693#,
      Reflected_Polynomial => False,
      Seed                 => 16#00000000_00000000#,
      Final_XOR            => 16#00000000_00000000#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_64 renames CRC_64_ECMA_182;

   package CRC_64_GO_ISO is new LibCRC.CRC_64bit.Bitwise
     (Polynomial           => 16#000000000000001B#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFFFFFF_FFFFFFFF#,
      Final_XOR            => 16#FFFFFFFF_FFFFFFFF#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_64_MS is new LibCRC.CRC_64bit.Bitwise
     (Polynomial           => 16#259C84CBA6426349#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFFFFFF_FFFFFFFF#,
      Final_XOR            => 16#00000000_00000000#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_64_NVME is new LibCRC.CRC_64bit.Bitwise
     (Polynomial           => 16#AD93D23594C93659#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFFFFFF_FFFFFFFF#,
      Final_XOR            => 16#FFFFFFFF_FFFFFFFF#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_64_WE is new LibCRC.CRC_64bit.Bitwise
     (Polynomial           => 16#42F0E1EBA9EA3693#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFFFFFF_FFFFFFFF#,
      Final_XOR            => 16#FFFFFFFF_FFFFFFFF#,
      Reflect_Input        => False,
      Reflect_Output       => False);

   package CRC_64_XZ is new LibCRC.CRC_64bit.Bitwise
     (Polynomial           => 16#42F0E1EBA9EA3693#,
      Reflected_Polynomial => False,
      Seed                 => 16#FFFFFFFF_FFFFFFFF#,
      Final_XOR            => 16#FFFFFFFF_FFFFFFFF#,
      Reflect_Input        => True,
      Reflect_Output       => True);

   package CRC_64_GO_ECMA renames CRC_64_XZ;

end LibCRC.Predefined.Bitwise;