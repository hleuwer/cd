PROJNAME = cd
LIBNAME = cdlua

OPT = YES

SRCDIR = lua5
SRC = cdlua5.c cdvoid5.c cdlua5ctx.c cdlua5_active.c cdlua5_canvas.c
DEF_FILE = cdlua5.def

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
USE_CD = YES
CD = ..
