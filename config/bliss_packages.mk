# World APN list
PRODUCT_PACKAGES += \
    apns-conf.xml
# Minimal added packages option
ifneq ($(BLISS_SUPER_VANILLA), true)

# AOSP packages
ifeq ($(BLISS_BUILD_VARIANT), vanilla)
PRODUCT_PACKAGES += \
    Etar \
    Exchange2 \
    messaging \

endif

ifeq ($(BLISS_BUILD_VARIANT), foss)
PRODUCT_PACKAGES += \
    Etar \
    Exchange2 \
    messaging \

endif

else

PRODUCT_PACKAGES += \
    htop \
#     Contacts \
#     Dialer \
#     SimpleGalleryPro

# END Minimal added packages
endif

# Bliss Packages
PRODUCT_PACKAGES += \
    LatinIME \
    Recorder \
    LineageParts \
    LineageSettingsProvider \
    Profiles \
    BlissUpdater \
    Seedvault \
    OmniStyle \
    GameSpace \
    OmniJaws

# Config
PRODUCT_PACKAGES += \
    SimpleDeviceConfig

# Dex preopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI \
    TrebuchetQuickStep

# Extra tools in bliss
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    getcap \
    htop \
    lib7z \
    nano \
    pigz \
    setcap \
    unrar \
    vim \
    zip

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# These packages are excluded from user builds
PRODUCT_PACKAGES_DEBUG += \
    procmem

# Telephony packages
PRODUCT_PACKAGES += \
    Stk

# Themes
PRODUCT_PACKAGES += \
    LineageThemesStub \
    LineageBlackTheme \
    ThemePicker

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    VisualizationWallpapers \
    librs_jni
