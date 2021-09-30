module select (
	input reg[0:3] add,
	input reg[0:1] im,
	input reg is_imm,
	output reg[0:3] out;
);
	always @(posedge CLK) begin
		case (isimm)
			1 :
			out[0:3]<=add[0:3];
			default:
		endcase
	end
endmodule