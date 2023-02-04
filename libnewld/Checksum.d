module libnewld.checksum;

final class ChecksumHelper {
	static int verify(char[] msg, int length) {
		char result = 0;
		for (int i = 0; i < msg.length; ++i)
			result ^= msg[i];

		return result;
	}
}