module add(
	input [3:0] inreg,
	input [3:0] lm,
	output [3:0] out
);

assign out[3:0]=inreg[3:0]+lm[3:0];

endmodule