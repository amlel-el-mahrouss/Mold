.PHONY: dylib
dylib:
	dmd -oflibnewld.so -shared $(wildcard libnewld/*.d)

.PHONY: all
all:
	dmd -ofmold.elf $(wildcard libnewld/*.d) $(wildcard src/*.d)

.PHONY: clean
clean:
	rm -f mold.elf libnewld.so
