module MEM
(
    input           en,
    input           clk,
    input           rst_n,

    input   [5:0]   opcode_in,
    input   [31:0]  data_A_in,
    input   [31:0]  data_B_in,

    input           boot,

    //CRAM - A
    input   [31:0]  PC_in,
    output  [31:0]  instuction,

    //DRAM - A & CRAM - B
    //data = data_A_in
    //addr = data_B_in
    output  [31:0]  data_out,

    //DRAM - B (Stack)
    input           cal_en,
    input           int_en,     //在外部，int_en = hint_en | sint_en
    input           ret_en,
    input           irt_en,
    input           hint_en,    //有效是否有有效的硬中断 
    input   [31:0]  sp,
    input   [31:0]  pc_nxt,
    output          stack_inc,
    output          stack_dec,
    output  [31:0]  stack_out
    
);

    wire            wre_RAM;
    wire    [31:0]  CRAM_B_out, DRAM_A_out;

    assign  wre_RAM = en ? opcode_in[0] : 1'b0;
    assign  data_out = (en & !opcode_in[0]) ? (boot ? CRAM_B_out : DRAM_A_out) : 32'dz;
    assign  stack_inc = (en ? opcode_in == 6'b000011 : 1'b0) | int_en | cal_en;
    assign  stack_dec = (en ? opcode_in == 6'b000010 : 1'b0) | ret_en | irt_en;

    /*
    a = pc      r
    b = boot    r/w 行为和RAM相同    理论上r/w，实际上仅w
    */
    CRAM cram(
        .douta(instuction), //output [31:0] douta
        .clka(clk), //input clka
        .ocea(1'b1), //input ocea
        .cea(1'b1), //input cea
        .reseta(1'b0), //input reseta
        .wrea(1'b0), //input wrea
        .ada(PC_in), //input [13:0] ada
        .dina(32'd0), //input [31:0] dina

        .doutb(CRAM_B_out), //output [31:0] doutb
        .clkb(~clk), //input clkb
        .oceb(1'b1), //input oceb
        .ceb(boot), //input ceb
        .resetb(1'b0), //input resetb
        .wreb(wre_RAM), //input wreb
        .adb(data_B_in), //input [13:0] adb
        .dinb(data_A_in) //input [31:0] dinb
    );

    /*
    a = ram      r/w
    b = stack    r/w
    */
    DRAM dram(
        .douta(DRAM_A_out), //output [31:0] douta
        .clka(~clk), //input clka
        .ocea(1'b1), //input ocea
        .cea(~boot), //input cea
        .reseta(1'b0), //input reseta
        .wrea(wre_RAM), //input wrea
        .ada(data_B_in), //input [12:0] ada
        .dina(data_A_in), //input [31:0] dina

        .doutb(stack_out), //output [31:0] doutb
        .clkb(~clk), //input clkb
        .oceb(1'b1), //input oceb
        .ceb(1'b1), //input ceb
        .resetb(1'b0), //input resetb
        .wreb(stack_inc), //input wreb
        .adb(sp + stack_inc), //input [12:0] adb
        .dinb(hint_en ? PC_in : pc_nxt) //input [31:0] dinb
    );

    //好像搞忘了为什么DRAM的dinb要用(hint_en ? PC_in : pc_nxt)这个逻辑了

endmodule