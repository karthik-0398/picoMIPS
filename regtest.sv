//-----------------------------------------------------
// File Name   : regtest.sv
// Function    : gpr register testbench for picoMIPS
// Version: 1,   values from %0, %1, %2, %3,  
// Author:  ks6n19
// Last rev. 11-05-20
//-----------------------------------------------------
module regtest ;
parameter n = 8 ;
logic clk, w ;
logic [n-1:0] Wdata ;
logic [4:0] Rsno, Rdno ;
logic [n-1:0] Rs , Rd ;

regs #(.n(8)) gpr (.clk(clk),.w(w),
							 .Wdata(Wdata), // write ALU result to Rd
							 .Rdno(Rdno),  // reg %d number
							 .Rsno(Rsno), // reg %s number
							 .Rd(Rd),.Rs(Rs)); 
							 
							 
							 
	initial 
		begin 
			clk = '0 ;
			forever #5ns clk = ~clk ; 
			end 
			
	initial 
		begin 
			w = '1 ;
			Rdno = 5'b00000; Wdata = 8'd10 ;
		#10	Rdno = 5'b00001; Wdata = 8'd11 ;
		#10	Rdno = 5'b00010; Wdata = 8'd12 ;
		#10	Rdno = 5'b00011; Wdata = 8'd13 ;
		#10 w = '0 ;
		#10	Rdno = 5'b00000; Rsno = 5'b00000;
		#10	Rdno = 5'b00001; Rsno = 5'b00001;
		#10	Rdno = 5'b00010; Rsno = 5'b00010;
		#10	Rdno = 5'b00011; Rsno = 5'b00011;
		end 
endmodule 