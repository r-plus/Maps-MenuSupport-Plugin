ARCHS = armv7 arm64 arm64e
TARGET = iphone:clang:10.3:8.0

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = Maps
Maps_FILES = Maps.m
Maps_INSTALL_PATH = /Library/ActionMenu/Plugins/
Maps_FRAMEWORKS = UIKit

include $(THEOS)/makefiles/library.mk
