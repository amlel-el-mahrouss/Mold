module libnewld.streams;

import std;

final class StaticBinaryStream {
	private string filename;

	this(string filename) {
		this.filename = filename;
		assert(!filename.empty());
	}

	char[] read() {
		char[] bytes = cast(char[])std.read(this.filename);
		assert(!bytes.empty());
		return bytes;
	}
}

