module libnewld.xar;

import libnewld.aout_backend;
import std.algorithm, std.stdio, std.file, std.range;

struct XHelper {
  ulong OldFileOffset;
  ulong NewFileOffset;
  ulong OldFileSz;
  ulong NewFileSz;
  File OldFile;
  File NewFile;

  void do_relocate() {
    this.NewFile.seek(this.NewFileOffset);
    this.OldFile.seek(this.OldFileOffset);

    char[] old;
    this.OldFile.readf("%s\n%%\n", old);
    this.NewFile.write(old);
  }
}

enum ElfMachO = 1;
enum ElfAOut = 2;

final class XarHelper {
  static File make_x_archive(string _file, int _type, int _arch) {
    auto file = File(_file, "wb");
    file.write("!<XAR>\r\n");
    switch (_type) {
      case ElfMachO:
        file.write("!ELF-MachO\r\n%%\r\n");
        break;
      case ElfAOut:
        file.write("!ELF-AOut\r\n%%\r\n");
        break;
      default:
        file.write("!ELF-?\r\n%%\r\n");
        break;
    }

    import libnewld.binary_interface;

    switch (_arch) {
      case Arch.RISCV:
        file.write("!RISC-V\r\n%%\r\n");
        break;
      case Arch.INTEL64:
        file.write("!Arch.INTEL64\r\n%%\r\n");
        break;
      default:
        file.write("!UNKWN\r\n%%\r\n");
        break;

    }

    return file;
  }

  static bool write_binary(File rootFile, string filename) {
    try {
      import std.stdio, std.file;

      auto manifest = File(filename ~ ".xar", "rb");
      char[] buffer;
      manifest.readf("%s", buffer);
      rootFile.write(buffer, "\r\n%%\r\n");

      return true;
    } catch (FileException fe) {
      writeln("ManifestError: ", fe.msg);

      return false;
    }
  }
}
