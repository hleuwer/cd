PROJNAME = cd
LIBNAME = cdluapdf

OPT = YES

SRCDIR = lua5
SRC = cdluapdf5.c
DEF_FILE = cdluapdf5.def

LIBS = cdpdf

ifdef USE_LUA_VERSION
  USE_LUA51:=
  USE_LUA52:=
  USE_LUA53:=
  ifeq ($(USE_LUA_VERSION), 53)
    USE_LUA53:=Yes
  endif
  ifeq ($(USE_LUA_VERSION), 52)
    USE_LUA52:=Yes
  endif
  ifeq ($(USE_LUA_VERSION), 51)
    USE_LUA51:=Yes
  endif
endif

ifdef USE_LUA53
  LUA_VER := 5.3
  LIBNAME := $(LIBNAME)53
else
ifdef USE_LUA52
  LUA_VER := 5.2
  LIBNAME := $(LIBNAME)52
else
  LUA_VER := 5.1
  USE_LUA51 = Yes
  LIBNAME := $(LIBNAME)51
endif
endif

# To not link with the Lua dynamic library in UNIX
NO_LUALINK = Yes
# To use a subfolder with the Lua version for binaries
LUAMOD_DIR = Yes
USE_CDLUA = YES
CD = ..

ifneq ($(findstring MacOS, $(TEC_UNAME)), )
  USE_CD = YES
  USE_CDLUA:=
  INCLUDES += ../include
  LDIR = ../lib/$(TEC_UNAME)
endif
