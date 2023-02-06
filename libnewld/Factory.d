module libnewld.factory;

import libnewld.exec_backend;
import libnewld.exec_info;

final class XarFileMaker {
	private ExecBackend AOutInstance;

	this(string Path) {
		import std.range;
		import std.stdio;
		import std;

		assert(!Path.empty());

		try {
			AOutInstance = new ExecBackend(Path);
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
			case Arch.RISCV:
				AOutInstance.write_header(Arch.RISCV, info);
				break;
			case Arch.INTEL64:
				AOutInstance.write_header(Arch.RISCV, info);
				break;
			default:
				throw new Exception("Unsupported ISA");
				return false;
		}

		foreach (cmdHeader; cmdHdrs) {
			if (!AOutInstance.write_segment(cmdHeader))
				return false;
		}

		return true;
	}
}
