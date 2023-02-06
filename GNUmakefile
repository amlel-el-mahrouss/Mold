.PHONY: libnewld
libnewld:
	dmd -oflibnewld.so -shared $(wildcard libnewld/*.d)

.PHONY: libmips
libmips:
	dmd -oflibmips.so -shared $(wildcard libmips/*.d)

.PHONY: cli
cli:
	dmd -ofmold $(wildcard libnewld/*.d) $(wildcard src/*.d)

.PHONY: clean
clean:
	rm -f mold $(wildcard *.o) $(wildcard *.so) $(wildcard *.xar)

.PHONY: dmd
dmd:
	sudo snap install dmd --classic