module libnewld.factory;

import libnewld.aout_backend;
import libnewld.binary_interface;
import libnewld.common_object_backend;

final class XarFileMaker {
  private AOutBackend AOutInstance;

  this(string Path) {
	import std.range;
    import std.stdio;
    import std;

	assert(!Path.empty());

    try {
      AOutInstance = new AOutBackend(Path);
    } catch (FileException err) {
      writeln("FileError: ", err.msg);
    } catch (Exception err) {
      writeln("Error: ", err.msg);
    }
  }

  bool write(int isa, ExecutableInfo info, ExecutableCmdHeader[] cmdHdrs) {
    import std.range;
    import std;

    if (cmdHdrs.empty()) return false;

    switch (isa) {
      case BerkeleyRisc:
        // risc-v
        AOutInstance.write_header(BerkeleyRisc, info);

        foreach (cmdHeader; cmdHdrs) {
          AOutInstance.write_command(cmdHeader);
        }

        writeln("Done, see it by yourself.");

        return true;
      default:
        throw new Exception("Unsupported ISA");
        return false;
    }
  }
}
