.PHONY: libnewld
libnewld:
	dmd -oflibnewld.so -shared $(wildcard libnewld/*.d)

.PHONY: libtool
libtool:
	dmd -oflibtool.so -shared $(wildcard libtool/*.d)

.PHONY: all
all:
	dmd -ofmold.elf $(wildcard libnewld/*.d) $(wildcard src/*.d)

.PHONY: clean
clean:
	rm -f mold.elf libnewld.so $(wildcard *.o)
