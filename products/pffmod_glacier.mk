# Inherit device configuration for glacier.
$(call inherit-product, device/htc/glacier/glacier.mk)

# Inherit some common pffmod stuff.
$(call inherit-product, vendor/pffmod/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/pffmod/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := pffmod_glacier
PRODUCT_BRAND := tmobile
PRODUCT_DEVICE := glacier
PRODUCT_MODEL := HTC Glacier
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_glacier BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GWK74 BUILD_FINGERPRINT=tmobile/htc_glacier/glacier:2.3.4/GRJ22/95282:user/release-keys PRIVATE_BUILD_DESC="2.19.531.1 CL95282 release-keys"

# Build kernel
#PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-msm
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=cyanogen_glacier_defconfig

# Extra glacier overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/pffmod/overlay/glacier

#Include Torch
PRODUCT_PACKAGES += Torch

# Build GanOptimizer
PRODUCT_PACKAGES += GanOptimizer

# Broadcom FM radio
$(call inherit-product, vendor/pffmod/products/bcm_fm_radio.mk)

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=pffmod-7-$(shell date +%m%d%Y)-NIGHTLY-glacier
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=pffmod-7.1.0-glacier
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=pffmod-7.1.0-glacier-KANG
    endif
endif

#
# Copy passion specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/pffmod/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
