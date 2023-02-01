module libnewld.aout_backend;

import libnewld.binary_interface;
import std.algorithm, std.stdio, std.file, std.range;

final class AOutBackend
{
	private string Name;
	private File Fp;

	this(string Name) {
		this.Name = Name;
		if (this.Name.empty())
			throw new Exception("No Such File");

		this.Fp = File(Name, "wb");
	}

	final string this_exec_name() {
		return this.Name;
	}

	bool write_header(int arch, ExecutableInfo info) {
		switch (arch) {
		case Intel:
		{
			this.Fp.write(8086);
			break;
		}
		case BerkeleyRisc:
		{
		  	this.Fp.write(0xFEED);
			break;
		}
		default:
		{
			return false;
		}
		}

		this.Fp.write(info.text);
		this.Fp.write(info.data);
		this.Fp.write(info.bss);
		this.Fp.write(info.syms);
		this.Fp.write(info.entry);
		this.Fp.write(info.trsize);
		this.Fp.write(info.drsize);

		return true;
	}

	void write_command(ExecutableCmdHeader info) {
		if (info.sz == 0) return;

		this.Fp.write(info.sz);
		this.Fp.write(info.type);
		this.Fp.write(info.info); // specific info about the segment.
		this.Fp.write(info.start); // start offset
	}

	// (type == 0) = true then __TEXT
	// (type == 1) = true then __DATA
	// (type == 2) = true then __BSS

}
