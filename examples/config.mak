PROJNAME = emf2pdf
APPNAME = emf2pdf
APPTYPE = console

USE_CD = Yes
USE_STATIC = Yes
CD = ..

SRC = emf2pdf.c
LIBS += glib-2.0
ifneq ($(findstring Win, $(TEC_SYSNAME)), )
  LIBS += cdpdflib
else
#  SLIB += $(CD)/lib/$(TEC_UNAME)/libcdpdflib.a
endif
