# Inherit device configuration for mecha.
$(call inherit-product, device/htc/mecha/device_mecha.mk)

# Inherit some common pffmod stuff.
$(call inherit-product, vendor/pffmod/products/common_full.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := pffmod_mecha
PRODUCT_BRAND := htc_wwe
PRODUCT_DEVICE := mecha
PRODUCT_MODEL := ThunderBolt
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_mecha BUILD_ID=FRG83D BUILD_DISPLAY_ID=GRJ22 BUILD_FINGERPRINT=verizon_wwe/htc_mecha/mecha/mecha:2.2.1/FRG83D/338893:user/release-keys PRIVATE_BUILD_DESC="1.12.605.6 CL338893 release-keys"

# Extra Mecha overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/pffmod/overlay/mecha

# Add the Torch app
PRODUCT_PACKAGES += Torch

# Add AicBootFix
PRODUCT_PACKAGES += AicBootFix

# Broadcom FM radio
$(call inherit-product, vendor/pffmod/products/bcm_fm_radio.mk)

# SIM Toolkit
PRODUCT_PACKAGES += Stk

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=pffmod-7-$(shell date +%m%d%Y)-NIGHTLY-Thunderbolt
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=pffmod-7.1.0-RC0-Thunderbolt
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=pffmod-7.1.0-RC0-Thunderbolt-KANG
    endif
endif

#
# Copy passion specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/pffmod/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
