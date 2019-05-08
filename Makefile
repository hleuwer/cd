# Installation items
APPS = $(shell cat apps.list)
SLIBS = $(shell cat slib.list)
DLIBS = $(shell cat dlib.list)

.PHONY: do_all

do_all:
	@$(MAKE) --no-print-directory -C ./src/ do_all

sysinfo:
	@$(MAKE) --no-print-directory -C ./src

.PHONY: clean clean-target clean-obj install install-app install-slib install-dlib install-mod uninstall install-list

clean clean-target clean-obj:
	for i in $(SUBDIRS); \
	do \
	  cd $$i; $(MAKE)  -f ../tecmake.mak $@; cd ..; \
	done

install: install-app install-slib install-dlib install-mod

install-app: apps.list
	@echo "Installing applications ..."
	@for i in $(APPS); do cp -f $$i $(INSTALL_BINDIR); done

install-slib: slib.list
	@echo "Installing static libraries ..."
	@for i in $(SLIBS); do cp -f $$i $(INSTALL_LIBDIR); done

install-dlib: dlib.list
	@echo "Installing dynamic libraries ..."
	@for i in $(DLIBS); do cp -f $$i $(INSTALL_LIBDIR); done

install-mod: mods51.list mods52.list mods53.list
	@echo "Installing Lua modules ..."
	@for i in $(shell cat mods51.list); do cp -f lib/MacOS1014/Lua51/lib$$i $(INSTALL_MODDIR)/5.1/$$i; done
	@for i in $(shell cat mods52.list); do cp -f lib/MacOS1014/Lua52/lib$$i $(INSTALL_MODDIR)/5.2/$$i; done
	@for i in $(shell cat mods53.list); do cp -f lib/MacOS1014/Lua53/lib$$i $(INSTALL_MODDIR)/5.3/$$i; done

install-list:
	@echo "Generating installation item lists ..."
	@find . -name "*.dylib" > dlib.list
	@cd lib/MacOS1014/Lua51 && ls *.so | sed -s s/lib//1 > ../../../mods51.list
	@cd lib/MacOS1014/Lua52 && ls *.so | sed -s s/lib//1 > ../../../mods52.list
	@cd lib/MacOS1014/Lua53 && ls *.so | sed -s s/lib//1 > ../../../mods53.list
	@find bin/MacOS1014 -type f > apps.list
	@find . -name "*.a" > slib.list

uninstall-app:
	@for i in $(APPS); do rm $(INSTALL_BINDIR)/`basename $$i`; done

uninstall-slib:
	@for i in $(SLIBS); do rm $(INSTALL_LIBDIR)/`basename $$i`; done

uninstall-dlib:
	@for i in $(DLIBS); do rm $(INSTALL_LIBDIR)/`basename $$i`; done

uninstall-mod:
	@for i in $(shell cat mods51.list); do rm $(INSTALL_MODDIR)/5.1/`basename $$i`; done
	@for i in $(shell cat mods52.list); do rm $(INSTALL_MODDIR)/5.2/`basename $$i`; done
	@for i in $(shell cat mods53.list); do rm $(INSTALL_MODDIR)/5.3/`basename $$i`; done
