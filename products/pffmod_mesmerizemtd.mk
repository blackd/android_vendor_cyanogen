# Inherit AOSP device configuration for mesmerizemtd.
$(call inherit-product, device/samsung/mesmerizemtd/full_mesmerizemtd.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/pffmod/products/common_full.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := pffmod_mesmerizemtd
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := mesmerizemtd
PRODUCT_MODEL := SCH-I500
PRODUCT_MANUFACTURER := samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=soju BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GWK74 BUILD_FINGERPRINT=google/soju/crespo:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="soju-user 2.3.4 GRJ22 121341 release-keys"

# Extra mesmerizemtd overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/pffmod/overlay/mesmerizemtd

# Add the Torch app
PRODUCT_PACKAGES += Torch

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=pffmod-7-$(shell date +%m%d%Y)-NIGHTLY-Mesmerize
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=pffmod-7.1.0-Mesmerize
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=pffmod-7.1.0-Mesmerize-KANG-$(shell date +%m%d)
    endif
endif

#
# Copy galaxys specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/pffmod/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
