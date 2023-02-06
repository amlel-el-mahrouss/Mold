module libmips.mips_intrusction_factory;
import std.File, std.stdio, std.range;

final class MIPSIntrusctionFactory {
	private File Fp;

	this(string OutName) {
		if (OutName.empty())
			throw new Exception("XARException: Bad 'OutName'");

		this.Fp = File(OutName ~ ".mips.xar", this.restrict());
	}

	void seek(ulong off) { 
		this.Fp.seek(off); 
	}

	string restrict() {
		return ("wb");
	}

	void make_imm_opcode(int op, int rs, int rt, int imm) {
		this.Fp.write([op, rs, rt, imm]);
	}

	void make_reg_opcode(int op, int rs, int rt, int low, int hi) {
		this.Fp.write([op, rs, rt, low, hi]);
	}

	void make_branch_opcode(int op, int rs, int branch, int off) {
		this.Fp.write([op, rs, branch, off]);
	}

	void make_syscall_opcode(int op, int ivt, int isr) {
		this.Fp.write([op, ivt, isr]);
	}
}