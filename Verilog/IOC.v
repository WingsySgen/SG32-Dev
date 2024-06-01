/*
IOController
#(
    .IONUM()
)
ioc
(
    .wt_en,
    .data_in(),
    .rd_A_en(),
    .data_A_out(),
    .rd_B_en(),
    .data_B_out(),
    .data_out(),
    .addr_in(),
    .wr_en(),
    .cs_en(),
    .data(),
    .register_addr_out()
);
*/
module IOController
#(
    parameter IONUM = 16
)
(
    input   wire        wt_en,
    input   wire[31:0]  data_in,
    
    input   wire        rd_A_en,
    output  wire[31:0]  data_A_out,

    input   wire        rd_B_en,
    output  wire[31:0]  data_B_out,

    output  wire[31:0]  data_out,

    input   wire[31:0]  addr_in,
    output  wire        wt_io,
    output  wire        rd_io,
    output  wire[IONUM - 1:0]   cs_io,

    output  wire[3:0]   register_addr_out,
    
    inout   wire[31:0]  data
);

    assign cs_io = 1 << addr_in[31:4];
    assign wt_io = wt_en;
    assign rd_io = rd_A_en | rd_B_en;
    assign data = (wt_en ? data_in : 32'dz);

    assign data_A_out = rd_A_en ? data : 32'bz;
    assign data_B_out = rd_B_en ? data : 32'bz;
    assign data_out = data;

    assign register_addr_out = addr_in[3:0];

endmodule