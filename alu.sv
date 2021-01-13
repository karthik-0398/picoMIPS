//-----------------------------------------------------
// File Name   : alu.sv
// Function    : ALU module for picoMIPS
// Version: 1,  only 2 funcs
// Author:  ks6n19
// Last rev.  11/05/20
//-----------------------------------------------------
`include "alucodes.sv"  
module alu #(parameter n =8) (input logic signed [n-1:0] a, b, // ALU operands
							  input logic func, // ALU function code
							  output logic signed [n-1:0] result);// ALU result

//------------- code starts here ---------
logic signed [n-1:0] ar; // add result
logic signed [15:0] mr; //mul result

always_comb
	begin
		if(func == `RMUL)
			mr = a * b;
		else
			mr = 0;
		
		if(func == `RADD)
			ar = a+b;
		else
			ar = 0;// n-bit adder
	end // always_comb

// create the ALU 
always_comb
	begin
		result = a; // default
		case(func)
			`RADD: 
				begin
					result = ar;
					
				end
				
			`RMUL: 
				begin
					result = mr[14:7];
				end
		endcase
		
	end //always_comb
endmodule //end of module ALU
