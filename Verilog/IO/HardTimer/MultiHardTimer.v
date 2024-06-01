module MultiHardTimer
(
    input   wire            clk,
    input   wire            rst_n,

    inout   wire[31:0]      data_io,
    input   wire            cs_en,
    input   wire            wt_en,
    input   wire            rd_en,
    input   wire[3:0]       addr_in,
    
    input   wire[31:0]      timer_in,
    output  wire            int
);
    wire[31:0]  wdata;
    wire[31:0]  rdata;
    assign wdata = wt_en && cs_en ? data_io : 32'dz;
    assign data_io = cs_en ? (wt_en ? 32'dz : rdata) : 32'dz;
    assign addr = cs_en ? addr_in : 4'b1111;

    reg[31:0]   data;
    reg         int_en;

    assign int = int_en ? (timer_in == data) : 1'b0;
    assign rdata = (addr == 4'h0 ? data : (addr == 4'hf ? {31'd0, int_en} : 32'd0));

    initial begin
        data <= 32'd0;
        int_en <= 1'b0;
    end

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) int_en <= 1'd0;
        else begin
            if (wt_en && addr_in == 4'hf) int_en <= data_io[0];
            else int_en <= int_en;
        end
    end

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) data <= 32'd0;
        else begin
            if (wt_en && addr_in == 4'd0) data <= data_io;
            else data <= data;
        end
    end

endmodule