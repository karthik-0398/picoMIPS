//-----------------------------------------------------
// File Name   : alutest.sv
// Function    : ALUtest module for picoMIPS
// Version: 1,  only 2 funcs
// Author:  ks6n19
// Last rev. 11-05-20
//-----------------------------------------------------

`include "alucodes.sv"   
module alutest;   
parameter n =8; // data bus width   
logic [n-1:0] a, b; // ALU input operands   
logic  func; // ALU func code     
logic [n-1:0] result; // ALU result 
alu #(.n(n)) alu1 (.a(a), .b(b), .func(func), .result(result) );  // create alu object 
//------------- code starts here --------- 
	initial    
		begin  a= 8'h7a;  b= 8'h08;        // test all funcRons      
		#10 func = `RADD; // result = a+b   
		#10 func = `RMUL ; // result = a*b      
		
		end //initial 
endmodule //end of alutest