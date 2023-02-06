module libmips.mips_intrusction_factory;
import std.File, std.stdio, std.range;

final class MIPSIntrusctionFactory {
	private File Fp;

	this(string OutName) {
		if (OutName.empty())
			throw new Exception("XARException: Bad 'OutName'");

		this.Fp = File(OutName ~ ".mips.xar", "wb");
	}

	ulong make_imm_opcode(int op, int rs, int rt, int imm) {
		this.Fp.write(op);
		this.Fp.write(rs);
		this.Fp.write(rt);
		this.Fp.write(imm);

		ulong ret = op | rs | rt | imm;
		return ret;
	}

	ulong make_reg_opcode(int op, int rs, int rt, int low, int hi) {
		this.Fp.write(op);
		this.Fp.write(rs);
		this.Fp.write(rt);
		this.Fp.write(low);
		this.Fp.write(hi);
		
		ulong ret = op | rs | rt | low | hi;
		return ret;
	}

	ulong make_branch_opcode(int op, int rs, int branch, int off) {
		this.Fp.write(op);
		this.Fp.write(rs);
		this.Fp.write(branch);
		this.Fp.write(off);

		ulong ret = op | rs | branch | off;
		return ret;
	}

	ulong make_syscall_opcode(int op, int ivt, int isr) {
		this.Fp.write(op);
		this.Fp.write(ivt);
		this.Fp.write(isr);

		ulong ret = op | ivt | isr;
		return ret;
	}
}