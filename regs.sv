//-----------------------------------------------------
// File Name   : regs.sv
// Function    : gpr register module for picoMIPS
// Version: 1,  5 bit register address with 8 bit data
// Author:  ks6n19
// Last rev. 11-05-20
//-----------------------------------------------------
module regs #(parameter n = 8) (input logic clk, w, //reset,// clk and write control
										  input logic [n-1:0] Wdata,
										  input logic [4:0] Rdno, Rsno, // 5-bit register number
										  output logic [n-1:0] Rd, Rs);
// Declare 32 n-bit registers 
logic [n-1:0] gpr [31:0];

always_ff @ (posedge clk)//or negedge reset)
	begin
		if (w)
			gpr[Rdno] <= Wdata;
	end
	
always_comb
	begin
		if (Rdno== 5'b0)
	        Rd =  {n{1'b0}};
			else  
				Rd = gpr[Rdno];
	 
        if (Rsno== 5'b0)
	        Rs =  {n{1'b0}};
			else  
				Rs = gpr[Rsno];
	
	end
	
endmodule // module regs