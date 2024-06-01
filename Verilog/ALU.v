/*
ALU alu(
    .en(),
    .clk(),
    .rst_n(),
    .opcode_in(),
    .data_A_in(),
    .data_B_in(),
    .data_out(),
    .int()
);
*/

module __ALU
(
    input   wire        en,
    input   wire        clk,
    input   wire        rst_n,
    input   wire[5:0]   opcode_in,
    input   wire[31:0]  data_A_in,
    input   wire[31:0]  data_B_in,
    output  wire[31:0]  data_out,

    output  wire        int_out
);

    reg[63:0] res;
    reg[7:0] flag;
    initial begin
        res <= 64'd0;
        flag <= 8'd0;
    end

    assign data_out = en ? (opcode_in == 6'd2 ? res[63:32] : (opcode_in == 6'hd ? {24'd0, flag} : res[31:0])) : 32'dz;
    assign int_out = en ? opcode_in[3:1] == 3'b010 && data_B_in == 32'd0 : 1'b0;

    always @(negedge rst_n, negedge clk) begin
        if (!rst_n) flag <= 8'd0;
        else begin
            flag[0] = res[32];
            flag[1] = |data_out;
            flag[4] = &data_out;
        end
    end

    always @(*) begin
        if (!rst_n) res <= 64'd0;
        else begin
            if (en) begin
                case (opcode_in[3:0])
                    4'h0: res <= data_A_in + data_B_in;
                    4'h1: res <= data_A_in - data_B_in;
                    4'h2: res <= data_A_in * data_B_in;
                    4'h3: res <= data_A_in * data_B_in;
//                    4'h4: res <= data_A_in / (data_B_in == 32'd0 ? 32'd1 : data_B_in);
//                    4'h5: res <= data_A_in % (data_B_in == 32'd0 ? 32'd1 : data_B_in);
                    4'h6: res <= data_A_in & data_B_in;
                    4'h7: res <= data_A_in | data_B_in;
                    4'h8: res <= ~data_A_in;
                    4'h9: res <= data_A_in ^ data_B_in;
                    4'ha: res <= data_A_in << data_B_in[4:0];
                    4'hb: res <= data_A_in >> data_B_in[4:0];
                    4'hc: res <= data_A_in;
                    default: res <= res;
                endcase
            end
            else res <= res;
        end
    end

//    always @(negedge rst, posedge en, posedge int_rst) begin
//        if (!rst || int_rst) int <= 1'b0;
//        else begin
//            if (opcode_in[3:1] == 3'b010 && data_B_in == 32'd0) int <= 1'b1;
//            else int <= int;
//        end
//    end
endmodule