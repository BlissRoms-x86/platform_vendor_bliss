# Minimal added packages option
ifneq ($(BLISS_SUPER_VANILLA), true)

# AOSP packages
ifeq ($(BLISS_BUILD_VARIANT), vanilla)
PRODUCT_PACKAGES += \
    Email \
    Etar \
    ExactCalculator \
    Exchange2
endif

ifeq ($(BLISS_BUILD_VARIANT), foss)
PRODUCT_PACKAGES += \
    Etar \
    ExactCalculator \
    Exchange2
endif

# END Minimal added packages
endif

# Bliss Packages
PRODUCT_PACKAGES += \
    DeskClock \
    LatinIME \
    Recorder \
    LineageParts \
    LineageSettingsProvider \
    Profiles \
    BlissUpdater \
    Seedvault \
    WallpaperPicker2 \
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

# Themes
PRODUCT_PACKAGES += \
    LineageThemesStub \
    LineageBlackTheme \
    ThemePicker

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Bliss Ethernet Manager
PRODUCT_PACKAGES += \
    BlissEthernetManagerApp
