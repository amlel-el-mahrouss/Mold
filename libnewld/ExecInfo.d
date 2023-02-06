module libnewld.exec_info;

enum Arch { 
	INTEL64, 
	RISCV, 
	MIPS, 
	COUNT 
}

struct ExecutableInfo {
	ulong Text;
	ulong Data;
	ulong Bss;
	ulong Syms;
	ulong Entry;
	ulong Trsize;
	ulong Drsize;
}

struct ExecutableCmdHeader {
	char[] SegmentName;
	ulong Start;
	ulong Type;
	ulong Resv;
	ulong Off;
	ulong Sz;

	ulong type() { return this.Type; }
	ulong length() { return this.Sz; }
}
