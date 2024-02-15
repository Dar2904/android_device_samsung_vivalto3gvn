# Copyright (C) 2011 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for manta hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and manta, hence its name.

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# must be before including omni part
TARGET_BOOTANIMATION_SIZE := 320x181

# Inherit from our custom product configuration
$(call inherit-product, vendor/du/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/vivalto3gvn/device_vivalto3gvn.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
	device/samsung/vivalto3gvn/overlay \

# Override build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Device identifier
PRODUCT_DEVICE := vivalto3gvn
PRODUCT_NAME := du_vivalto3gvn
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-G313HZ
PRODUCT_MANUFACTURER := samsung
PRODUCT_CHARACTERISTICS := phone
