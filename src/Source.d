module mold.src;

void print_args()
{
  import std.stdio;

  writeln("mold, the modern linker.");
  writeln("--abi=<abi> {A-Out, Mach-O}");
  writeln("--abi-rev=<ver>");

}

void main(string[] args) {
  import std.range, std.stdio;

  if (args.length == 2 && args[1] == "--help") {
    print_args();
  } else {
    if (args.length == 3 && args[1] == "--make-xar-x86") {
      import mold.xar;
      import libnewld.binary_interface;

      XarHelper.make_x_archive(args[2], ElfMachO, Intel);
      writeln("xar is done.");
    }
  }
}
