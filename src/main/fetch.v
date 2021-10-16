`include "counter.v"
`include "rom.v"
`include "adder.v"
`include "fetch_select.v"

module fetch (rst, clk, jumpadrs, isjump, inst);
	input rst, clk, isjump;
    input[3:0] jumpadrs;
	output[7:0]inst;
	wire[3:0]pcout, nxtadrs, selout;

	counter i0 (.rst(rst), .clk(clk), .in(selout), .out(pcout));
	adder i1 (.in1(pcout), .in2(4'b0001), .out(nxtadrs));
    selector i2 (.in1(nxtadrs), .in2(jumpadrs), .sel(isjump), .out(selout));
	rom i3 (.ad(pcout), .do(inst));

endmodule