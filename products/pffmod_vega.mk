$(call inherit-product, device/advent/vega/vega.mk)

# Inherit some common pffmod stuff.
$(call inherit-product, vendor/pffmod/products/common.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := pffmod_vega
PRODUCT_BRAND := advent
PRODUCT_DEVICE := vega
PRODUCT_MODEL := Vega
PRODUCT_MANUFACTURER := Advent
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=Vega BUILD_ID=GRJ22 BUILD_FINGERPRINT=google/passion/passion:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.4 GRJ22 121341 release-keys" BUILD_NUMBER=121341

# Extra overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/pffmod/overlay/tablet \
    vendor/pffmod/overlay/vega

# Release name and versioning
PRODUCT_RELEASE_NAME := Vega
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/pffmod/products/common_versions.mk

#
# Copy Vega specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/pffmod/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip
