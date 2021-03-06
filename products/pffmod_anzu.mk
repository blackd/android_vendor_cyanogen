# Inherit device configuration for anzu.
$(call inherit-product, device/semc/anzu/device_anzu.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/pffmod/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/pffmod/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := pffmod_anzu
PRODUCT_BRAND := SEMC
PRODUCT_DEVICE := anzu
PRODUCT_MODEL := LT15i
PRODUCT_MANUFACTURER := Sony Ericsson
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=LT15i BUILD_ID=3.0.1.A.0.145 BUILD_FINGERPRINT=SEMC/LT15i_1247-1061/LT15i:2.3.3/3.0.1.A.0.145/bn_P:user/release-keys PRIVATE_BUILD_DESC="LT15i-user 2.3.3 3.0.1.A.0.145 bn_P test-keys"

# Build kernel
#PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-msm
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=cyanogen_anzu_defconfig

# Extra anzu overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/pffmod/overlay/anzu

# Add the Torch app
PRODUCT_PACKAGES += Torch


# BCM FM radio
#$(call inherit-product, vendor/pffmod/products/bcm_fm_radio.mk)

# Release name and versioning
PRODUCT_RELEASE_NAME := XperiaArc-LT15i
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/pffmod/products/common_versions.mk

#
# Copy passion specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/pffmod/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
