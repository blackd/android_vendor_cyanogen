# Inherit AOSP device configuration for showcasemtd.
$(call inherit-product, device/samsung/showcasemtd/full_showcasemtd.mk)

# Inherit some common pffmodmod stuff.
$(call inherit-product, vendor/pffmod/products/common_full.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := pffmod_showcasemtd
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := showcasemtd
PRODUCT_MODEL := SCH-I500
PRODUCT_MANUFACTURER := samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=soju BUILD_ID=GRJ22 BUILD_FINGERPRINT=google/soju/crespo:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="soju-user 2.3.4 GRJ22 121341 release-keys"

# Extra showcasemtd overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/pffmod/overlay/showcasemtd

# Add the Torch app
PRODUCT_PACKAGES += Torch

# Release name and versioning
PRODUCT_RELEASE_NAME := Showcase
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/pffmod/products/common_versions.mk

#
# Copy galaxys specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/pffmod/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
