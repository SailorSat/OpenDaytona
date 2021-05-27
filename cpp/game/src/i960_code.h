#pragma once
#include <iostream>

uint32_t g0;
uint32_t g1;
uint32_t g2;
uint32_t g3;
uint32_t g4;
uint32_t g5;
uint32_t g6;
uint32_t g7;
uint32_t g8;
uint32_t g9;
uint32_t g10;
uint32_t g11;
uint32_t g12;
uint32_t g13;
uint32_t g14;

uint32_t readO(uint32_t bytes, uint32_t address);
void writeO(uint32_t bytes, uint32_t address, uint32_t value);

void FUN_00000860();