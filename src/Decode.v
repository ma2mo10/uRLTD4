module Decode (
    input clk,
    input reg[0:7] inst,
    output reg[0:3] op,
    output reg[0:3] im,
    output reg pc_w,
    output reg mem_w,
    output reg mem_r,
    output reg is_jump,
    output reg s_reg;
);
    

    always @(posedge clk) begin
        op <= inst[7:4]

        case(op)
            4'b0000 :
                operation();
            4'b0101 :
                operation();
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
            4'b1001 :
                mem_r <= 1;
                s_reg <= 1;
            4'b1011 :
                im <= inst[3:0];
        endcase
         
    end

    task operation;
        im <= inst[3:0];
        mem_w <= 1;
        mem_r <= 1;
        pc_w <= 0;
    endtask

    task sw_a;
        im <= inst[3:0];
        s_reg <= 0;
        mem_w <= 1;
        mem_r <= 0;
        pc_w <= 0;
    endtask
    
    task sw_b;
        im <= inst[3:0];
        s_reg <= 1;
        mem_w <= 1;
        mem_r <= 0;
        pc_w <= 0;
    endtask

    task jump;
        im <= inst[3:0];
        is_jump <= 1;
        pc_w <= 1;
        mem_w <= 0;
        mem_r <= 0;
    endtask

    
endmodule