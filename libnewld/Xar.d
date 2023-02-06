module libnewld.xar;

import libnewld.exec_backend;
import std.algorithm, std.stdio, std.file, std.range;

enum Exec {
	MachO = 1,
	AOut = 2,
}

final class XarHelper {
  static File make_x_archive(string _file, int _type, int _arch) {
    auto file = File(_file, "wb");
    file.write("!<XAR>\r\n");
    switch (_type) {
      case Exec.MachO:
        file.write("!Exec.MachO\r\n%%\r\n");
        break;
      case Exec.AOut:
        file.write("!Exec.AOut\r\n%%\r\n");
        break;
      default:
        file.write("!Exec.UNKWN\r\n%%\r\n");
        break;
    }

    import libnewld.exec_info;

    switch (_arch) {
      case Arch.RISCV:
        file.write("!Arch.RISC-V\r\n%%\r\n");
        break;
      case Arch.INTEL64:
        file.write("!Arch.INTEL64\r\n%%\r\n");
        break;
      case Arch.MIPS:
        file.write("!Arch.MIPS\r\n%%\r\n");
        break;
      default:
        file.write("!Arch.UNKWN\r\n%%\r\n");
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
		writeln("mold: XarManifestError! ", fe.msg);

		return false;
    }
  }
}
