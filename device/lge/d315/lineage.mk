# Inherit some common lineage stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, device/lge/d315/device_d315.mk)

# Boot animation
TARGET_SCREEN_WIDTH := 480
TARGET_SCREEN_HEIGHT := 800

# Release name
PRODUCT_RELEASE_NAME := LG-D315
PRODUCT_NAME := lineage_d315
PRODUCT_MODEL := LG-D315
PRODUCT_DEVICE := d315
PRODUCT_MANUFACTURER := LGE
PRODUCT_BRAND := lge
