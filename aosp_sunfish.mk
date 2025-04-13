# Copyright 2019 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0
# http://www.apache.org/licenses/LICENSE-2.0

# Inherit the common 64-bit config
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_system.mk)

# Enforce strict artifact path rules
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := strict

# Include basic AOSP product definitions
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_product.mk)

# Inherit device-specific configuration
$(call inherit-product, device/google/sunfish/device.mk)
$(call inherit-product-if-exists, vendor/google/sunfish/sunfish-vendor.mk)

# Disable super image if not needed
PRODUCT_BUILD_SUPER_PARTITION := false

# Enable VNDK on /vendor for non-REL platforms
ifneq (REL,$(PLATFORM_VERSION_CODENAME))
  PRODUCT_PACKAGES += com.android.vndk.current.on_vendor
endif

# Device properties
PRODUCT_MANUFACTURER := Google
PRODUCT_BRAND := Android
PRODUCT_NAME := aosp_sunfish
PRODUCT_DEVICE := sunfish
PRODUCT_MODEL := Pixel 4a
