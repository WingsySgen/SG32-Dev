module Template
(
    input   wire            clk,
    input   wire            rst_n,

    inout   wire[31:0]      data_io,
    input   wire            cs_en,
    input   wire            wt_en,
    input   wire            rd_en,
    input   wire[3:0]       addr_in
    
    /*
    自定义接口
    */
);
    wire[31:0]  wdata;
    wire[31:0]  rdata;
    assign wdata = wt_en && cs_en ? data_io : 32'dz;
    assign data_io = cs_en ? (wt_en ? 32'dz : rdata) : 32'dz;
    assign addr = cs_en ? addr_in : 4'b1111;

//    wire wrx = cs_en ? wt_en : 1'b0;
    
    /*
    自定义行为
    */
    
endmodule