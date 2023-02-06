module libnewld.exec_backend;

import libnewld.exec_info;
import std.algorithm, std.stdio, std.file, std.range;

final class ExecBackend
{
	private string Name;
	private File Fp;

	this(string Name) {
		this.Name = Name;
		if (this.Name.empty())
			throw new Exception("Bad filename!");

		this.Fp = File(Name, "wb");
	}

	final string this_exec_name() {
		return this.Name;
	}

	bool write_header(int arch, ExecutableInfo info) {
		switch (arch) {
		case Arch.INTEL64:
		{
			this.Fp.write(8086);
			break;
		}
		case Arch.RISCV:
		{
		  	this.Fp.write(0xFEED);
			break;
		}
		default:
		{
			return false;
		}
		}

		this.Fp.write(info.Text);
		this.Fp.write(info.Data);
		this.Fp.write(info.Bss);
		this.Fp.write(info.Syms);
		this.Fp.write(info.Entry);
		this.Fp.write(info.Trsize);
		this.Fp.write(info.Drsize);

		return true;
	}

	bool write_segment(ExecutableCmdHeader info) {
		if (info.Sz == 0) return false;

		this.Fp.write(info.Sz);
		this.Fp.write(info.Type);
		this.Fp.write(info.Resv); // specific info about the segment.
		
		this.Fp.seek(info.Off);
		this.Fp.write(info.Start); // start offset

		return true;
	}

	// (type == 0) = true then __TEXT
	// (type == 1) = true then __DATA
	// (type == 2) = true then __BSS

}
