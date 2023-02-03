module mold.src;
import std.stdio;

void print_args() {
	writeln("--abi=<abi> {A-Out, Mach-O}");
	writeln("--rev=<abi revision>");
}

void print_error_args() {
	writeln("bad arguments!");
}

// main entrypoint for our D linker.
void main(string[] args) {
	import std.range, std.stdio;

	if (args.length == 2 && args[1] == "--help") {
		print_args();
	} else {
		if (args.length == 3) {
			import libnewld.xar;
			import libnewld.binary_interface;

			switch(args[1]) {
				case "--x64": {
					auto output_file = args[2];
					XarHelper.make_x_archive(output_file, ElfMachO, Arch.INTEL64);
					return;
				}
				case "--riscv": {
					auto output_file = args[2];
					XarHelper.make_x_archive(output_file, ElfMachO, Arch.RISCV);
					return;
				}
				default: {
					print_error_args();
				}
			}
		}
	}
}
