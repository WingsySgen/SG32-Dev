module BOOT_EN_INTERFACE
(
    input   wire            clk,
    input   wire            rst_n,

    inout   wire[31:0]      data_io,
    input   wire            cs_en,
    input   wire            wt_en,
    input   wire            rd_en,
    input   wire[3:0]       addr_in,

    output  wire            boot_mode
    /*
        0 = 操作RAM
        1 = 操作指令RAM
    */
);

    wire[31:0]  wdata;
    wire[31:0]  rdata;
    assign wdata = wt_en && cs_en ? data_io : 32'dz;
    assign data_io = cs_en ? (wt_en ? 32'dz : rdata) : 32'dz;
    assign addr = cs_en ? addr_in : 4'b1111;

    wire wrx = cs_en ? wt_en : 1'b0;

    reg data;
    initial begin
        data <= 1'd0;
    end

    assign rdata = {31'd0, data};
    assign boot_mode = data;

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            data <= 1'b0;
        end
        else if (wrx) begin
            data <= data_io[0];
        end
        else begin
            data <= data;
        end
    end

endmodule