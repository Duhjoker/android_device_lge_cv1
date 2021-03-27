#
# Copyright (C) 2016 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/lge/cv1/cv1-vendor.mk)

# common msm8937
$(call inherit-product, device/lge/cv1-common/cv1.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# System properties
-include $(LOCAL_PATH)/system_prop.mk

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# Fingerprint
PRODUCT_PACKAGES += \
    fingerprintd

# FM
PRODUCT_PACKAGES += \
    FM2 \
    FMRecord \
    libqcomfm_jni

# Init
PRODUCT_PACKAGES += \
    fstab.qcom

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:system/etc/sensors/hals.conf \
    $(LOCAL_PATH)/configs/sensors/sensor_def_common.conf:system/etc/sensors/sensor_def_common.conf \
    $(LOCAL_PATH)/configs/sensors/sensor_def_variable.conf:system/etc/sensors/sensor_def_variable.conf

# Thermal Configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/thermal-engine-8937.conf:system/etc/thermal-engine-8937.conf

# WCNSS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv_boot.bin

# UBPorts config files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/system/halium/70-tenshi.rules:system/halium/lib/udev/rules.d/70-android.rules \
    $(LOCAL_PATH)/system/halium/tenshi.conf:system/halium/etc/ubuntu-touch-session.d/tenshi.conf \
    $(LOCAL_PATH)/system/halium/fix_pulseaudio.sh:system/halium/usr/share/fixup/fix_pulseaudio.sh \
    $(LOCAL_PATH)/system/halium/fix_prop.sh:system/halium/usr/share/fixup/fix_prop.sh \
    $(LOCAL_PATH)/system/halium/libs/libizat_core.so:system/halium/lib/libizat_core.so \
    $(LOCAL_PATH)/system/halium/libs/libOmxVdec.so:system/halium/lib/libOmxVdec.so \
    $(LOCAL_PATH)/system/halium/switch:system/halium/usr/share/h2w/switch \
    $(LOCAL_PATH)/system/halium/droid-hcismd-up.sh:system/halium/usr/share/bluetooth-touch/tenshi \
    $(LOCAL_PATH)/system/halium/wifi_up.sh:system/halium/usr/share/bluetooth-touch/wifi_tenshi \
    $(LOCAL_PATH)/system/halium/apparmor.d/local/usr.bin.media-hub-server:system/halium/etc/apparmor.d/local/usr.bin.media-hub-server \
    $(LOCAL_PATH)/system/halium/apparmor.d/abstractions/base:system/halium/etc/apparmor.d/abstractions/base \
    $(LOCAL_PATH)/system/halium/ofono.override:system/halium/etc/init/ofono.override \
    $(LOCAL_PATH)/system/halium/unblock_wakelock.sh:system/halium/etc/unblock_wakelock.sh \
    $(LOCAL_PATH)/system/halium/timekeeper.conf:system/halium/etc/init/timekeeper.conf \
    $(LOCAL_PATH)/system/halium/charger/images/battery_fail.png:system/halium/charger/images/battery_fail.png \
    $(LOCAL_PATH)/system/halium/charger/images/battery_scale.png:system/halium/charger/images/battery_scale.png \
    $(LOCAL_PATH)/system/halium/wlan_restart.py:system/halium/usr/share/fixup/wlan_restart/wlan_restart.py \
    $(LOCAL_PATH)/system/halium/mtp-state.conf:system/halium/etc/init/mtp-state.conf \
    $(LOCAL_PATH)/system/halium/setupusb:system/halium/usr/share/usbinit/setupusb \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.qti_bsp.abi=1 \
    ubuntu.widi.supported=1 \
    ro.qc.sensors.wl_dis=true \

# Ubuntu
PRODUCT_PACKAGES += \
    libubuntu_application_api \
    direct_ubuntu_application_sensors_c_api_for_hybris_test \
    direct_ubuntu_application_sensors_for_hybris_test \
    direct_ubuntu_application_gps_c_api_for_hybris_test \
    libcameraservice \
    libdroidmedia \
    libcamera_compat_layer \
    camera_service \
    gst-droid \
    libmedia_compat_layer \
    libui_compat_layer \
    libsf_compat_layer \
    minimediaservice \
    minisfservice \
    libminisf \
    libaudioflingerglue \
    miniafservice

#PRODUCT_PACKAGES += \
    charger_res_images

# Droidmedia
MINIMEDIA_SENSORSERVER_DISABLE := 1

# telepathy-ofono quirks
PRODUCT_PROPERTY_OVERRIDES += \
    ro.t-o.quirk.forcesink=sink.primary_output \
    ro.t-o.quirk.forcesource=source.primary_input \
