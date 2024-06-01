/*
UART_INTERFACE uart
#(
    .FREQ(FREQ)
)
(
    .clk(),
    .rst_n(),
    .data_io(),
    .cs_en(),
    .wrx(),
    .addr_in(),
    .RX(),
    .TX(),
    .int()
);
*/

module UART_INTERFACE
#(
    parameter FREQ = 27_000_000
)
(
    input   wire            clk,
    input   wire            rst_n,
    
    inout   wire[31:0]      data_io,
    input   wire            cs_en,
    input   wire            wt_en,
    input   wire            rd_en,
    input   wire[3:0]       addr_in,

    input   wire            RX,
    output  wire            TX,
    output  wire            int
);

    wire[31:0]  wdata;
    wire[31:0]  rdata;
    wire[3:0]   addr;
    wire        rxrdy_n, txrdy_n;
    wire[7:0]   rdata_t;

    reg         rd;
    reg[7:0]    int_en;

    initial begin
        rd <= 1'b0;
        int_en <= 8'd1;
    end

    assign rdata = (addr_in == 4'b1111 ? int_en : rdata_t);
    assign wdata = wt_en && cs_en ? data_io : 32'dz;
    assign data_io = cs_en ? (wt_en ? 32'dz : rdata) : 32'dz;
    assign addr = cs_en ? addr_in : 4'b1111;
    assign int = !((int_en[0] ? rxrdy_n : 1'b1) && (int_en[1] ? txrdy_n : 1'b1));

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) rd <= 1'b0;
        else rd <= rd_en;
    end

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) int_en <= 8'd1;
        else begin
            if (cs_en && wt_en && (addr_in == 4'b1111)) int_en <= wdata;
            else int_en <= int_en;
        end
    end

    //当addr为1111时，这里没有阻止向0x07写入
    UART_MASTER_Top uart_master(
		.I_CLK(clk), //input I_CLK
		.I_RESETN(rst_n), //input I_RESETN
		.I_TX_EN(cs_en ? wt_en : 1'b0), //input I_TX_EN
		.I_WADDR(addr), //input [2:0] I_WADDR
		.I_WDATA(wdata), //input [7:0] I_WDATA
		.I_RX_EN(cs_en ? rd : 1'b0), //input I_RX_EN
		.I_RADDR(addr), //input [2:0] I_RADDR
		.O_RDATA(rdata_t), //output [7:0] O_RDATA
		.SIN(RX), //input SIN
		.RxRDYn(rxrdy_n), //output RxRDYn
		.SOUT(TX), //output SOUT
		.TxRDYn(txrdy_n), //output TxRDYn
		.DDIS(), //output DDIS
		.INTR(), //output INTR
		.DCDn(), //input DCDn
		.CTSn(), //input CTSn
		.DSRn(), //input DSRn
		.RIn(), //input RIn
		.DTRn(), //output DTRn
		.RTSn() //output RTSn
	);

endmodule