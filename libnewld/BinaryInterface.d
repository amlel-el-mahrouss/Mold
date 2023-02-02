module libnewld.binary_interface;

enum Arch { INTEL64, RISCV, COUNT }

struct ExecutableInfo {
	ulong text;
	ulong data;
	ulong bss;
	ulong syms;
	ulong entry;
	ulong trsize;
	ulong drsize;
}

struct ExecutableCmdHeader {
	ulong sz;
	ulong type;
	ulong info;
	ulong start;

	ulong this_type() { return this.type; }
	ulong this_length() { return this.sz; }
}
