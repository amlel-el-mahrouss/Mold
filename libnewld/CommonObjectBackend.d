module libnewld.common_object_backend;

// Common Objects are runtime structures allocated by the linker.
// Here I added uint arch; for fat binaries.

struct CommonObjectHeader {
  char[] name;
  uint arch;
  uint type;
  uint flags;
  uint offset; // 32-bit offset
};
