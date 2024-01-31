# Warnings

1. Make sure the stack space is set correctly in `crt.S`
2. Make sure bootrom jumps to 0x80000000
3. ToHost should be at 0x60000000 (MMIO)