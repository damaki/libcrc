--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--

with CRC_8_AUTOSAR_Tests;
with CRC_8_BLUETOOTH_Tests;
with CRC_8_DARC_Tests;
with CRC_8_HITAG_Tests;
with CRC_8_I_CODE_Tests;
with CRC_8_MAXIM_DOW_Tests;
with CRC_8_MIFARE_MAD_Tests;
with CRC_8_NRSC_5_Tests;
with CRC_8_OPENSAFETY_Tests;
with CRC_8_SAE_J1850_Tests;
with CRC_8_SMBUS_Tests;
with CRC_8_TECH_3250_Tests;

with CRC_16_ARC_Tests;
with CRC_16_DDS_110_Tests;
with CRC_16_DECT_R_Tests;
with CRC_16_DECT_X_Tests;
with CRC_16_DNP_Tests;
with CRC_16_EN_13757_Tests;
with CRC_16_GENIBUS_Tests;
with CRC_16_GSM_Tests;
with CRC_16_IBM_3740_Tests;
with CRC_16_IBM_SDLC_Tests;
with CRC_16_ISO_IEC_14443_3_A_Tests;
with CRC_16_KERMIT_Tests;
with CRC_16_M17_Tests;
with CRC_16_MAXIM_DOW_Tests;
with CRC_16_MCRF4XX_Tests;
with CRC_16_MODBUS_Tests;
with CRC_16_NRSC_5_Tests;
with CRC_16_OPENSAFETY_A_Tests;
with CRC_16_OPENSAFETY_B_Tests;
with CRC_16_PROFIBUS_Tests;
with CRC_16_SPI_FUJITSU_Tests;
with CRC_16_T10_DIF_Tests;
with CRC_16_TELEDISK_Tests;
with CRC_16_TMS37157_Tests;
with CRC_16_UMTS_Tests;
with CRC_16_USB_Tests;
with CRC_16_XMODEM_Tests;

with CRC_24_BLE_Tests;
with CRC_24_FLEXRAY_A_Tests;
with CRC_24_FLEXRAY_B_Tests;
with CRC_24_OPENPGP_Tests;
with CRC_24_OS_9_Tests;

with CRC_32_AIXM_Tests;
with CRC_32_AUTOSAR_Tests;
with CRC_32_BASE91_D_Tests;
with CRC_32_BZIP2_Tests;
with CRC_32_CKSUM_Tests;
with CRC_32_ISCSI_Tests;
with CRC_32_ISO_HDLC_Tests;
with CRC_32_JAMCRC_Tests;
with CRC_32_MEF_Tests;
with CRC_32_MPEG_2_Tests;
with CRC_32_XFER_Tests;

with CRC_64_ECMA_182_Tests;
with CRC_64_GO_ISO_Tests;
with CRC_64_MS_Tests;
with CRC_64_NVME_Tests;
with CRC_64_WE_Tests;
with CRC_64_XZ_Tests;

package body CRC_Test_Suites
is

   function Suite return Access_Test_Suite
   is
      S : constant Access_Test_Suite := new Test_Suite;
   begin
      CRC_8_AUTOSAR_Tests.Add_To_Suite (S.all);
      CRC_8_BLUETOOTH_Tests.Add_To_Suite (S.all);
      CRC_8_DARC_Tests.Add_To_Suite (S.all);
      CRC_8_HITAG_Tests.Add_To_Suite (S.all);
      CRC_8_I_CODE_Tests.Add_To_Suite (S.all);
      CRC_8_MAXIM_DOW_Tests.Add_To_Suite (S.all);
      CRC_8_MIFARE_MAD_Tests.Add_To_Suite (S.all);
      CRC_8_NRSC_5_Tests.Add_To_Suite (S.all);
      CRC_8_OPENSAFETY_Tests.Add_To_Suite (S.all);
      CRC_8_SAE_J1850_Tests.Add_To_Suite (S.all);
      CRC_8_SMBUS_Tests.Add_To_Suite (S.all);
      CRC_8_TECH_3250_Tests.Add_To_Suite (S.all);

      CRC_16_ARC_Tests.Add_To_Suite (S.all);
      CRC_16_DDS_110_Tests.Add_To_Suite (S.all);
      CRC_16_DECT_R_Tests.Add_To_Suite (S.all);
      CRC_16_DECT_X_Tests.Add_To_Suite (S.all);
      CRC_16_DNP_Tests.Add_To_Suite (S.all);
      CRC_16_EN_13757_Tests.Add_To_Suite (S.all);
      CRC_16_GENIBUS_Tests.Add_To_Suite (S.all);
      CRC_16_GSM_Tests.Add_To_Suite (S.all);
      CRC_16_IBM_3740_Tests.Add_To_Suite (S.all);
      CRC_16_IBM_SDLC_Tests.Add_To_Suite (S.all);
      CRC_16_ISO_IEC_14443_3_A_Tests.Add_To_Suite (S.all);
      CRC_16_KERMIT_Tests.Add_To_Suite (S.all);
      CRC_16_M17_Tests.Add_To_Suite (S.all);
      CRC_16_MAXIM_DOW_Tests.Add_To_Suite (S.all);
      CRC_16_MCRF4XX_Tests.Add_To_Suite (S.all);
      CRC_16_MODBUS_Tests.Add_To_Suite (S.all);
      CRC_16_NRSC_5_Tests.Add_To_Suite (S.all);
      CRC_16_OPENSAFETY_A_Tests.Add_To_Suite (S.all);
      CRC_16_OPENSAFETY_B_Tests.Add_To_Suite (S.all);
      CRC_16_PROFIBUS_Tests.Add_To_Suite (S.all);
      CRC_16_SPI_FUJITSU_Tests.Add_To_Suite (S.all);
      CRC_16_T10_DIF_Tests.Add_To_Suite (S.all);
      CRC_16_TELEDISK_Tests.Add_To_Suite (S.all);
      CRC_16_TMS37157_Tests.Add_To_Suite (S.all);
      CRC_16_UMTS_Tests.Add_To_Suite (S.all);
      CRC_16_USB_Tests.Add_To_Suite (S.all);
      CRC_16_XMODEM_Tests.Add_To_Suite (S.all);

      CRC_24_BLE_Tests.Add_To_Suite (S.all);
      CRC_24_FLEXRAY_A_Tests.Add_To_Suite (S.all);
      CRC_24_FLEXRAY_B_Tests.Add_To_Suite (S.all);
      CRC_24_OPENPGP_Tests.Add_To_Suite (S.all);
      CRC_24_OS_9_Tests.Add_To_Suite (S.all);

      CRC_32_AIXM_Tests.Add_To_Suite (S.all);
      CRC_32_AUTOSAR_Tests.Add_To_Suite (S.all);
      CRC_32_BASE91_D_Tests.Add_To_Suite (S.all);
      CRC_32_BZIP2_Tests.Add_To_Suite (S.all);
      CRC_32_CKSUM_Tests.Add_To_Suite (S.all);
      CRC_32_ISCSI_Tests.Add_To_Suite (S.all);
      CRC_32_ISO_HDLC_Tests.Add_To_Suite (S.all);
      CRC_32_JAMCRC_Tests.Add_To_Suite (S.all);
      CRC_32_MEF_Tests.Add_To_Suite (S.all);
      CRC_32_MPEG_2_Tests.Add_To_Suite (S.all);
      CRC_32_XFER_Tests.Add_To_Suite (S.all);

      CRC_64_ECMA_182_Tests.Add_To_Suite (S.all);
      CRC_64_GO_ISO_Tests.Add_To_Suite (S.all);
      CRC_64_MS_Tests.Add_To_Suite (S.all);
      CRC_64_NVME_Tests.Add_To_Suite (S.all);
      CRC_64_WE_Tests.Add_To_Suite (S.all);
      CRC_64_XZ_Tests.Add_To_Suite (S.all);

      return S;
   end Suite;

end CRC_Test_Suites;