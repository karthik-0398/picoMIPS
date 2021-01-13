
//Decoder

`include "alucodes.sv"
`include "opcodes.sv"
//---------------------------------------------------------
module decoder (input logic [1:0] opcode, // top 2 bits of instruction
				input logic Bflag, Ben, INen,
				//output signals
				//PC control
				output logic PCincr,
				//ALU control
				output logic func, // ALU function code 
				//input port mux control
				output logic inp,
				// immediate operand mux control
				output logic imm,
				//   register file control
				output logic w);
   
//------------- code starts here ---------
// instruction decoder
always_comb 
	begin
	   // set default output signal values for NOP instruction
		PCincr = 1'b1; // PC increments by default
		func = `RADD; // alu programmed for addition
		inp=1'b0; imm=1'b0; w=1'b0; 
		case(opcode)
			`ADD: // register-register add
				begin
					w    = 1'b1; // write result to dest register
					inp  = INen; // set mux to read from input port
					func = `RADD;
				end
			
			`ADDI: // register-immediate add
				begin
					w    = 1'b1; // write result to dest register 
					imm  = 1'b1; // select immediate operand
					func = `RADD;
				end	  	

			`MULI:
				begin
					w    = 1'b1; // write result to dest register
					imm  = 1'b1; 
					func = `RMUL;
				end

			`B:
				begin
					if(Bflag == Ben) 
						PCincr = 1'b0;
				end

			default: ;
			 //  $error("unimplemented opcode");
		endcase // opcode
	end // always_comb

endmodule //module decoder --------------------------------