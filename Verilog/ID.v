/*
32位机指令集如果仍然按4倍去写对于空间浪费过大
所以仍然采用32位指令。

在之前的8bit机上，条件指令中的第三个参数一定是一个立即数
这个限制使得不能按寄存器中的值进行跳转
如果立即数范围足够时产生的问题还不大
但是当立即数范围达不到位宽时，必须存在一个能够读取寄存器跳转的方式。
*/

/*
ID id(
    .opcode_in(),
    .alu_en(),
    .cond_en(),
    .ram_en(),
    .opcode_out(),
    .data_A_out(),
    .data_B_out(),
    .data_C_out(),
    .gprs_wt_en(),
    .gprs_rd_A_en(),
    .gprs_rd_B_en(),
    .stack_inc(),
    .stack_dec()
);
*/

module ID
(
    input   wire[31:0]  opcode_in,

    output  wire        alu_en,
    output  wire        cond_en,
    output  wire        ram_en,
    output  wire        ext_en,

    output  wire[5:0]   opcode_out,

    output  wire[1:0]   imm,

    output  wire[31:0]  data_A_out,     //#A上的输出        有立即数输出立即数，否则输出z
    output  wire[31:0]  data_B_out,     //#B上的输出        有立即数输出立即数，否则输出z
    output  wire[31:0]  data_C_out,     //#C上的输出        有立即数输出立即数，否则输出z
    output  wire[31:0]  gprs_wt_en,     //寄存器组的输入使能 #C上有立即数时输出0
    output  wire[31:0]  gprs_rd_A_en,   //寄存器组的输出使能 #A上有立即数时输出0
    output  wire[31:0]  gprs_rd_B_en    //寄存器组的输出使能 #B上有立即数时输出0

);

    wire[4:0] gprs_rd_A;
    wire[4:0] gprs_rd_B;
    wire[4:0] gprs_wt;

    wire[1:0] type;

    assign opcode_out = opcode_in[9:4];
    assign type = opcode_in[1:0];
    assign imm  = opcode_in[3:2];

    assign alu_en  = type == 2'b00 ? 1'b1 : 1'b0;
    assign ram_en  = type == 2'b01 ? 1'b1 : 1'b0;
    assign cond_en = type == 2'b10 ? 1'b1 : 1'b0;
    assign ext_en  = type == 2'b11 ? 1'b1 : 1'b0;

    /*
    imm     14:10   19:15   24:20 / 31:20
    00      r1      r2      r3
    01      r2      r3      imm1
    10      r1      r3      imm2
    11      r1      r2      imm3
    */
    assign gprs_rd_A    = imm == 2'b01 ? 5'b0 : opcode_in[14:10];
    assign gprs_rd_A_en = ext_en ? 32'd0 : (imm == 2'b01 ? 32'd0 : 32'd1 << gprs_rd_A);
    assign data_A_out   = ext_en ? 32'dz : (imm == 2'b01 ? opcode_in[31:20] : 32'dz);

    assign gprs_rd_B    = imm == 2'b10 ? 5'b0 : (imm == 2'b01 ? opcode_in[14:10] : opcode_in[19:15]);
    assign gprs_rd_B_en = ext_en ? 32'd0 : (imm == 2'b10 ? 32'd0 : 32'd1 << gprs_rd_B);
    assign data_B_out   = ext_en ? 32'dz : (imm == 2'b10 ? opcode_in[31:20] : 32'dz);

    assign gprs_wt      = imm == 2'b11 ? 5'b0 : (imm == 2'b00 ? opcode_in[24:20] : opcode_in[19:15]);
    assign gprs_wt_en   = ext_en ? 32'd0 : (imm == 2'b11 ? 32'd0 : 32'd1 << gprs_wt);
    assign data_C_out   = ext_en ? 32'dz : (imm == 2'b11 ? opcode_in[31:20] : 32'dz);

endmodule