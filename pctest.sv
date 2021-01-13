//-----------------------------------------------------
// File Name   : pctest.sv
// Function    : program counter testbench for picoMIPS
// Version: 1,  increment or branch 
// Author:  ks6n19
// Last rev. 11-05-20
//-----------------------------------------------------
module pctest ;
logic clk ;
logic reset ;
logic PCincr ;
logic [5:0] Branchaddr ;
logic [5:0] PCout ;
	pc #(.Psize(5)) pc (.clk(clk), 
									.reset(reset), 
									.PCincr(PCincr), 	
									.Branchaddr(Branchaddr),
									.PCout(PCout));
initial 
	begin 
		clk = 1'b0 ;
		forever #5ns clk = ~clk ;
	end 
initial 
		begin 
			reset = '0; PCincr = '0; Branchaddr = '0 ;
			#10 reset = '0 ; PCincr = '1 ;
			#10 reset = '1 ;
			#30 PCincr = '0 ; Branchaddr = 5'b01100 ; 
			#10 reset = '1 ; PCincr = '1; 
			#30 reset = '0 ;
			#10 reset = '1 ;
			
		end 
endmodule 		