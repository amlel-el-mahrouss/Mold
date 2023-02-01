module mold.factory;

import libnewld.aout_backend;
import libnewld.binary_interface;
import libnewld.common_object_backend;

final class XarFileMaker {
  private AOutBackend AOutInstance;

  this(string Name) {
    import std.stdio;
    import std;

    try {
      AOutInstance = new AOutBackend(Name);
    } catch (FileException e) {
      writeln("FileError: ", e.msg);
    } catch (Exception e2) {
      writeln("Error:", e2.msg);
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

        writeln("Done: ./a.out is ready, see it by yourself.");

        return true;
      default:
        throw new Exception("Unsupported ISA");
        return false;
    }
  }
}
