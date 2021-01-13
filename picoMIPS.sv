
module picoMIPS (input logic clk,  // 10Hz clock 
				//input logic reset, // master reset (active low push button)
				input logic[9:0] SW, // connected to switches
				//input logic Bflag,
				output logic[7:0] LED);// this will be the ALU output    

	parameter Psize = 6; // 5-bit program counter - up to 32 instructions
	parameter Isize = 24; 

	logic PCincr;
	logic [Psize-1:0] Branchaddr;
	logic [Psize-1 : 0] PCout;
	logic [Isize:0] I;
	logic func;
	logic inp;
	logic imm;
	logic w;
	logic [7:0] result;
	logic [7:0] alua; // multiplexer output - alu port A
	logic [7:0] alub; // multiplexer output - alu port B
	logic [7:0] Rd;
	logic [7:0] Rs;

	pc #(.Psize(Psize)) pc (.clk(clk), 
									.reset(SW[9]), 
									.PCincr(PCincr), 	
									.Branchaddr(Branchaddr),
									.PCout(PCout));  // create pc 



prog #(.Psize(Psize),.Isize(Isize)) 
      progMemory (.address(PCout),.I(I));

	decoder dec (.opcode(I[Isize-1:Isize-6]), // Instruction opcode
					 .PCincr(PCincr),
					 //.PCabsbranch(PCabsbranch), // PC control
					 .Bflag(SW[8]),
					 .Ben(I[7]),
					 .INen(I[7]),
					 .func(func), // ALU function
					 .inp(inp), // Input port select
					 .imm(imm), // immediate operand select
					 .w(w)); // Write to registers

	regs #(.n(8)) gpr (.clk(clk),.w(w),
							 //.reset(SW[9]),
							 .Wdata(result), // write ALU result to Rd
							 .Rdno(I[Isize-7:Isize-11]),  // reg %d number
							 .Rsno(I[Isize-12:Isize-16]), // reg %s number
							 .Rd(Rd),.Rs(Rs)); // selected register data
			
	alu #(.n(8)) al (.a(alua),.b(alub), // ALU input operands
						  .func(func), // ALU function
						  .result(result)); // ALU result		
	   
	always_comb
		begin
			alua = (inp ? SW[7:0] : Rd); // select input port or ALU
			alub = (imm ? I[7:0] : Rs); // select input port or ALU

			Branchaddr = I[Psize-1:0];
			LED [7:0] = result;
		end 

endmodule //end of pstest
