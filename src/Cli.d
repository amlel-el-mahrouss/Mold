module mold.src;
import std.stdio;

void print_args() {
	import core.stdc.stdlib;

	writeln("summoning man..");
	core.stdc.stdlib.system("man man/mold.8");
}

void print_error_args(string[] args) {
	writeln("mold: bad arguments, ", args);
}

// main entrypoint for our D linker.
void main(string[] args) {
	import std.range, std.stdio;

	if (args.length == 2 && args[1] == "--help") {
		print_args();
	} else {
		if (args.length == 3) {
			import libnewld.xar;
			import libnewld.exec_info;

			auto output_file = args[2];

			switch(args[1]) {
				case "-amd64": {
					XarHelper.make_x_archive(output_file, Exec.MachO, Arch.INTEL64);
					return;
				}
				case "-riscv64": {
					XarHelper.make_x_archive(output_file, Exec.MachO, Arch.RISCV);
					return;
				}
				case "-mips64": {
					XarHelper.make_x_archive(output_file, Exec.MachO, Arch.MIPS);
					return;
				}
				default: {
					print_error_args(args);
				}
			}
		}
	}
}
