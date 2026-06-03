#!/bin/sh
help()
{
  echo "usage: build.sh help | mac | linux"
}

case "$1" in
    "help")
	help
	exit 0
     ;;
    "mac")
	case "$2" in
	    "gtk3")
	    	make USE_NODEPEND=Yes LUA_LIB=/usr/local/lib USE_GTK3=Yes GTK_MAC=Yes GTK_QUARTZ=Yes USE_PKGCONFIG=Yes EXCLUDE_TARGETS=""
	    ;;
	    "gtk2")
	    	make USE_NODEPEND=Yes  USE_GTK2=Yes GTK_MAC=Yes USE_PKGCONFIG=Yes EXCLUDE_TARGETS=""
		;;
	esac
	exit 0
    ;;
    "linux")
	case "$2" in
	    "gtk3")
		make LUA_BIN=/usr/bin LUA_INC=/usr/include/lua5.2 LUA_LIB="/usr/lib/x86_64-linux-gnu" USE_GTK3=Yes USE_PKGCONFIG=Yes EXCLUDE_TARGETS="" 
	    ;;
	    "gtk2")
		make LUA_BIN=/usr/bin LUA_INC=/usr/include/lua5.2 LUA_LIB="/usr/lib/x86_64-linux-gnu" USE_GTK2=Yes USE_PKGCONFIG=Yes EXCLUDE_TARGETS="" 
	    ;;
	esac
	exit 0
    ;;
    "")
	help
	exit 0
    ;;
esac


