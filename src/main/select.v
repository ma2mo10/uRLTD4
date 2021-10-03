module select (
	input [0:3] add,
	input [0:3] im,
	input is_imm,
	output [0:3] out
);
		if(is_imm == 0)begin
			out[0:3] <= add[0:3];
		end
endmodule