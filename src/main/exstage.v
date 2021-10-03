`include "add.v"
`include "select.v"

module exstage (
	input reg[0:1] im_2,
	input reg is_imm,
	input reg [3:0] im_4,
	input reg[3:0] inreg,
	output reg[3:0] out
);
	reg[0:4] add_out;

	add U1(
		.inreg (inreg),
		.lm (im_4),
		.out (add_out)
	);

	select U2(
		.add (add_out),
		.im (im_2),
		.is_imm (is_imm),
		.out (out)
	);
	
endmodule