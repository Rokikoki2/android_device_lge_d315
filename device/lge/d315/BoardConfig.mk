#
# Copyright (C) 2015 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# WCNSS musi byc ustawione PRZED BoardConfigCommon (tam jest ifeq na te flage):
# bez tego nie ma BOARD_HAS_QCOM_WLAN, wifi_configs, wcnss_service ani BT.
BOARD_HAS_QCOM_WCNSS := true

# Wspolne opcje platformy msm8226
-include device/lge/msm8226-common/BoardConfigCommon.mk

# Vendor init
TARGET_INIT_VENDOR_LIB := libinit_d315
TARGET_OTA_ASSERT_DEVICE := d315,f70,f70n
TARGET_RECOVERY_DEVICE_MODULES := libinit_d315
TARGET_RELEASETOOLS_EXTENSIONS := device/lge/d315/releasetools

# System properties
TARGET_SYSTEM_PROP := device/lge/d315/system.prop

# Recovery fstab (F70 nie ma partycji mpt)
TARGET_RECOVERY_FSTAB := device/lge/d315/rootdir/fstab.qcom

# Bootloader / platform
TARGET_BOOTLOADER_BOARD_NAME := d315

# Kernel
TARGET_KERNEL_CONFIG := f70_lineage_defconfig
# F70 aboot podaje DT pod 0x01e00000 (tak samo jak stock i Tasty).
# Bez tego mkbootimg wpisuje 0x00000100 i kernel nie dostaje drzewa urzadzen.
BOARD_KERNEL_TAGS_OFFSET := 0x01e00000

# Ekran: 480x800, 200 dpi
TARGET_SCREEN_WIDTH := 480
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_DENSITY := 200

# Kernel cmdline - init w LOS szuka /init.qcom.rc oraz /fstab.qcom
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 user_debug=31 msm_rtb.filter=0x37 androidboot.hardware=qcom androidboot.selinux=permissive

# Partycje (boot/recovery 22 MB, system ~1.6 GB)
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE     := 23068672
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 23068672
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 1598029824
BOARD_CACHEIMAGE_PARTITION_SIZE    := 262144000
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 33554432
