# Generic cyanogenmod product
PRODUCT_NAME := cyanogen
PRODUCT_BRAND := cyanogen
PRODUCT_DEVICE := generic

PRODUCT_PACKAGES += ADWLauncher

ifdef CYANOGEN_NIGHTLY
PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=cyanogenmodnightly
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=cyanogenmod
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
    CMStats \
    CMUpdateNotify \
    DSPManager \
    libcyanogen-dsp \
    Pacman

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
    PRODUCT_COPY_FILES += \
        vendor/pffmod/proprietary/CarHomeGoogle.apk:./system/app/CarHomeGoogle.apk \
        vendor/pffmod/proprietary/CarHomeLauncher.apk:./system/app/CarHomeLauncher.apk \
        vendor/pffmod/proprietary/Facebook.apk:./system/app/Facebook.apk \
        vendor/pffmod/proprietary/GenieWidget.apk:./system/app/GenieWidget.apk \
        vendor/pffmod/proprietary/Gmail.apk:./system/app/Gmail.apk \
        vendor/pffmod/proprietary/GoogleBackupTransport.apk:./system/app/GoogleBackupTransport.apk \
        vendor/pffmod/proprietary/GoogleCalendarSyncAdapter.apk:./system/app/GoogleCalendarSyncAdapter.apk \
        vendor/pffmod/proprietary/GoogleContactsSyncAdapter.apk:./system/app/GoogleContactsSyncAdapter.apk \
        vendor/pffmod/proprietary/GoogleFeedback.apk:./system/app/GoogleFeedback.apk \
        vendor/pffmod/proprietary/GooglePartnerSetup.apk:./system/app/GooglePartnerSetup.apk \
        vendor/pffmod/proprietary/GoogleQuickSearchBox.apk:./system/app/GoogleQuickSearchBox.apk \
        vendor/pffmod/proprietary/GoogleServicesFramework.apk:./system/app/GoogleServicesFramework.apk \
        vendor/pffmod/proprietary/HtcCopyright.apk:./system/app/HtcCopyright.apk \
        vendor/pffmod/proprietary/HtcEmailPolicy.apk:./system/app/HtcEmailPolicy.apk \
        vendor/pffmod/proprietary/HtcSettings.apk:./system/app/HtcSettings.apk \
        vendor/pffmod/proprietary/LatinImeTutorial.apk:./system/app/LatinImeTutorial.apk \
        vendor/pffmod/proprietary/Maps.apk:./system/app/Maps.apk \
        vendor/pffmod/proprietary/MarketUpdater.apk:./system/app/MarketUpdater.apk \
        vendor/pffmod/proprietary/MediaUploader.apk:./system/app/MediaUploader.apk \
        vendor/pffmod/proprietary/NetworkLocation.apk:./system/app/NetworkLocation.apk \
        vendor/pffmod/proprietary/OneTimeInitializer.apk:./system/app/OneTimeInitializer.apk \
        vendor/pffmod/proprietary/PassionQuickOffice.apk:./system/app/PassionQuickOffice.apk \
        vendor/pffmod/proprietary/SetupWizard.apk:./system/app/SetupWizard.apk \
        vendor/pffmod/proprietary/Street.apk:./system/app/Street.apk \
        vendor/pffmod/proprietary/Talk.apk:./system/app/Talk.apk \
        vendor/pffmod/proprietary/Twitter.apk:./system/app/Twitter.apk \
        vendor/pffmod/proprietary/Vending.apk:./system/app/Vending.apk \
        vendor/pffmod/proprietary/VoiceSearch.apk:./system/app/VoiceSearch.apk \
        vendor/pffmod/proprietary/YouTube.apk:./system/app/YouTube.apk \
        vendor/pffmod/proprietary/googlevoice.apk:./system/app/googlevoice.apk \
        vendor/pffmod/proprietary/kickback.apk:./system/app/kickback.apk \
        vendor/pffmod/proprietary/soundback.apk:./system/app/soundback.apk \
        vendor/pffmod/proprietary/talkback.apk:./system/app/talkback.apk \
        vendor/pffmod/proprietary/com.google.android.maps.xml:./system/etc/permissions/com.google.android.maps.xml \
        vendor/pffmod/proprietary/features.xml:./system/etc/permissions/features.xml \
        vendor/pffmod/proprietary/com.google.android.maps.jar:./system/framework/com.google.android.maps.jar \
        vendor/pffmod/proprietary/libspeech.so:./system/lib/libspeech.so
else
    PRODUCT_PACKAGES += \
        Provision \
        GoogleSearch \
        LatinIME
endif
