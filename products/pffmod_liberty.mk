# Inherit AOSP device configuration for liberty.
$(call inherit-product, device/htc/liberty/liberty.mk)

# Inherit some common pffmod stuff.
$(call inherit-product, vendor/pffmod/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/pffmod/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := pffmod_liberty
PRODUCT_BRAND := htc
PRODUCT_DEVICE := liberty
PRODUCT_MODEL := Liberty
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_liberty BUILD_ID=GRK39F BUILD_FINGERPRINT=google/passion/passion:2.3.6/GRK39F/189904:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.6 GRK39F 189904 release-keys"

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/pffmod/prelink-linux-arm-msm722x.map

# Broadcom FM radio
$(call inherit-product, vendor/pffmod/products/bcm_fm_radio.mk)

# Release name and versioning
PRODUCT_RELEASE_NAME := Liberty
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/pffmod/products/common_versions.mk

#
# Copy liberty specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/pffmod/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip
