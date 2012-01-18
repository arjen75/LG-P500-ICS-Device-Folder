$(call inherit-product, build/target/product/full.mk)
$(call inherit-product, build/target/product/languages_full.mk)
$(call inherit-product-if-exists, vendor/lge/p500/thunderg-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/p500/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lge/p500/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Keylayouts
PRODUCT_COPY_FILES += \
    vendor/lge/p500/proprietary/thunder_keypad.kl:system/usr/keylayout/thunder_keypad.kl \
    vendor/lge/p500/proprietary/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    vendor/lge/p500/proprietary/thunder_keypad.kcm.bin:system/usr/keychars/thunder_keypad.kcm.bin \

PRODUCT_COPY_FILES += \
    device/lge/p500/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/lge/p500/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/lge/p500/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/lge/p500/prebuilt/etc/nvram.txt:system/etc/wl/nvram.txt \
    device/lge/p500/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
    device/lge/p500/prebuilt/etc/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/lge/p500/prebuilt/etc/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \

# BT startup
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/init.qcom.bt.sh:system/bin/init.qcom.bt.sh

 # Board-specific init

# Board-specific init
PRODUCT_COPY_FILES += \
    vendor/lge/p500/proprietary/init.thunderg.rc:root/init.thunderg.rc \
    vendor/lge/p500/proprietary/initlogo.rle:root/initlogo.rle \
    vendor/lge/p500/proprietary/ueventd.thunderg.rc:root/ueventd.thunderg.rc \

# OFFLINE CHARGING
PRODUCT_COPY_FILES += \
    device/lge/p500/bootlogo/bootlogo:root/sbin/bootlogo \
    device/lge/p500/bootlogo/bootimages/opening_01.rle:root/bootimages/opening_01.rle \
    device/lge/p500/bootlogo/bootimages/opening_02.rle:root/bootimages/opening_02.rle \
    device/lge/p500/bootlogo/bootimages/opening_03.rle:root/bootimages/opening_03.rle \
    device/lge/p500/bootlogo/bootimages/opening_04.rle:root/bootimages/opening_04.rle \
    device/lge/p500/bootlogo/bootimages/opening_05.rle:root/bootimages/opening_05.rle \
    device/lge/p500/bootlogo/bootimages/opening_06.rle:root/bootimages/opening_06.rle \
    device/lge/p500/bootlogo/bootimages/opening_07.rle:root/bootimages/opening_07.rle \
    device/lge/p500/bootlogo/bootimages/opening_08.rle:root/bootimages/opening_08.rle \
    device/lge/p500/chargemode/chargerlogo:root/sbin/chargerlogo \
    device/lge/p500/chargemode/chargerimages/black_bg.rle:root/chargerimages/black_bg.rle \
    device/lge/p500/chargemode/chargerimages/battery_bg.rle:root/chargerimages/battery_bg.rle \
    device/lge/p500/chargemode/chargerimages/battery_ani_01.rle:root/chargerimages/battery_ani_01.rle \
    device/lge/p500/chargemode/chargerimages/battery_ani_02.rle:root/chargerimages/battery_ani_02.rle \
    device/lge/p500/chargemode/chargerimages/battery_ani_03.rle:root/chargerimages/battery_ani_03.rle \
    device/lge/p500/chargemode/chargerimages/battery_ani_04.rle:root/chargerimages/battery_ani_04.rle \
    device/lge/p500/chargemode/chargerimages/battery_ani_05.rle:root/chargerimages/battery_ani_05.rle \
    device/lge/p500/chargemode/chargerimages/battery_charging_01.rle:root/chargerimages/battery_charging_01.rle \
    device/lge/p500/chargemode/chargerimages/battery_charging_02.rle:root/chargerimages/battery_charging_02.rle \
    device/lge/p500/chargemode/chargerimages/battery_charging_03.rle:root/chargerimages/battery_charging_03.rle \
    device/lge/p500/chargemode/chargerimages/battery_charging_04.rle:root/chargerimages/battery_charging_04.rle \
    device/lge/p500/chargemode/chargerimages/battery_charging_05.rle:root/chargerimages/battery_charging_05.rle \
    device/lge/p500/chargemode/chargerimages/battery_charging_06.rle:root/chargerimages/battery_charging_06.rle \
    device/lge/p500/chargemode/chargerimages/battery_wait_ani_01.rle:root/chargerimages/battery_wait_ani_01.rle \
    device/lge/p500/chargemode/chargerimages/battery_wait_ani_02.rle:root/chargerimages/battery_wait_ani_02.rle \

# Backlight
PRODUCT_COPY_FILES += \
    vendor/lge/p500/proprietary/bin/tsdown:system/bin/tsdown \
    vendor/lge/p500/proprietary/etc/MELFAS_FIRM.bin:system/etc/MELFAS_FIRM.bin

# Sensors
PRODUCT_COPY_FILES += \
    vendor/lge/p500/proprietary/bin/ami304d:system/bin/ami304d \
    vendor/lge/p500/proprietary/lib/hw/sensors.thunderg.so:system/lib/hw/sensors.thunderg.so \
    

# 2D (using proprietary because of poor perfomance of open source libs)
#PRODUCT_COPY_FILES += \
#    vendor/lge/p500/proprietary/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \
#    vendor/lge/p500/proprietary/lib/hw/gralloc.thunderg.so:system/lib/hw/gralloc.thunderg.so \

# 3D
PRODUCT_COPY_FILES += \
    vendor/lge/p500/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/lge/p500/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/lge/p500/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    vendor/lge/p500/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/lge/p500/proprietary/lib/libgsl.so:system/lib/libgsl.so \
    vendor/lge/p500/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/lge/p500/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
#   device/lge/p500/prebuilt/lib/hw/gralloc.p500.so:system/lib/hw/gralloc.p500.so \
#   device/lge/p500/prebuilt/lib/libsurfaceflinger.so:system/lib/libsurfaceflinger.so \

# Camera
PRODUCT_COPY_FILES += \
    vendor/lge/p500/proprietary/lib/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/lge/p500/proprietary/lib/libmmipl.so:system/lib/libmmipl.so \
    vendor/lge/p500/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \

# Wifi
PRODUCT_COPY_FILES += \
    vendor/lge/p500/proprietary/lib/modules/wireless.ko:system/lib/modules/wireless.ko \
    vendor/lge/p500/proprietary/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    vendor/lge/p500/proprietary/etc/wl/nvram.txt:system/etc/wl/nvram.txt \
    vendor/lge/p500/proprietary/etc/dhcpd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    vendor/lge/p500/proprietary/etc/wl/rtecdc.bin:system/etc/wl/rtecdc.bin \
    vendor/lge/p500/proprietary/etc/wl/rtecdc-apsta.bin:system/etc/wl/rtecdc-apsta.bin \
    vendor/lge/p500/proprietary/etc/wl/rtecdc-mfgtest.bin:system/etc/wl/rtecdc-mfgtest.bin \
    vendor/lge/p500/proprietary/etc/firmware/wlan/cfg.dat:system/etc/firmware/wlan/cfg.dat \
    vendor/lge/p500/proprietary/etc/firmware/wlan/qcom_cfg.ini:system/etc/firmware/wlan/qcom_cfg.ini \
    vendor/lge/p500/proprietary/etc/firmware/wlan/qcom_fw.bin:system/etc/firmware/wlan/qcom_fw.bin \
    vendor/lge/p500/proprietary/bin/wl:system/bin/wl
    

# SD Card
PRODUCT_COPY_FILES += \
    vendor/lge/p500/proprietary/etc/vold.fstab:system/etc/vold.fstab

# Audio
PRODUCT_COPY_FILES += \
    vendor/lge/p500/proprietary/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    vendor/lge/p500/proprietary/lib/liba2dp.so:system/lib/liba2dp.so \
    vendor/lge/p500/proprietary/lib/liba2dp.so:obj/lib/liba2dp.so \
    vendor/lge/p500/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \
    vendor/lge/p500/proprietary/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# Device permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \

# LGE services
PRODUCT_COPY_FILES += \
    vendor/lge/p500/proprietary/bin/port-bridge:system/bin/port-bridge \
    vendor/lge/p500/proprietary/bin/qmuxd:system/bin/qmuxd \
    vendor/lge/p500/proprietary/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    vendor/lge/p500/proprietary/bin/rmt_storage:system/bin/rmt_storage \
    vendor/lge/p500/proprietary/bin/netmgrd:system/bin/netmgrd \
    vendor/lge/p500/proprietary/bin/wiperiface:system/bin/wiperiface \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.lge.vibrator_amp=125 \
    ro.sf.lcd_density=160 \
    persist.sys.use_16bpp_alpha

# RIL
PRODUCT_COPY_FILES += \
    vendor/lge/p500/proprietary/lib/libidl.so:system/lib/libidl.so \
    vendor/lge/p500/proprietary/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/lge/p500/proprietary/lib/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/lge/p500/proprietary/lib/libdsm.so:system/lib/libdsm.so \
    vendor/lge/p500/proprietary/lib/libqueue.so:system/lib/libqueue.so \
    vendor/lge/p500/proprietary/lib/libdiag.so:system/lib/libdiag.so \
    vendor/lge/p500/proprietary/lib/libauth.so:system/lib/libauth.so \
    vendor/lge/p500/proprietary/lib/libcm.so:system/lib/libcm.so \
    vendor/lge/p500/proprietary/lib/libnv.so:system/lib/libnv.so \
    vendor/lge/p500/proprietary/lib/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/lge/p500/proprietary/lib/libwms.so:system/lib/libwms.so \
    vendor/lge/p500/proprietary/lib/libwmsts.so:system/lib/libwmsts.so \
    vendor/lge/p500/proprietary/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/lge/p500/proprietary/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/lge/p500/proprietary/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/lge/p500/proprietary/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
    vendor/lge/p500/proprietary/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
    vendor/lge/p500/proprietary/lib/libsnd.so:system/lib/libsnd.so \
    vendor/lge/p500/proprietary/lib/libqmi.so:system/lib/libqmi.so \
    vendor/lge/p500/proprietary/lib/libdsutils.so:system/lib/libdsutils.so \
    vendor/lge/p500/proprietary/lib/libdll.so:system/lib/libdll.so \
    vendor/lge/p500/proprietary/lib/liblgeat.so:system/lib/liblgeat.so \
    vendor/lge/p500/proprietary/lib/liblgdrm.so:system/lib/liblgdrm.so \
    vendor/lge/p500/proprietary/lib/liblgdrmwbxml.so:system/lib/liblgdrmwbxml.so \
    vendor/lge/p500/proprietary/lib/liblgerft.so:system/lib/liblgerft.so \
    vendor/lge/p500/proprietary/lib/libbcmwl.so:system/lib/libbcmwl.so \
    vendor/lge/p500/proprietary/lib/libdss.so:system/lib/libdss.so \
    vendor/lge/p500/proprietary/lib/libril.so:system/lib/libril.so \
    vendor/lge/p500/proprietary/bin/rild:system/bin/rild \
    vendor/lge/p500/proprietary/bin/qmuxd:system/bin/qmuxd \

# OMX
#PRODUCT_COPY_FILES += \
#    vendor/lge/p500/proprietary/lib/libmm-omxcore.so:system/lib/libmm-omxcore.so \
#    vendor/lge/p500/proprietary/lib/libomx_aacdec_sharedlibrary.so:system/lib/libomx_aacdec_sharedlibrary.so \
#    vendor/lge/p500/proprietary/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
#    vendor/lge/p500/proprietary/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
#    vendor/lge/p500/proprietary/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \
#    vendor/lge/p500/proprietary/lib/libomx_amrdec_sharedlibrary.so:system/lib/libomx_amrdec_sharedlibrary.so \
#    vendor/lge/p500/proprietary/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
#    vendor/lge/p500/proprietary/lib/libomx_amrenc_sharedlibrary.so:system/lib/libomx_amrenc_sharedlibrary.so \
#    vendor/lge/p500/proprietary/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
#    vendor/lge/p500/proprietary/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
#    vendor/lge/p500/proprietary/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
#    vendor/lge/p500/proprietary/lib/libomx_avcdec_sharedlibrary.so:system/lib/libomx_avcdec_sharedlibrary.so \
#    vendor/lge/p500/proprietary/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
#    vendor/lge/p500/proprietary/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
#    vendor/lge/p500/proprietary/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
#    vendor/lge/p500/proprietary/lib/libomx_m4vdec_sharedlibrary.so:system/lib/libomx_m4vdec_sharedlibrary.so \
#    vendor/lge/p500/proprietary/lib/libomx_mp3dec_sharedlibrary.so:system/lib/libomx_mp3dec_sharedlibrary.so \
#    vendor/lge/p500/proprietary/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
#    vendor/lge/p500/proprietary/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
#    vendor/lge/p500/proprietary/lib/libomx_nextreaming_divxdec_sharedlibrary.so:system/lib/libomx_nextreaming_divxdec_sharedlibrary.so \
#    vendor/lge/p500/proprietary/lib/libomx_nextreaming_wmadec_sharedlibrary.so:system/lib/libomx_nextreaming_wmadec_sharedlibrary.so \
#    vendor/lge/p500/proprietary/lib/libomx_nextreaming_wmvdec_sharedlibrary.so:system/lib/libomx_nextreaming_wmvdec_sharedlibrary.so \
#    vendor/lge/p500/proprietary/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
#    vendor/lge/p500/proprietary/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
#    vendor/lge/p500/proprietary/lib/libomx_sharedlibrary.so:system/lib/libomx_sharedlibrary.so \
#    vendor/lge/p500/proprietary/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
#    vendor/lge/p500/proprietary/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
#    vendor/lge/p500/proprietary/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \
#    vendor/lge/p500/proprietary/lib/libqcomm_omx.so:system/lib/libqcomm_omx.so \
#    vendor/lge/p500/proprietary/lib/libstagefright_omx.so:system/lib/libstagefright_omx.so \
#    vendor/lge/p500/proprietary/lib/libopencore_common.so:system/lib/libopencore_common.so \

PRODUCT_COPY_FILES += \
    vendor/lge/p500/proprietary/lib/libmm-omxcore.so:system/lib/libmm-omxcore.so \
    vendor/lge/p500/proprietary/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/lge/p500/proprietary/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    vendor/lge/p500/proprietary/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    vendor/lge/p500/proprietary/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \
    vendor/lge/p500/proprietary/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    vendor/lge/p500/proprietary/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    vendor/lge/p500/proprietary/lib/libOmxCore.so:system/lib/libOmxCore.so \
    vendor/lge/p500/proprietary/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    vendor/lge/p500/proprietary/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    vendor/lge/p500/proprietary/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    vendor/lge/p500/proprietary/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    vendor/lge/p500/proprietary/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/lge/p500/proprietary/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    vendor/lge/p500/proprietary/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/lge/p500/proprietary/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    vendor/lge/p500/proprietary/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
    vendor/lge/p500/proprietary/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    vendor/lge/p500/proprietary/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    vendor/lge/p500/proprietary/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \



# Bluetooth
PRODUCT_COPY_FILES += \
    vendor/lge/p500/proprietary/bin/BCM4325D1_004.002.004.0218.0248.hcd:system/bin/BCM4325D1_004.002.004.0218.0248.hcd
    
# FONTS
PRODUCT_COPY_FILES += \
    vendor/lge/p500/proprietary/fonts/Noxchia.ttf:system/fonts/Noxchia.ttf

# IDC file
PRODUCT_COPY_FILES += \
    vendor/lge/p500/proprietary/touch_mcs6000.idc:system/usr/idc/touch_mcs6000.idc\
 vendor/lge/p500/proprietary/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

#hwcomposer shit
#PRODUCT_COPY_FILES += \
#    vendor/lge/p500/proprietary/lib/hw/hwcomposer.default.so:system/lib/hw/hwcomposer.default.so \
#    vendor/lge/p500/proprietary/lib/libsensorservice.so:system/lib/libsensorservice.so 


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := thunderg
PRODUCT_BRAND := LGE
PRODUCT_DEVICE := thunderg
PRODUCT_MODEL := LG-P500
PRODUCT_MANUFACTURER := LGE
