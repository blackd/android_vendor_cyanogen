# Inherit AOSP device configuration for generic target
$(call inherit-product, build/target/product/full.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/pffmod/products/common_full.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_generic
PRODUCT_BRAND := cyanogenmod
PRODUCT_DEVICE := generic
PRODUCT_MODEL := pffmod
PRODUCT_MANUFACTURER := pffmod

#
# Move dalvik cache to data partition where there is more room to solve startup problems
#
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.dexopt-data-only=1

# Generic modversion
ro.modversion=pffmod-7
