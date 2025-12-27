LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := kawakami_fix
LOCAL_SRC_FILES := AntiDisk.cpp
LOCAL_LDLIBS := -llog
LOCAL_CPPFLAGS := -std=c++20 -fno-exceptions -fno-rtti
include $(BUILD_SHARED_LIBRARY)
