# Minimal AOSP device.mk for Pixel 4a (sunfish)

LOCAL_PATH := device/google/sunfish

PRODUCT_VENDOR_MOVE_ENABLED := true
PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_MANUFACTURER := Google
PRODUCT_BRAND := Android
PRODUCT_NAME := aosp_sunfish
PRODUCT_DEVICE := sunfish
PRODUCT_MODEL := AOSP on sunfish

# Include only essential makefiles
$(call inherit-product, $(LOCAL_PATH)/utils.mk)

# Required properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.oem_unlock_supported=1 \
    ro.control_privapp_permissions=enforce \
    ro.cp_system_other_odex=1 \
    ro.opengles.version=196610 \
    persist.radio.reboot_on_modem_change=false

# Copy essential configuration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.hardware:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.sunfish \
    $(LOCAL_PATH)/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc \
    $(LOCAL_PATH)/init.hardware.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.sunfish.rc

# A/B OTA support (required for Pixel devices)
PRODUCT_PACKAGES += \
    update_engine \
    update_verifier \
    otapreopt_script \
    cppreopts.sh \
    checkpoint_gc \
    update_engine_sideload

# Boot control HAL (mandatory for A/B)
PRODUCT_PACKAGES += \
    bootctrl.sm6150 \
    android.hardware.boot@1.2-impl-pixel-legacy

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-service

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    device/google/sunfish
