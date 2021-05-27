#include "i960_code.h"

uint32_t readO(uint32_t bytes, uint32_t address)
{
	return 0xffffffff;
}

void writeO(uint32_t bytes, uint32_t address, uint32_t value)
{
}

void FUN_00000860()
{
	// MAIN: copy 0x38 bytes from 0xc90 + to 0xe00000 + (cpu control / wait states)
	g0 = 0xe00000;
	g1 = 0xc90;
	g3 = 0xffffffff;
	for (;;) {
		g2 = ld(g1);
		if (g2 == g3) break;
		st(g2, g3);
		g0 += 4;
		g1 += 4;
	}
}
