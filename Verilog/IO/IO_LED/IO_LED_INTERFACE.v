module IO_LED_INTERFACE
(
    input   wire            clk,
    input   wire            rst_n,

    inout   wire[31:0]      data_io,
    input   wire            cs_en,
    input   wire            wt_en,
    input   wire            rd_en,

    output  wire[3:0]       data_out
);

    wire[31:0]  wdata;
    wire[31:0]  rdata;
    assign wdata = wt_en && cs_en ? data_io : 32'dz;
    assign data_io = cs_en ? (wt_en ? 32'dz : rdata) : 32'dz;

    wire wrx = cs_en ? wt_en : 1'b0;

    reg[3:0] data;
    initial begin
        data <= 4'd0;
    end

    assign rdata = {28'd0, data};
    assign data_out = data;

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            data <= 4'd0;
        end
        else if (wrx) begin
            data <= data_io[3:0];
        end
        else begin
            data <= data;
        end
    end

endmodule