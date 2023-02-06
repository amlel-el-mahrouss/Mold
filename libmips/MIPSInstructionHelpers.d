module libmips.mips_instruction_helpers;
import std.File, std.stdio, std.range;

enum MIPSEndian {
	Low = 2,
	Big = 4,
	Bi = Big | Low,
}

string mips_data_width(ulong sz) {
	switch (sz) {
		case 1:
			return "byte";
		case 2:
			return "hword";
		case 4:
			return "dword";
		case 8:
			return "qword";
		default:
			return "invalid";
	}
}

MIPSEndian mips_get_endian(char[] bytes, char excepted) {
	if (bytes[0] == excepted)
		return MIPSEndian.Big;
	else
		return MIPSEndian.Low;
}