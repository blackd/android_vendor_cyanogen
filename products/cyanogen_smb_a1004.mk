$(call inherit-product, device/malata/smb_a1004/smb_a1004.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/pffmod/products/common_full.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_smb_a1004
PRODUCT_BRAND := malata
PRODUCT_DEVICE := smb_a1004
PRODUCT_MODEL := SMB-A1004
PRODUCT_MANUFACTURER := malata
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=smb_a1004 BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GRJ22 BUILD_FINGERPRINT=google/passion/passion:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.4 GRJ22 121341 release-keys"

# Extra overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/pffmod/overlay/tablet \
    vendor/pffmod/overlay/smb_a1002

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=pffmod-7-$(shell date +%m%d%Y)-NIGHTLY-SMB-A1004
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=pffmod-7.1.0-RC0-SMB-A1004
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=pffmod-7.1.0-RC0-SMB-A1004-KANG
    endif
endif

#
# Copy passion specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/pffmod/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
