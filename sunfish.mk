#
# Copyright 2016 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, device/google/sunfish/hentai_common.mk)
$(call inherit-product, device/google/sunfish/device-sunfish.mk)

# Inherit some common hentai stuff.
$(call inherit-product, vendor/hentai/config/common_full_phone.mk)

PRODUCT_MANUFACTURER := Google
PRODUCT_BRAND := google
PRODUCT_NAME := sunfish
PRODUCT_DEVICE := sunfish
PRODUCT_MODEL := Pixel 4a

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080
TARGET_BOOT_ANIMATION_RES := 1080


PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="sunfish-user 13 TQ3A.230805.001.S1 10786265 release-keys" \
    BuildFingerprint=google/sunfish/sunfish:13/TQ3A.230805.001.S1/10786265:user/release-keys \
    DeviceProduct=sunfish

$(call inherit-product, vendor/google/sunfish/sunfish-vendor.mk)
