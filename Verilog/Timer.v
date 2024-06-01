/*
TIMER timer
#(
    .FREQ(27000000)
)
(
    .clk(),
    .rst_n(),
    .rd_A_en(),
    .data_A_out(),
    .rd_B_en(),
    .data_B_out(),
    .data_out()
);
*/

module TIMER
#(
    parameter FREQ = 27_000_000
)
(
    input   wire        clk,
    input   wire        rst_n,

    input   wire        rd_A_en,
    output  wire[31:0]  data_A_out,

    input   wire        rd_B_en,
    output  wire[31:0]  data_B_out,

    output  wire[31:0]  data_out
);

    localparam CNT = FREQ / 1000;

    reg[31:0]   data;
    reg[31:0]   counter;

    initial begin
        data <= 32'd0;
        counter <= 32'd0;
    end

    assign data_A_out = rd_A_en ? data : 32'bz;
    assign data_B_out = rd_B_en ? data : 32'bz;
    assign data_out = data;

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) data <= 32'd0;
        else begin
            if (counter == CNT - 1) data <= data + 1'b1;
            else data <= data;
        end
    end

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) counter <= 32'd0;
        else begin
            if (counter == CNT - 1) counter <= 32'd0;
            else counter <= counter + 1'b1;
        end
    end

endmodule