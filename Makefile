# 设置THEOS变量为/theos目录
export THEOS = /var/mobile/theos

# 指定架构为arm64
ARCHS = arm64

# 调试标志关闭
DEBUG = 0

# 最终包标志设置为1
FINALPACKAGE = 1

# 发布标志设置为1
FOR_RELEASE = 1

# 定义包方案为rootless
THEOS_PACKAGE_SCHEME = rootless

# 引入共享的Makefile规则
include $(THEOS)/makefiles/common.mk

# 定义tweak的名称
TWEAK_NAME = 34306jit

# 指定要链接的框架
$(TWEAK_NAME)_FRAMEWORKS = UIKit Foundation Security QuartzCore CoreGraphics CoreText AVFoundation Accelerate GLKit SystemConfiguration GameController

# 设置编译标志
$(TWEAK_NAME)_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value

# 添加dobby hook
$(TWEAK_NAME)_OBJ_FILES = 5Toubun/libdobby.a

# 指定源文件
$(TWEAK_NAME)_FILES = ImGuiDrawView.mm $(wildcard Esp/*.mm) $(wildcard Esp/*.m) $(wildcard IMGUI/*.cpp) $(wildcard IMGUI/*.mm)

# 引入tweak.mk文件来构建tweak
include $(THEOS_MAKEFILE_PATH)/tweak.mk
