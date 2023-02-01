module libnewld.binary_interface;

enum Intel = 1;
enum AMD64 = Intel;
enum BerkeleyRisc = 2;

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
