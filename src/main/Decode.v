module Decode (
    input clk,
    input rst,
    input reg[0:7] inst,
    input reg[0:3] result,
    input reg in_mem_w,
    input reg in_s_reg,
    output reg[0:3] im,
    output reg is_imm,
    output reg mem_w,
    output reg is_jump,
    output reg s_reg,
    output reg out_reg
);

    /*Decode内からでExステージにレジスタの値を渡すように仕様変更
    それに伴ってモジュールの入出力も変更しました*/


    //Decode内にレジスタ作りました
    reg [0:3] a;
    reg [0:3] b;
    

    always @(posedge clk) begin
        case(inst[7:4])
            4'b0000 :
                operation();
                out_reg <= a;
            4'b0101 :
                operation();
                out_reg = b;
            4'b0011 :
                sw_a();
            4'b0111 :
                sw_b();
            4'b0001 :
                sw_a();
            4'b0100 :
                sw_b();
            4'b1111 :
                jump();
            4'b1110 :
                jump();
            4'b0010 :
                in_a();
            4'b0110 :
                in_b();
            4'b1001 :
                out_b();
                out_reg = b;
            4'b1011 :
                out_imm();
        endcase
        
        //計算結果を受け取ったらそれぞれa,bに代入
        if(in_mem_w == 1'b1)
            case(in_s_reg)
                1'b0 :
                    a = result;
                1'b1 :
                    b = result;
            endcase
        end
    end

    task operation;
        im <= inst[3:0];
        mem_w <= 1;
        is_imm <= 0;
        is_jump <= 0;
    endtask

    task sw_a;
        im <= inst[3:0];
        s_reg <= 0;
        mem_w <= 1;
        is_imm <= 1;
        is_jump <= 0;
    endtask
    
    task sw_b;
        im <= inst[3:0];
        s_reg <= 1;
        mem_w <= 1;
        is_imm <= 1;
        is_jump <= 0;
    endtask

    task jump;
        im <= inst[3:0];
        is_jump <= 1;
        is_imm <= 1;
        mem_w <= 0;
    endtask

    task in_a;
        s_reg <= 0;
        mem_w <= 1;
        is_imm <= 0;
        is_jump <= 0;
    endtask
    
    task in_b;
        s_reg <= 1;
        mem_w <= 1;
        is_imm <= 0;
        is_jump <= 0;
    endtask

    task out_b;
        s_reg <= 1;
        mem_w <= 0;
        is_imm <= 0;
        is_jump <= 0;
    endtask

    task out_imm;
        im <= inst[3:0];
        is_jump <= 0;
        is_imm <= 1;
        mem_w <= 0;
    endtask

endmodule