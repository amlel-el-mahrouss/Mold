module mold.src;

void print_args()
{
  import std.stdio;

  writeln("The modern linker");
  writeln("--abi=<abi> {A-Out, Mach-O}");
  writeln("--rev=<abi revision>");

}

// main entrypoint for our D linker.
void main(string[] args) {
  import std.range, std.stdio;

  if (args.length == 2 && args[1] == "--help") {
    print_args();
  } else {
    if (args.length == 3 && args[1] == "--make-xar-x86") {
      import libnewld.xar;
      import libnewld.binary_interface;

      auto output_file = args[2];
      XarHelper.make_x_archive(output_file, ElfMachO, Arch.INTEL64);
    }
  }
}
