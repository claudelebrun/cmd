#
# Important
#
.EXPORT_ALL_VARIABLES:

# Windows is default host environment
ifeq ($(HOST),)
HOST = mingw32-windows
endif

# Build map files which includes source and asm code
FULL_MAP = yes

# Default to no PCH support
ifeq ($(ROS_USE_PCH),)
ROS_USE_PCH = no
endif

# uncomment if you use bochs and it displays only 30 rows
# BOCHS_30ROWS = yes

#
# Choose various options
#
ifeq ($(HOST),mingw32-linux)
NASM_FORMAT = win32
#PREFIX = mingw32-
PREFIX =
EXE_POSTFIX :=
EXE_PREFIX := ./
DLLTOOL = $(PREFIX)dlltool --as=$(PREFIX)as
#
# Do not change NASM_CMD to NASM because older versions of
# nasm doesn't like an environment variable NASM
#
NASM_CMD = nasm
DOSCLI =
FLOPPY_DIR = /mnt/floppy
SEP := /
PIPE :=
endif

ifeq ($(HOST),mingw32-windows)
NASM_FORMAT = win32
PREFIX =
EXE_PREFIX :=
EXE_POSTFIX := .exe
DLLTOOL = $(PREFIX)dlltool --as=$(PREFIX)as
#
# Do not change NASM_CMD to NASM because older versions of
# nasm doesn't like an environment variable NASM
#
NASM_CMD = nasmw
DOSCLI = yes
FLOPPY_DIR = A:
SEP := \$(EMPTY_VAR)
PIPE := -pipe
endif

# TOPDIR is used by make bootcd but not defined anywhere.  Usurp pointed out
# that it has the same meaning as PATH_TO_TOP.
TOPDIR = $(PATH_TO_TOP)

# Directory to build a bootable CD image in
BOOTCD_DIR=$(TOPDIR)/../bootcd/disk
LIVECD_DIR=$(TOPDIR)/../livecd/disk

ifeq ($(LIVECD_INSTALL),yes)
INSTALL_DIR=$(LIVECD_DIR)/reactos
else
# Use environment var ROS_INSTALL to override default install dir
ifeq ($(ROS_INSTALL),)
ifeq ($(HOST),mingw32-windows)
INSTALL_DIR = C:/reactos
else
INSTALL_DIR = $(PATH_TO_TOP)/reactos
endif
else
INSTALL_DIR = $(ROS_INSTALL)
endif
endif


CC = $(PREFIX)gcc
CXX = $(PREFIX)g++
HOST_CC = gcc
HOST_CXX = g++
HOST_AR = ar
HOST_NM = nm
LD = $(PREFIX)ld
NM = $(PREFIX)nm
OBJCOPY = $(PREFIX)objcopy
STRIP = $(PREFIX)strip
AS = $(PREFIX)gcc -c -x assembler-with-cpp
CPP = $(PREFIX)cpp
AR = $(PREFIX)ar
RC = $(PREFIX)windres
WRC = $(WINE_TOP)/tools/wrc/wrc
OBJCOPY = $(PREFIX)objcopy
OBJDUMP =$(PREFIX)objdump
TOOLS_PATH = $(PATH_TO_TOP)/tools
W32API_PATH = $(PATH_TO_TOP)/w32api
CP = $(TOOLS_PATH)/rcopy
RM = $(TOOLS_PATH)/rdel
RLINE = $(TOOLS_PATH)/rline
RMDIR = $(TOOLS_PATH)/rrmdir
RMKDIR = $(TOOLS_PATH)/rmkdir
RSYM = $(TOOLS_PATH)/rsym
RTOUCH = $(TOOLS_PATH)/rtouch
REGTESTS = $(TOOLS_PATH)/regtests
MC = $(TOOLS_PATH)/wmc/wmc
CABMAN = $(TOOLS_PATH)/cabman/cabman
WINEBUILD = $(TOOLS_PATH)/winebuild/winebuild
WINE2ROS = $(TOOLS_PATH)/wine2ros/wine2ros
XSLTPROC = xsltproc

STD_CFLAGS = -I$(PATH_TO_TOP)/include -I$(W32API_PATH)/include -pipe -march=i386 -D_M_IX86
STD_CPPFLAGS = $(STD_CFLAGS)
STD_ASFLAGS = -I$(PATH_TO_TOP)/include -I$(W32API_PATH)/include -D__ASM__ -D_M_IX86
STD_RCFLAGS = --include-dir $(PATH_TO_TOP)/include --include-dir $(W32API_PATH)/include
STD_NFLAGS = -f win32

# Developer Kits
DK_PATH=$(PATH_TO_TOP)/dk
# Native and kernel mode
DDK_PATH=$(DK_PATH)/nkm
DDK_PATH_LIB=$(DDK_PATH)/lib
DDK_PATH_INC=$(PATH_TO_TOP)/include
# Win32
SDK_PATH=$(DK_PATH)/w32
SDK_PATH_LIB=$(SDK_PATH)/lib
SDK_PATH_INC=$(PATH_TO_TOP)/include
# POSIX+
XDK_PATH=$(DK_PATH)/psx
XDK_PATH_LIB=$(XDK_PATH)/lib
XDK_PATH_INC=$(XDK_PATH)/include

# Wine Integration
WINE_PATH=$(PATH_TO_TOP)/../wine
WINE_PATH_LIB=$(WINE_PATH)/lib
WINE_PATH_INC=$(WINE_PATH)/include

# Posix+ Integration
POSIX_PATH=$(PATH_TO_TOP)/../posix
POSIX_PATH_LIB=$(POSIX_PATH)/lib
POSIX_PATH_INC=$(POSIX_PATH)/include

# OS/2 Integration
OS2_PATH=$(PATH_TO_TOP)/../os2
OS2_PATH_LIB=$(OS2_PATH)/lib
OS2_PATH_INC=$(OS2_PATH)/include

# Other systems integration
ROOT_PATH=$(PATH_TO_TOP)/..
REGTESTS_PATH_INC=$(PATH_TO_TOP)/regtests/shared

