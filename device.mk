#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BOARD_BOOT_HEADER_VERSION := 3

# Inherit from sm8250-common
$(call inherit-product, device/xiaomi/sm8250-common/kona.mk)
$(call inherit-product, vendor/xiaomi/alioth/alioth-vendor.mk)

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_SHIPPING_API_LEVEL := 30

#Audio
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/xiaomi/alioth/audio,$(TARGET_COPY_OUT_VENDOR)/etc)

# Device-specific settings
PRODUCT_PACKAGES += \
    XiaomiDoze \
    XiaomiParts

PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/parts/privapp-permissions-parts.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-parts.xml\
     $(LOCAL_PATH)/doze/privapp-permissions-doze.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-doze.xml

# Keylayout
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl \
     $(LOCAL_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
     $(LOCAL_PATH)/keylayout/uinput-fpc.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/uinput-fpc.idc

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay 

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# NQ Client
PRODUCT_PACKAGES += \
    libchrome.vendor

#Octavi HALS
YOUR_HW_PLATFORM := sm8250

# Hardware
PRODUCT_BOARD_PLATFORM := $(YOUR_HW_PLATFORM)
PRODUCT_USES_QCOM_HARDWARE := true

# HALS
SRC_AUDIO_HAL_DIR := hardware/qcom-caf/$(YOUR_HW_PLATFORM)/audio
SRC_DISPLAY_HAL_DIR := hardware/qcom-caf/$(YOUR_HW_PLATFORM)/display
SRC_MEDIA_HAL_DIR := hardware/qcom-caf/$(YOUR_HW_PLATFORM)/media

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/qcom-caf/$(YOUR_HW_PLATFORM) \
    vendor/qcom/opensource/commonsys-intf/display

#Vulkan
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml
