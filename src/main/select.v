module select (
	input [0:3] add,
	input [0:3] im,
	input is_imm,
	output [0:3] out
);
	assign	out=(is_imm==1'b0)? add:3'b000;
endmodule