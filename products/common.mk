# Generic pffmod product
PRODUCT_NAME := cyanogen
PRODUCT_BRAND := cyanogen
PRODUCT_DEVICE := generic

PRODUCT_PACKAGES += ADWLauncher

ifdef CYANOGEN_NIGHTLY
PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=pffmodnightly
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=pffmod
endif

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Used by BusyBox
KERNEL_MODULES_DIR:=/system/lib/modules

# Tiny toolbox
TINY_TOOLBOX:=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# pffmod specific product packages
PRODUCT_PACKAGES += \
    AndroidTerm \
    FileManager \
    CMParts \
    DSPManager \
    libcyanogen-dsp \
    Pacman \
    screenshot \
    CMScreenshot

# Extra tools in pffmod
PRODUCT_PACKAGES += \
    openvpn

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
    vendor/pffmod/CHANGELOG.mkdn:system/etc/CHANGELOG-CM.txt

# Common CM overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/pffmod/overlay/common

# T-Mobile theme engine
include vendor/pffmod/products/themes_common.mk

PRODUCT_COPY_FILES += \
    vendor/pffmod/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/pffmod/prebuilt/common/bin/modelid_cfg.sh:system/bin/modelid_cfg.sh \
    vendor/pffmod/prebuilt/common/bin/verify_cache_partition_size.sh:system/bin/verify_cache_partition_size.sh \
    vendor/pffmod/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf \
    vendor/pffmod/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/pffmod/prebuilt/common/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    vendor/pffmod/prebuilt/common/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \
    vendor/pffmod/prebuilt/common/etc/profile:system/etc/profile \
    vendor/pffmod/prebuilt/common/etc/init.local.rc:system/etc/init.local.rc \
    vendor/pffmod/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/pffmod/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/pffmod/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    vendor/pffmod/prebuilt/common/etc/init.d/04modules:system/etc/init.d/04modules \
    vendor/pffmod/prebuilt/common/etc/init.d/05mountsd:system/etc/init.d/05mountsd \
    vendor/pffmod/prebuilt/common/etc/init.d/06mountdl:system/etc/init.d/06mountdl \
    vendor/pffmod/prebuilt/common/etc/init.d/20userinit:system/etc/init.d/20userinit \
    vendor/pffmod/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache \
    vendor/pffmod/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/pffmod/prebuilt/common/bin/fix_permissions:system/bin/fix_permissions \
    vendor/pffmod/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/pffmod/prebuilt/common/xbin/htop:system/xbin/htop \
    vendor/pffmod/prebuilt/common/xbin/irssi:system/xbin/irssi \
    vendor/pffmod/prebuilt/common/xbin/powertop:system/xbin/powertop \
    vendor/pffmod/prebuilt/common/xbin/openvpn-up.sh:system/xbin/openvpn-up.sh

PRODUCT_COPY_FILES += \
#    vendor/pffmod/prebuilt/common/etc/init.d/10apps2sd:system/etc/init.d/10apps2sd

PRODUCT_COPY_FILES +=  \
    vendor/pffmod/proprietary/RomManager.apk:system/app/RomManager.apk \

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Always run in insecure mode, enables root on user build variants
#ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0

ifdef CYANOGEN_WITH_GOOGLE

    # use all present proprietary apk
    PRODUCT_COPY_FILES += $(shell test -f vendor/pffmod/proprietary/*.apk && \
	find vendor/pffmod/proprietary -name '*.apk' \
	-printf '%p:system/app/%f ')

    # use all present proprietary lib
    PRODUCT_COPY_FILES += $(shell test -f vendor/pffmod/proprietary/*.so && \
	find vendor/pffmod/proprietary -name '*.so' \
	-printf '%p:system/lib/%f ')

    # use all present proprietary jar
    PRODUCT_COPY_FILES += $(shell test -f vendor/pffmod/proprietary/*.jar && \
	find vendor/pffmod/proprietary -name '*.jar' \
	-printf '%p:system/framework/%f ')

    # use all present proprietary xml (permissions)
    PRODUCT_COPY_FILES += $(shell test -f vendor/pffmod/proprietary/*.xml && \
	find vendor/pffmod/proprietary -name '*.xml' \
	-printf '%p:system/etc/permissions/%f ')

else
    PRODUCT_PACKAGES += \
        Provision \
        GoogleSearch
endif

# Required, keyboard
PRODUCT_PACKAGES += LatinIME

