/*
GPR Gpr
(
    .clk(),
    .rst_n(),
    .wt_en(),
    .data_in(),
    .rd_A_en(),
    .data_A_out(),
    .rd_B_en(),
    .data_B_out(),
    .through_C_en(),
    .data_C_out(),
    .data_out()
);
*/

module GPR
(
    input   wire        clk,
    input   wire        rst_n,

    input   wire        wt_en,
    input   wire[31:0]  data_in,
    
    input   wire        rd_A_en,
    output  wire[31:0]  data_A_out,

    input   wire        rd_B_en,
    output  wire[31:0]  data_B_out,

    input   wire        through_C_en,
    output  wire[31:0]  data_C_out,

    output  wire[31:0]  data_out
);
    reg[31:0] data;
    initial begin
        data <= 32'd0;
    end

    assign data_A_out = rd_A_en ? data : 32'bz;
    assign data_B_out = rd_B_en ? data : 32'bz;
    assign data_C_out = wt_en & through_C_en ? data : 32'bz;
    assign data_out = data;

    always @(negedge rst_n, posedge clk) begin
        if (!rst_n) data <= 32'd0;
        else begin
            if (wt_en && !through_C_en) data <= data_in;
            else data <= data;
        end
    end

endmodule