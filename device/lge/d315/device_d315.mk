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

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/lge/d315/overlay

# Configs (pliki wyciagniete z fabrycznego system.img F70)
PRODUCT_COPY_FILES += \
    device/lge/d315/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/lge/d315/prebuilt/etc/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/lge/d315/prebuilt/usr/idc/touch_dev.idc:system/usr/idc/touch_dev.idc \
    device/lge/d315/prebuilt/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    device/lge/d315/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Ramdisk (cmdline: androidboot.hardware=qcom)
PRODUCT_COPY_FILES += \
    device/lge/d315/rootdir/fstab.qcom:root/fstab.qcom

# Screen
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi

# F70: WCNSS (wifi/BT/FM), brak NFC, brak IR
BOARD_HAS_QCOM_WCNSS := true
BOARD_HAS_NFC := false
BOARD_HAS_LG_IRRC := false

# Inherit common msm8226
$(call inherit-product, device/lge/msm8226-common/msm8226.mk)
$(call inherit-product, vendor/lge/d315/d315-vendor.mk)
