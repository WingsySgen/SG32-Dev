/*
0 = 指令基址寄存器
1 = 内存基址寄存器
2 = 栈指针寄存器
*/
module BASE_ADDR_INTERFACE
(
    input   wire            clk,
    input   wire            rst_n,

    inout   wire[31:0]      data_io,
    input   wire            cs_en,
    input   wire            wt_en,
    input   wire            rd_en,
    input   wire[3:0]       addr_in,

    input   wire            stack_inc_en,
    input   wire            stack_dec_en,

    output  wire[31:0]      base_prog_addr,
    output  wire[31:0]      base_ram_addr,
    output  wire[31:0]      stack_addr
);

    wire[31:0]  wdata;
    wire[31:0]  rdata;
    assign wdata = wt_en && cs_en ? data_io : 32'dz;
    assign data_io = cs_en ? (wt_en ? 32'dz : rdata) : 32'dz;
    assign addr = cs_en ? addr_in : 4'b1111;

    wire wrx = cs_en ? wt_en : 1'b0;

    reg[31:0] data[2:0];
    initial begin
        data[0] <= 32'd0;
        data[1] <= 32'd0;
        data[2] <= 32'h1C00;
    end

    assign base_prog_addr = data[0];
    assign base_ram_addr  = data[1];
    assign stack_addr     = data[2];
    assign rdata = data[addr_in];

    integer i;
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            data[0] <= 32'd0;
            data[1] <= 32'd0;
            data[2] <= 32'h1C00;
        end
        else if (wrx) begin
            for(i = 0; i < 3; i = i + 1) begin
                if (i == addr_in) data[i] <= wdata;
                else data[i] <= data[i];
            end
        end
        else if (stack_inc_en)  begin
            data[0] <= data[0];
            data[1] <= data[1];
            data[2] <= data[2] + 1'b1;
        end
        else if (stack_dec_en)  begin
            data[0] <= data[0];
            data[1] <= data[1];
            data[2] <= data[2] - 1'b1;
        end
        else begin
            for(i = 0; i < 3; i = i + 1) begin
                data[i] <= data[i];
            end
        end
    end

endmodule