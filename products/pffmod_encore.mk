# Inherit AOSP device configuration for encore.
$(call inherit-product, device/bn/encore/encore.mk)

# Inherit some common pffmod stuff.
$(call inherit-product, vendor/pffmod/products/common_full.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := pffmod_encore
PRODUCT_BRAND := bn
PRODUCT_DEVICE := encore
PRODUCT_MODEL := NookColor
PRODUCT_MANUFACTURER := bn
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=encore BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GRJ22 BUILD_FINGERPRINT=google/passion/passion:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.4 GRJ22 121341 release-keys"

PRODUCT_PACKAGE_OVERLAYS += \
    vendor/pffmod/overlay/tablet \
    vendor/pffmod/overlay/encore

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=pffmod-7-$(shell date +%m%d%Y)-NIGHTLY-encore
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=pffmod-7.1.0-RC1-encore
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=pffmod-7.1.0-RC1-encore-KANG
    endif
endif


PRODUCT_COPY_FILES +=  \
    vendor/pffmod/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip

