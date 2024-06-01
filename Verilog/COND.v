/*
COND cond(
    .en(),
    .clk(),
    .rst_n(),
    .opcode_in(),
    .data_A_in(),
    .data_B_in(),
    .data_out(),
    .wt_type(),
    .int_type_out()
);
*/

module COND
(
    input   wire        en,
    input   wire        clk,
    input   wire        rst_n,
    input   wire[5:0]   opcode_in,
    input   wire[31:0]  data_A_in, 
    input   wire[31:0]  data_B_in,
    output  wire        data_out,
    output  wire        wt_type,
    output  wire        cal_en,
    output  wire        ret_en,
    output  wire[31:0]  int_type_out,
    output  wire        int_reset,
    output  wire        int_set,

    input   wire[1:0]   opcode_imm,
    output  wire        through_C_en
);

    reg res;
    initial begin
        res <= 1'd0;
    end

    assign wt_type = opcode_in[4];
    assign data_out = en ? res : 1'b0;

    assign through_C_en = en ? opcode_imm != 2'b11 : 1'b0;

    assign cal_en = en ? (opcode_in[3] & opcode_in[0]) : 1'b0;
    assign ret_en = en ? (opcode_in[3] & ~opcode_in[0]): 1'b0;
    assign int_reset = en ? opcode_in[3:0] == 4'ha : 1'b0;
    assign int_set = en ? opcode_in[3:0] == 4'hb : 1'b0;

    always @(*) begin
        if (!rst_n) res <= 1'b0;
        else begin
            case (opcode_in[3:0])
                4'h0: res <= 1'b1;
                4'h1: res <= (data_A_in == data_B_in);
                4'h2: res <= (data_A_in != data_B_in);
//                4'h3: res <= (data_A_in > data_B_in);
//                4'h4: res <= (data_A_in < data_B_in);
//                4'h5: res <= (data_A_in >= data_B_in);
//                4'h6: res <= (data_A_in <= data_B_in);
                4'h8: res <= 1'b1;  //ret
                4'h9: res <= 1'b1;  //call
                4'ha: res <= 1'b1;  //iret
                4'hb: res <= 1'b1;  //int
                default: res <= res;
            endcase
        end
    end

    assign int_type_out = en && (opcode_in[3:0] == 4'hb) ? 32'b1 << data_B_in : 32'd0;

//    always @(negedge rst, posedge en, posedge int_rst) begin
//        if (!rst || int_rst) int <= 1'b0;
//        else begin
//            if (opcode_in[3:1] == 3'b010 && data_B_in == 32'd0) int <= 1'b1;
//            else int <= int;
//        end
//    end
endmodule 