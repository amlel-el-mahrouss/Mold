module libmips.db;

enum OpcodeDB {
	Add = 0b000000,
	AddI = 0b001000,
	AddIU = 0b001001,
	AddU = 0b000000,
	And = 0b000000,
	AndI = 0b001100,
	LUI = 0b001111,
	Nor = 0b000000,
	Or = 0b000000,
	LB = 0b100000,
	LBU = 0b100100,
	LH = 0b100001,
	LHU = 0b100101,
	LW = 0b100011,
	SB = 0b101000,
	SHW = 0b101001,
	SW = 0b101011
}

enum IntrusctionDB {
	IRegister,
	RRegister,
	JRegister
}