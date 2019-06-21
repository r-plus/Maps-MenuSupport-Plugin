ARCHS = arm64 arm64e
TARGET = iphone:clang:10.3:11.0

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = Maps
Maps_FILES = Maps.m
Maps_INSTALL_PATH = /Library/MenuSupport/Plugins/
Maps_FRAMEWORKS = UIKit

include $(THEOS)/makefiles/library.mk
