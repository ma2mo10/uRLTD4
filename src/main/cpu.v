`include "fetch.v"
`include "Decode.v"
`include "exstage.v"

module cpu (clk, rst, out);
    input clk, rst;
    output[3:0] out;

    /*フェッチで使う変数*/
    reg is_jump;
    reg[3:0] jumpadrs;
    reg[7:0] inst;

    /*デコーダで使う変数*/
    reg[0:3] result;
    reg in_mem_w, in_s_reg;
    
    reg[0:3] im;
    reg is_imm, mem_w, s_reg, out_reg;

    fetch i0 (
        .rst(rst),
        .clk(clk),
        .jumpadrs(jumpadrs),
        .isjump(is_jump),
        .inst(inst)
    );

    Decode i1 (
        .clk(clk), 
        .rst(rst), 
        .inst(inst), 
        .result(result), 
        .in_mem_w(in_mem_w), 
        .in_s_reg(in_s_reg),
        .im(im),
        .is_imm(is_imm),
        .mem_w(mem_w),
        .is_jump(is_jump),
        .s_reg(s_reg),
        .out_reg(out_reg)
    );


endmodule