//-----------------------------------------------------
// File Name   : decodertest.sv
// Function    : decoder testbench for picoMIPS
// Version: 1,  'ADD, 'ADDI , 'MULI, 'B funcs and Bflags.
// Author:  ks6n19
// Last rev. 11-05-20
//-----------------------------------------------------
module decodertest ;
logic [5:0] opcode ;
logic Bflag, Ben, INen ;
logic PCincr, func, inp , imm, w ;
decoder D(.opcode(opcode),
			.Bflag(Bflag),
			.Ben(Ben),
			.INen(INen),
			.PCincr(PCincr),
			.inp(inp),
			.imm(imm),
			.w(w));
			
initial 
	begin 
		Bflag = '0; Ben = '0; INen = '0 ;
		#10 opcode = 6'b000000 ; //add
		#10 INen = '1 ; 
		#10 opcode = 6'b000001 ; //addi
		#10 opcode = 6'b000010 ; //muli
		#10 opcode = 6'b000011 ; //B 
		#5 Ben = '1 ; Bflag = '0 ;
		#5 Ben = '0 ; Bflag = '1 ;
		#5 Ben = '1 ; Bflag = '0 ;
	end 
endmodule 	
		