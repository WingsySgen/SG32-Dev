module INT_EN_INTERFACE
(
    input   wire            clk,
    input   wire            rst_n,

    inout   wire[31:0]      data_io,
    input   wire            cs_en,
    input   wire            wt_en,
    input   wire            rd_en,

    output  wire[63:0]      int_en
);

    wire[31:0]  wdata;
    wire[31:0]  rdata;
    assign wdata = wt_en && cs_en ? data_io : 32'dz;
    assign data_io = cs_en ? (wt_en ? 32'dz : rdata) : 32'dz;

    wire wrx = cs_en ? wt_en : 1'b0;

    reg[31:0] data;
    initial begin
        data <= 32'hffffffff;
    end

    assign int_en = {data, {32{1'b1}}};
    assign rdata = data;

    integer i;
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            data <= 32'hffffffff;
        end
        else begin 
            if (wrx) data <= wdata;
            else data <= data;
        end
    end

endmodule