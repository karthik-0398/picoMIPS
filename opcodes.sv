
//opcodes

// ADD %d, %s;  %d = %d+%s
`define ADD  6'b000000

// ADDI %d, %s, imm ;  %d = %s + imm
`define ADDI 6'b000001

//`define SUB 3'b011
// MUL %d  %s;  %d = %d*%s
`define MULI 6'b000010

// B - branch
`define B    6'b000011
