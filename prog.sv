//-----------------------------------------------------
// File Name   : prog.sv
// Function    : progmem module for picoMIPS
// Version: 1,  6 bit opcode to 24 bit address
// Author:  ks6n19
// Last rev. 11-05-20
//-----------------------------------------------------
module prog #(parameter Psize = 6, Isize = 24) (input logic [Psize-1:0] address,
						output logic [Isize:0] I); // I - instruction code

//program memory declaration, note: 1<<n is same as 2^n
logic [Isize:0] progMem[(1<<Psize)-1:0];



//get memory contents from file
initial 
	$readmemh("prog.hex",progMem);
always_comb
	begin 
		I = progMem[address] ;
	end
	
endmodule // end of module prog
