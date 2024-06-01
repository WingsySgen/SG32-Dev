//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//Tool Version: V1.9.9.02
//Part Number: GW5AST-LV138FPG676AES
//Device: GW5AST-138B
//Device Version: B
//Created Time: Sat May 18 15:45:16 2024

module CRAM (douta, doutb, clka, ocea, cea, reseta, wrea, clkb, oceb, ceb, resetb, wreb, ada, dina, adb, dinb);

output [31:0] douta;
output [31:0] doutb;
input clka;
input ocea;
input cea;
input reseta;
input wrea;
input clkb;
input oceb;
input ceb;
input resetb;
input wreb;
input [12:0] ada;
input [31:0] dina;
input [12:0] adb;
input [31:0] dinb;

wire [8:0] dpx9b_inst_0_douta_w;
wire [8:0] dpx9b_inst_0_douta;
wire [8:0] dpx9b_inst_0_doutb_w;
wire [8:0] dpx9b_inst_0_doutb;
wire [8:0] dpx9b_inst_1_douta_w;
wire [8:0] dpx9b_inst_1_douta;
wire [8:0] dpx9b_inst_1_doutb_w;
wire [8:0] dpx9b_inst_1_doutb;
wire [8:0] dpx9b_inst_2_douta_w;
wire [8:0] dpx9b_inst_2_douta;
wire [8:0] dpx9b_inst_2_doutb_w;
wire [8:0] dpx9b_inst_2_doutb;
wire [8:0] dpx9b_inst_3_douta_w;
wire [8:0] dpx9b_inst_3_douta;
wire [8:0] dpx9b_inst_3_doutb_w;
wire [8:0] dpx9b_inst_3_doutb;
wire [8:0] dpx9b_inst_4_douta_w;
wire [17:9] dpx9b_inst_4_douta;
wire [8:0] dpx9b_inst_4_doutb_w;
wire [17:9] dpx9b_inst_4_doutb;
wire [8:0] dpx9b_inst_5_douta_w;
wire [17:9] dpx9b_inst_5_douta;
wire [8:0] dpx9b_inst_5_doutb_w;
wire [17:9] dpx9b_inst_5_doutb;
wire [8:0] dpx9b_inst_6_douta_w;
wire [17:9] dpx9b_inst_6_douta;
wire [8:0] dpx9b_inst_6_doutb_w;
wire [17:9] dpx9b_inst_6_doutb;
wire [8:0] dpx9b_inst_7_douta_w;
wire [17:9] dpx9b_inst_7_douta;
wire [8:0] dpx9b_inst_7_doutb_w;
wire [17:9] dpx9b_inst_7_doutb;
wire [13:0] dpb_inst_8_douta_w;
wire [13:0] dpb_inst_8_doutb_w;
wire [13:0] dpb_inst_9_douta_w;
wire [13:0] dpb_inst_9_doutb_w;
wire [13:0] dpb_inst_10_douta_w;
wire [13:0] dpb_inst_10_doutb_w;
wire [13:0] dpb_inst_11_douta_w;
wire [13:0] dpb_inst_11_doutb_w;
wire [13:0] dpb_inst_12_douta_w;
wire [13:0] dpb_inst_12_doutb_w;
wire [13:0] dpb_inst_13_douta_w;
wire [13:0] dpb_inst_13_doutb_w;
wire [13:0] dpb_inst_14_douta_w;
wire [13:0] dpb_inst_14_doutb_w;
wire dff_q_0;
wire dff_q_1;
wire dff_q_2;
wire dff_q_3;
wire mux_o_0;
wire mux_o_1;
wire mux_o_3;
wire mux_o_4;
wire mux_o_6;
wire mux_o_7;
wire mux_o_9;
wire mux_o_10;
wire mux_o_12;
wire mux_o_13;
wire mux_o_15;
wire mux_o_16;
wire mux_o_18;
wire mux_o_19;
wire mux_o_21;
wire mux_o_22;
wire mux_o_24;
wire mux_o_25;
wire mux_o_27;
wire mux_o_28;
wire mux_o_30;
wire mux_o_31;
wire mux_o_33;
wire mux_o_34;
wire mux_o_36;
wire mux_o_37;
wire mux_o_39;
wire mux_o_40;
wire mux_o_42;
wire mux_o_43;
wire mux_o_45;
wire mux_o_46;
wire mux_o_48;
wire mux_o_49;
wire mux_o_51;
wire mux_o_52;
wire mux_o_54;
wire mux_o_55;
wire mux_o_57;
wire mux_o_58;
wire mux_o_60;
wire mux_o_61;
wire mux_o_63;
wire mux_o_64;
wire mux_o_66;
wire mux_o_67;
wire mux_o_69;
wire mux_o_70;
wire mux_o_72;
wire mux_o_73;
wire mux_o_75;
wire mux_o_76;
wire mux_o_78;
wire mux_o_79;
wire mux_o_81;
wire mux_o_82;
wire mux_o_84;
wire mux_o_85;
wire mux_o_87;
wire mux_o_88;
wire mux_o_90;
wire mux_o_91;
wire mux_o_93;
wire mux_o_94;
wire mux_o_96;
wire mux_o_97;
wire mux_o_99;
wire mux_o_100;
wire mux_o_102;
wire mux_o_103;
wire mux_o_105;
wire mux_o_106;
wire cea_w;
wire ceb_w;
wire gw_gnd;

assign cea_w = ~wrea & cea;
assign ceb_w = ~wreb & ceb;
assign gw_gnd = 1'b0;

DPX9B dpx9b_inst_0 (
    .DOA({dpx9b_inst_0_douta_w[8:0],dpx9b_inst_0_douta[8:0]}),
    .DOB({dpx9b_inst_0_doutb_w[8:0],dpx9b_inst_0_doutb[8:0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[12],ada[11]}),
    .BLKSELB({gw_gnd,adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[8:0]})
);

defparam dpx9b_inst_0.READ_MODE0 = 1'b0;
defparam dpx9b_inst_0.READ_MODE1 = 1'b0;
defparam dpx9b_inst_0.WRITE_MODE0 = 2'b00;
defparam dpx9b_inst_0.WRITE_MODE1 = 2'b00;
defparam dpx9b_inst_0.BIT_WIDTH_0 = 9;
defparam dpx9b_inst_0.BIT_WIDTH_1 = 9;
defparam dpx9b_inst_0.BLK_SEL_0 = 3'b000;
defparam dpx9b_inst_0.BLK_SEL_1 = 3'b000;
defparam dpx9b_inst_0.RESET_MODE = "SYNC";
defparam dpx9b_inst_0.INIT_RAM_00 = 288'h4F3013C1E602781C1E622781CC00000000C41718188000031188C4623113C0E000381C00;
defparam dpx9b_inst_0.INIT_RAM_01 = 288'h601C1509E382A13C7054279809E01004000E4F0381C1808A79809E0F3013CC4620383011;
defparam dpx9b_inst_0.INIT_RAM_02 = 288'h000000000413000000003105C60620000000622098000620B8C0C40000000C4413118882;
defparam dpx9b_inst_0.INIT_RAM_03 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
defparam dpx9b_inst_0.INIT_RAM_04 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
defparam dpx9b_inst_0.INIT_RAM_05 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
defparam dpx9b_inst_0.INIT_RAM_06 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
defparam dpx9b_inst_0.INIT_RAM_07 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
defparam dpx9b_inst_0.INIT_RAM_08 = 288'h00000000000000000000000000000000000000000000000001042E040393C08603101CC4;

DPX9B dpx9b_inst_1 (
    .DOA({dpx9b_inst_1_douta_w[8:0],dpx9b_inst_1_douta[8:0]}),
    .DOB({dpx9b_inst_1_doutb_w[8:0],dpx9b_inst_1_doutb[8:0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[12],ada[11]}),
    .BLKSELB({gw_gnd,adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[8:0]})
);

defparam dpx9b_inst_1.READ_MODE0 = 1'b0;
defparam dpx9b_inst_1.READ_MODE1 = 1'b0;
defparam dpx9b_inst_1.WRITE_MODE0 = 2'b00;
defparam dpx9b_inst_1.WRITE_MODE1 = 2'b00;
defparam dpx9b_inst_1.BIT_WIDTH_0 = 9;
defparam dpx9b_inst_1.BIT_WIDTH_1 = 9;
defparam dpx9b_inst_1.BLK_SEL_0 = 3'b001;
defparam dpx9b_inst_1.BLK_SEL_1 = 3'b001;
defparam dpx9b_inst_1.RESET_MODE = "SYNC";

DPX9B dpx9b_inst_2 (
    .DOA({dpx9b_inst_2_douta_w[8:0],dpx9b_inst_2_douta[8:0]}),
    .DOB({dpx9b_inst_2_doutb_w[8:0],dpx9b_inst_2_doutb[8:0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[12],ada[11]}),
    .BLKSELB({gw_gnd,adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[8:0]})
);

defparam dpx9b_inst_2.READ_MODE0 = 1'b0;
defparam dpx9b_inst_2.READ_MODE1 = 1'b0;
defparam dpx9b_inst_2.WRITE_MODE0 = 2'b00;
defparam dpx9b_inst_2.WRITE_MODE1 = 2'b00;
defparam dpx9b_inst_2.BIT_WIDTH_0 = 9;
defparam dpx9b_inst_2.BIT_WIDTH_1 = 9;
defparam dpx9b_inst_2.BLK_SEL_0 = 3'b010;
defparam dpx9b_inst_2.BLK_SEL_1 = 3'b010;
defparam dpx9b_inst_2.RESET_MODE = "SYNC";

DPX9B dpx9b_inst_3 (
    .DOA({dpx9b_inst_3_douta_w[8:0],dpx9b_inst_3_douta[8:0]}),
    .DOB({dpx9b_inst_3_doutb_w[8:0],dpx9b_inst_3_doutb[8:0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[12],ada[11]}),
    .BLKSELB({gw_gnd,adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[8:0]})
);

defparam dpx9b_inst_3.READ_MODE0 = 1'b0;
defparam dpx9b_inst_3.READ_MODE1 = 1'b0;
defparam dpx9b_inst_3.WRITE_MODE0 = 2'b00;
defparam dpx9b_inst_3.WRITE_MODE1 = 2'b00;
defparam dpx9b_inst_3.BIT_WIDTH_0 = 9;
defparam dpx9b_inst_3.BIT_WIDTH_1 = 9;
defparam dpx9b_inst_3.BLK_SEL_0 = 3'b011;
defparam dpx9b_inst_3.BLK_SEL_1 = 3'b011;
defparam dpx9b_inst_3.RESET_MODE = "SYNC";

DPX9B dpx9b_inst_4 (
    .DOA({dpx9b_inst_4_douta_w[8:0],dpx9b_inst_4_douta[17:9]}),
    .DOB({dpx9b_inst_4_doutb_w[8:0],dpx9b_inst_4_doutb[17:9]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[12],ada[11]}),
    .BLKSELB({gw_gnd,adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[17:9]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[17:9]})
);

defparam dpx9b_inst_4.READ_MODE0 = 1'b0;
defparam dpx9b_inst_4.READ_MODE1 = 1'b0;
defparam dpx9b_inst_4.WRITE_MODE0 = 2'b00;
defparam dpx9b_inst_4.WRITE_MODE1 = 2'b00;
defparam dpx9b_inst_4.BIT_WIDTH_0 = 9;
defparam dpx9b_inst_4.BIT_WIDTH_1 = 9;
defparam dpx9b_inst_4.BLK_SEL_0 = 3'b000;
defparam dpx9b_inst_4.BLK_SEL_1 = 3'b000;
defparam dpx9b_inst_4.RESET_MODE = "SYNC";
defparam dpx9b_inst_4.INIT_RAM_00 = 288'h000B800021700001AEC0000003A000000100190E80000004028100A04000000000000000;
defparam dpx9b_inst_4.INIT_RAM_01 = 288'h0E773DC00EE7B801DCF70005C00003000000000000042570005C00010B801408000084AE;
defparam dpx9b_inst_4.INIT_RAM_02 = 288'h000000000000E8000000400643A000000000800005C00800C87400000000100005020000;
defparam dpx9b_inst_4.INIT_RAM_03 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
defparam dpx9b_inst_4.INIT_RAM_04 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
defparam dpx9b_inst_4.INIT_RAM_05 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
defparam dpx9b_inst_4.INIT_RAM_06 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
defparam dpx9b_inst_4.INIT_RAM_07 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
defparam dpx9b_inst_4.INIT_RAM_08 = 288'h00000000000000000000000000000000000000000000000000007C3E0000042014000040;

DPX9B dpx9b_inst_5 (
    .DOA({dpx9b_inst_5_douta_w[8:0],dpx9b_inst_5_douta[17:9]}),
    .DOB({dpx9b_inst_5_doutb_w[8:0],dpx9b_inst_5_doutb[17:9]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[12],ada[11]}),
    .BLKSELB({gw_gnd,adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[17:9]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[17:9]})
);

defparam dpx9b_inst_5.READ_MODE0 = 1'b0;
defparam dpx9b_inst_5.READ_MODE1 = 1'b0;
defparam dpx9b_inst_5.WRITE_MODE0 = 2'b00;
defparam dpx9b_inst_5.WRITE_MODE1 = 2'b00;
defparam dpx9b_inst_5.BIT_WIDTH_0 = 9;
defparam dpx9b_inst_5.BIT_WIDTH_1 = 9;
defparam dpx9b_inst_5.BLK_SEL_0 = 3'b001;
defparam dpx9b_inst_5.BLK_SEL_1 = 3'b001;
defparam dpx9b_inst_5.RESET_MODE = "SYNC";

DPX9B dpx9b_inst_6 (
    .DOA({dpx9b_inst_6_douta_w[8:0],dpx9b_inst_6_douta[17:9]}),
    .DOB({dpx9b_inst_6_doutb_w[8:0],dpx9b_inst_6_doutb[17:9]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[12],ada[11]}),
    .BLKSELB({gw_gnd,adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[17:9]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[17:9]})
);

defparam dpx9b_inst_6.READ_MODE0 = 1'b0;
defparam dpx9b_inst_6.READ_MODE1 = 1'b0;
defparam dpx9b_inst_6.WRITE_MODE0 = 2'b00;
defparam dpx9b_inst_6.WRITE_MODE1 = 2'b00;
defparam dpx9b_inst_6.BIT_WIDTH_0 = 9;
defparam dpx9b_inst_6.BIT_WIDTH_1 = 9;
defparam dpx9b_inst_6.BLK_SEL_0 = 3'b010;
defparam dpx9b_inst_6.BLK_SEL_1 = 3'b010;
defparam dpx9b_inst_6.RESET_MODE = "SYNC";

DPX9B dpx9b_inst_7 (
    .DOA({dpx9b_inst_7_douta_w[8:0],dpx9b_inst_7_douta[17:9]}),
    .DOB({dpx9b_inst_7_doutb_w[8:0],dpx9b_inst_7_doutb[17:9]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[12],ada[11]}),
    .BLKSELB({gw_gnd,adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[17:9]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[17:9]})
);

defparam dpx9b_inst_7.READ_MODE0 = 1'b0;
defparam dpx9b_inst_7.READ_MODE1 = 1'b0;
defparam dpx9b_inst_7.WRITE_MODE0 = 2'b00;
defparam dpx9b_inst_7.WRITE_MODE1 = 2'b00;
defparam dpx9b_inst_7.BIT_WIDTH_0 = 9;
defparam dpx9b_inst_7.BIT_WIDTH_1 = 9;
defparam dpx9b_inst_7.BLK_SEL_0 = 3'b011;
defparam dpx9b_inst_7.BLK_SEL_1 = 3'b011;
defparam dpx9b_inst_7.RESET_MODE = "SYNC";

DPB dpb_inst_8 (
    .DOA({dpb_inst_8_douta_w[13:0],douta[19:18]}),
    .DOB({dpb_inst_8_doutb_w[13:0],doutb[19:18]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,gw_gnd}),
    .BLKSELB({gw_gnd,gw_gnd,gw_gnd}),
    .ADA({ada[12:0],gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[19:18]}),
    .ADB({adb[12:0],gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[19:18]})
);

defparam dpb_inst_8.READ_MODE0 = 1'b0;
defparam dpb_inst_8.READ_MODE1 = 1'b0;
defparam dpb_inst_8.WRITE_MODE0 = 2'b00;
defparam dpb_inst_8.WRITE_MODE1 = 2'b00;
defparam dpb_inst_8.BIT_WIDTH_0 = 2;
defparam dpb_inst_8.BIT_WIDTH_1 = 2;
defparam dpb_inst_8.BLK_SEL_0 = 3'b000;
defparam dpb_inst_8.BLK_SEL_1 = 3'b000;
defparam dpb_inst_8.RESET_MODE = "SYNC";
defparam dpb_inst_8.INIT_RAM_00 = 256'h000000000000000000003FC0C0FF033C28A28030000003C000028003FC3FF000;
defparam dpb_inst_8.INIT_RAM_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam dpb_inst_8.INIT_RAM_02 = 256'h000000000000000000000000000000000000000000000000000000000003C030;

DPB dpb_inst_9 (
    .DOA({dpb_inst_9_douta_w[13:0],douta[21:20]}),
    .DOB({dpb_inst_9_doutb_w[13:0],doutb[21:20]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,gw_gnd}),
    .BLKSELB({gw_gnd,gw_gnd,gw_gnd}),
    .ADA({ada[12:0],gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[21:20]}),
    .ADB({adb[12:0],gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[21:20]})
);

defparam dpb_inst_9.READ_MODE0 = 1'b0;
defparam dpb_inst_9.READ_MODE1 = 1'b0;
defparam dpb_inst_9.WRITE_MODE0 = 2'b00;
defparam dpb_inst_9.WRITE_MODE1 = 2'b00;
defparam dpb_inst_9.BIT_WIDTH_0 = 2;
defparam dpb_inst_9.BIT_WIDTH_1 = 2;
defparam dpb_inst_9.BLK_SEL_0 = 3'b000;
defparam dpb_inst_9.BLK_SEL_1 = 3'b000;
defparam dpb_inst_9.RESET_MODE = "SYNC";
defparam dpb_inst_9.INIT_RAM_00 = 256'h000000000000000000300D404404013CE38E3BA04D089004234AF8009414351C;
defparam dpb_inst_9.INIT_RAM_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam dpb_inst_9.INIT_RAM_02 = 256'h0000000000000000000000000000000000000000000000000000000000002D48;

DPB dpb_inst_10 (
    .DOA({dpb_inst_10_douta_w[13:0],douta[23:22]}),
    .DOB({dpb_inst_10_doutb_w[13:0],doutb[23:22]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,gw_gnd}),
    .BLKSELB({gw_gnd,gw_gnd,gw_gnd}),
    .ADA({ada[12:0],gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[23:22]}),
    .ADB({adb[12:0],gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[23:22]})
);

defparam dpb_inst_10.READ_MODE0 = 1'b0;
defparam dpb_inst_10.READ_MODE1 = 1'b0;
defparam dpb_inst_10.WRITE_MODE0 = 2'b00;
defparam dpb_inst_10.WRITE_MODE1 = 2'b00;
defparam dpb_inst_10.BIT_WIDTH_0 = 2;
defparam dpb_inst_10.BIT_WIDTH_1 = 2;
defparam dpb_inst_10.BLK_SEL_0 = 3'b000;
defparam dpb_inst_10.BLK_SEL_1 = 3'b000;
defparam dpb_inst_10.RESET_MODE = "SYNC";
defparam dpb_inst_10.INIT_RAM_00 = 256'h000000000000000000100E004C1801107BCFBFA00411C4304416F8006010310C;
defparam dpb_inst_10.INIT_RAM_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam dpb_inst_10.INIT_RAM_02 = 256'h00000000000000000000000000000000000000000000000000000000000244C0;

DPB dpb_inst_11 (
    .DOA({dpb_inst_11_douta_w[13:0],douta[25:24]}),
    .DOB({dpb_inst_11_doutb_w[13:0],doutb[25:24]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,gw_gnd}),
    .BLKSELB({gw_gnd,gw_gnd,gw_gnd}),
    .ADA({ada[12:0],gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[25:24]}),
    .ADB({adb[12:0],gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[25:24]})
);

defparam dpb_inst_11.READ_MODE0 = 1'b0;
defparam dpb_inst_11.READ_MODE1 = 1'b0;
defparam dpb_inst_11.WRITE_MODE0 = 2'b00;
defparam dpb_inst_11.WRITE_MODE1 = 2'b00;
defparam dpb_inst_11.BIT_WIDTH_0 = 2;
defparam dpb_inst_11.BIT_WIDTH_1 = 2;
defparam dpb_inst_11.BLK_SEL_0 = 3'b000;
defparam dpb_inst_11.BLK_SEL_1 = 3'b000;
defparam dpb_inst_11.RESET_MODE = "SYNC";
defparam dpb_inst_11.INIT_RAM_00 = 256'h000000000000000000100100040600004410005008338C90CE35C00050020038;
defparam dpb_inst_11.INIT_RAM_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam dpb_inst_11.INIT_RAM_02 = 256'h000000000000000000000000000000000000000000000000000000000000C040;

DPB dpb_inst_12 (
    .DOA({dpb_inst_12_douta_w[13:0],douta[27:26]}),
    .DOB({dpb_inst_12_doutb_w[13:0],doutb[27:26]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,gw_gnd}),
    .BLKSELB({gw_gnd,gw_gnd,gw_gnd}),
    .ADA({ada[12:0],gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[27:26]}),
    .ADB({adb[12:0],gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[27:26]})
);

defparam dpb_inst_12.READ_MODE0 = 1'b0;
defparam dpb_inst_12.READ_MODE1 = 1'b0;
defparam dpb_inst_12.WRITE_MODE0 = 2'b00;
defparam dpb_inst_12.WRITE_MODE1 = 2'b00;
defparam dpb_inst_12.BIT_WIDTH_0 = 2;
defparam dpb_inst_12.BIT_WIDTH_1 = 2;
defparam dpb_inst_12.BLK_SEL_0 = 3'b000;
defparam dpb_inst_12.BLK_SEL_1 = 3'b000;
defparam dpb_inst_12.RESET_MODE = "SYNC";
defparam dpb_inst_12.INIT_RAM_00 = 256'h0000000000000000000024008091020801041100400000000000D00200202400;
defparam dpb_inst_12.INIT_RAM_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam dpb_inst_12.INIT_RAM_02 = 256'h000000000000000000000000000000000000000000000000000000000000C000;

DPB dpb_inst_13 (
    .DOA({dpb_inst_13_douta_w[13:0],douta[29:28]}),
    .DOB({dpb_inst_13_doutb_w[13:0],doutb[29:28]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,gw_gnd}),
    .BLKSELB({gw_gnd,gw_gnd,gw_gnd}),
    .ADA({ada[12:0],gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[29:28]}),
    .ADB({adb[12:0],gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[29:28]})
);

defparam dpb_inst_13.READ_MODE0 = 1'b0;
defparam dpb_inst_13.READ_MODE1 = 1'b0;
defparam dpb_inst_13.WRITE_MODE0 = 2'b00;
defparam dpb_inst_13.WRITE_MODE1 = 2'b00;
defparam dpb_inst_13.BIT_WIDTH_0 = 2;
defparam dpb_inst_13.BIT_WIDTH_1 = 2;
defparam dpb_inst_13.BLK_SEL_0 = 3'b000;
defparam dpb_inst_13.BLK_SEL_1 = 3'b000;
defparam dpb_inst_13.RESET_MODE = "SYNC";
defparam dpb_inst_13.INIT_RAM_00 = 256'h0000000000000000000000000000000000000001000000000000000000000000;
defparam dpb_inst_13.INIT_RAM_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam dpb_inst_13.INIT_RAM_02 = 256'h0000000000000000000000000000000000000000000000000000000000015414;

DPB dpb_inst_14 (
    .DOA({dpb_inst_14_douta_w[13:0],douta[31:30]}),
    .DOB({dpb_inst_14_doutb_w[13:0],doutb[31:30]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,gw_gnd}),
    .BLKSELB({gw_gnd,gw_gnd,gw_gnd}),
    .ADA({ada[12:0],gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[31:30]}),
    .ADB({adb[12:0],gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[31:30]})
);

defparam dpb_inst_14.READ_MODE0 = 1'b0;
defparam dpb_inst_14.READ_MODE1 = 1'b0;
defparam dpb_inst_14.WRITE_MODE0 = 2'b00;
defparam dpb_inst_14.WRITE_MODE1 = 2'b00;
defparam dpb_inst_14.BIT_WIDTH_0 = 2;
defparam dpb_inst_14.BIT_WIDTH_1 = 2;
defparam dpb_inst_14.BLK_SEL_0 = 3'b000;
defparam dpb_inst_14.BLK_SEL_1 = 3'b000;
defparam dpb_inst_14.RESET_MODE = "SYNC";
defparam dpb_inst_14.INIT_RAM_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam dpb_inst_14.INIT_RAM_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam dpb_inst_14.INIT_RAM_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;

DFFRE dff_inst_0 (
  .Q(dff_q_0),
  .D(ada[12]),
  .CLK(clka),
  .CE(cea_w),
  .RESET(gw_gnd)
);
DFFRE dff_inst_1 (
  .Q(dff_q_1),
  .D(ada[11]),
  .CLK(clka),
  .CE(cea_w),
  .RESET(gw_gnd)
);
DFFRE dff_inst_2 (
  .Q(dff_q_2),
  .D(adb[12]),
  .CLK(clkb),
  .CE(ceb_w),
  .RESET(gw_gnd)
);
DFFRE dff_inst_3 (
  .Q(dff_q_3),
  .D(adb[11]),
  .CLK(clkb),
  .CE(ceb_w),
  .RESET(gw_gnd)
);
MUX2 mux_inst_0 (
  .O(mux_o_0),
  .I0(dpx9b_inst_0_douta[0]),
  .I1(dpx9b_inst_1_douta[0]),
  .S0(dff_q_1)
);
MUX2 mux_inst_1 (
  .O(mux_o_1),
  .I0(dpx9b_inst_2_douta[0]),
  .I1(dpx9b_inst_3_douta[0]),
  .S0(dff_q_1)
);
MUX2 mux_inst_2 (
  .O(douta[0]),
  .I0(mux_o_0),
  .I1(mux_o_1),
  .S0(dff_q_0)
);
MUX2 mux_inst_3 (
  .O(mux_o_3),
  .I0(dpx9b_inst_0_douta[1]),
  .I1(dpx9b_inst_1_douta[1]),
  .S0(dff_q_1)
);
MUX2 mux_inst_4 (
  .O(mux_o_4),
  .I0(dpx9b_inst_2_douta[1]),
  .I1(dpx9b_inst_3_douta[1]),
  .S0(dff_q_1)
);
MUX2 mux_inst_5 (
  .O(douta[1]),
  .I0(mux_o_3),
  .I1(mux_o_4),
  .S0(dff_q_0)
);
MUX2 mux_inst_6 (
  .O(mux_o_6),
  .I0(dpx9b_inst_0_douta[2]),
  .I1(dpx9b_inst_1_douta[2]),
  .S0(dff_q_1)
);
MUX2 mux_inst_7 (
  .O(mux_o_7),
  .I0(dpx9b_inst_2_douta[2]),
  .I1(dpx9b_inst_3_douta[2]),
  .S0(dff_q_1)
);
MUX2 mux_inst_8 (
  .O(douta[2]),
  .I0(mux_o_6),
  .I1(mux_o_7),
  .S0(dff_q_0)
);
MUX2 mux_inst_9 (
  .O(mux_o_9),
  .I0(dpx9b_inst_0_douta[3]),
  .I1(dpx9b_inst_1_douta[3]),
  .S0(dff_q_1)
);
MUX2 mux_inst_10 (
  .O(mux_o_10),
  .I0(dpx9b_inst_2_douta[3]),
  .I1(dpx9b_inst_3_douta[3]),
  .S0(dff_q_1)
);
MUX2 mux_inst_11 (
  .O(douta[3]),
  .I0(mux_o_9),
  .I1(mux_o_10),
  .S0(dff_q_0)
);
MUX2 mux_inst_12 (
  .O(mux_o_12),
  .I0(dpx9b_inst_0_douta[4]),
  .I1(dpx9b_inst_1_douta[4]),
  .S0(dff_q_1)
);
MUX2 mux_inst_13 (
  .O(mux_o_13),
  .I0(dpx9b_inst_2_douta[4]),
  .I1(dpx9b_inst_3_douta[4]),
  .S0(dff_q_1)
);
MUX2 mux_inst_14 (
  .O(douta[4]),
  .I0(mux_o_12),
  .I1(mux_o_13),
  .S0(dff_q_0)
);
MUX2 mux_inst_15 (
  .O(mux_o_15),
  .I0(dpx9b_inst_0_douta[5]),
  .I1(dpx9b_inst_1_douta[5]),
  .S0(dff_q_1)
);
MUX2 mux_inst_16 (
  .O(mux_o_16),
  .I0(dpx9b_inst_2_douta[5]),
  .I1(dpx9b_inst_3_douta[5]),
  .S0(dff_q_1)
);
MUX2 mux_inst_17 (
  .O(douta[5]),
  .I0(mux_o_15),
  .I1(mux_o_16),
  .S0(dff_q_0)
);
MUX2 mux_inst_18 (
  .O(mux_o_18),
  .I0(dpx9b_inst_0_douta[6]),
  .I1(dpx9b_inst_1_douta[6]),
  .S0(dff_q_1)
);
MUX2 mux_inst_19 (
  .O(mux_o_19),
  .I0(dpx9b_inst_2_douta[6]),
  .I1(dpx9b_inst_3_douta[6]),
  .S0(dff_q_1)
);
MUX2 mux_inst_20 (
  .O(douta[6]),
  .I0(mux_o_18),
  .I1(mux_o_19),
  .S0(dff_q_0)
);
MUX2 mux_inst_21 (
  .O(mux_o_21),
  .I0(dpx9b_inst_0_douta[7]),
  .I1(dpx9b_inst_1_douta[7]),
  .S0(dff_q_1)
);
MUX2 mux_inst_22 (
  .O(mux_o_22),
  .I0(dpx9b_inst_2_douta[7]),
  .I1(dpx9b_inst_3_douta[7]),
  .S0(dff_q_1)
);
MUX2 mux_inst_23 (
  .O(douta[7]),
  .I0(mux_o_21),
  .I1(mux_o_22),
  .S0(dff_q_0)
);
MUX2 mux_inst_24 (
  .O(mux_o_24),
  .I0(dpx9b_inst_0_douta[8]),
  .I1(dpx9b_inst_1_douta[8]),
  .S0(dff_q_1)
);
MUX2 mux_inst_25 (
  .O(mux_o_25),
  .I0(dpx9b_inst_2_douta[8]),
  .I1(dpx9b_inst_3_douta[8]),
  .S0(dff_q_1)
);
MUX2 mux_inst_26 (
  .O(douta[8]),
  .I0(mux_o_24),
  .I1(mux_o_25),
  .S0(dff_q_0)
);
MUX2 mux_inst_27 (
  .O(mux_o_27),
  .I0(dpx9b_inst_4_douta[9]),
  .I1(dpx9b_inst_5_douta[9]),
  .S0(dff_q_1)
);
MUX2 mux_inst_28 (
  .O(mux_o_28),
  .I0(dpx9b_inst_6_douta[9]),
  .I1(dpx9b_inst_7_douta[9]),
  .S0(dff_q_1)
);
MUX2 mux_inst_29 (
  .O(douta[9]),
  .I0(mux_o_27),
  .I1(mux_o_28),
  .S0(dff_q_0)
);
MUX2 mux_inst_30 (
  .O(mux_o_30),
  .I0(dpx9b_inst_4_douta[10]),
  .I1(dpx9b_inst_5_douta[10]),
  .S0(dff_q_1)
);
MUX2 mux_inst_31 (
  .O(mux_o_31),
  .I0(dpx9b_inst_6_douta[10]),
  .I1(dpx9b_inst_7_douta[10]),
  .S0(dff_q_1)
);
MUX2 mux_inst_32 (
  .O(douta[10]),
  .I0(mux_o_30),
  .I1(mux_o_31),
  .S0(dff_q_0)
);
MUX2 mux_inst_33 (
  .O(mux_o_33),
  .I0(dpx9b_inst_4_douta[11]),
  .I1(dpx9b_inst_5_douta[11]),
  .S0(dff_q_1)
);
MUX2 mux_inst_34 (
  .O(mux_o_34),
  .I0(dpx9b_inst_6_douta[11]),
  .I1(dpx9b_inst_7_douta[11]),
  .S0(dff_q_1)
);
MUX2 mux_inst_35 (
  .O(douta[11]),
  .I0(mux_o_33),
  .I1(mux_o_34),
  .S0(dff_q_0)
);
MUX2 mux_inst_36 (
  .O(mux_o_36),
  .I0(dpx9b_inst_4_douta[12]),
  .I1(dpx9b_inst_5_douta[12]),
  .S0(dff_q_1)
);
MUX2 mux_inst_37 (
  .O(mux_o_37),
  .I0(dpx9b_inst_6_douta[12]),
  .I1(dpx9b_inst_7_douta[12]),
  .S0(dff_q_1)
);
MUX2 mux_inst_38 (
  .O(douta[12]),
  .I0(mux_o_36),
  .I1(mux_o_37),
  .S0(dff_q_0)
);
MUX2 mux_inst_39 (
  .O(mux_o_39),
  .I0(dpx9b_inst_4_douta[13]),
  .I1(dpx9b_inst_5_douta[13]),
  .S0(dff_q_1)
);
MUX2 mux_inst_40 (
  .O(mux_o_40),
  .I0(dpx9b_inst_6_douta[13]),
  .I1(dpx9b_inst_7_douta[13]),
  .S0(dff_q_1)
);
MUX2 mux_inst_41 (
  .O(douta[13]),
  .I0(mux_o_39),
  .I1(mux_o_40),
  .S0(dff_q_0)
);
MUX2 mux_inst_42 (
  .O(mux_o_42),
  .I0(dpx9b_inst_4_douta[14]),
  .I1(dpx9b_inst_5_douta[14]),
  .S0(dff_q_1)
);
MUX2 mux_inst_43 (
  .O(mux_o_43),
  .I0(dpx9b_inst_6_douta[14]),
  .I1(dpx9b_inst_7_douta[14]),
  .S0(dff_q_1)
);
MUX2 mux_inst_44 (
  .O(douta[14]),
  .I0(mux_o_42),
  .I1(mux_o_43),
  .S0(dff_q_0)
);
MUX2 mux_inst_45 (
  .O(mux_o_45),
  .I0(dpx9b_inst_4_douta[15]),
  .I1(dpx9b_inst_5_douta[15]),
  .S0(dff_q_1)
);
MUX2 mux_inst_46 (
  .O(mux_o_46),
  .I0(dpx9b_inst_6_douta[15]),
  .I1(dpx9b_inst_7_douta[15]),
  .S0(dff_q_1)
);
MUX2 mux_inst_47 (
  .O(douta[15]),
  .I0(mux_o_45),
  .I1(mux_o_46),
  .S0(dff_q_0)
);
MUX2 mux_inst_48 (
  .O(mux_o_48),
  .I0(dpx9b_inst_4_douta[16]),
  .I1(dpx9b_inst_5_douta[16]),
  .S0(dff_q_1)
);
MUX2 mux_inst_49 (
  .O(mux_o_49),
  .I0(dpx9b_inst_6_douta[16]),
  .I1(dpx9b_inst_7_douta[16]),
  .S0(dff_q_1)
);
MUX2 mux_inst_50 (
  .O(douta[16]),
  .I0(mux_o_48),
  .I1(mux_o_49),
  .S0(dff_q_0)
);
MUX2 mux_inst_51 (
  .O(mux_o_51),
  .I0(dpx9b_inst_4_douta[17]),
  .I1(dpx9b_inst_5_douta[17]),
  .S0(dff_q_1)
);
MUX2 mux_inst_52 (
  .O(mux_o_52),
  .I0(dpx9b_inst_6_douta[17]),
  .I1(dpx9b_inst_7_douta[17]),
  .S0(dff_q_1)
);
MUX2 mux_inst_53 (
  .O(douta[17]),
  .I0(mux_o_51),
  .I1(mux_o_52),
  .S0(dff_q_0)
);
MUX2 mux_inst_54 (
  .O(mux_o_54),
  .I0(dpx9b_inst_0_doutb[0]),
  .I1(dpx9b_inst_1_doutb[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_55 (
  .O(mux_o_55),
  .I0(dpx9b_inst_2_doutb[0]),
  .I1(dpx9b_inst_3_doutb[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_56 (
  .O(doutb[0]),
  .I0(mux_o_54),
  .I1(mux_o_55),
  .S0(dff_q_2)
);
MUX2 mux_inst_57 (
  .O(mux_o_57),
  .I0(dpx9b_inst_0_doutb[1]),
  .I1(dpx9b_inst_1_doutb[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_58 (
  .O(mux_o_58),
  .I0(dpx9b_inst_2_doutb[1]),
  .I1(dpx9b_inst_3_doutb[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_59 (
  .O(doutb[1]),
  .I0(mux_o_57),
  .I1(mux_o_58),
  .S0(dff_q_2)
);
MUX2 mux_inst_60 (
  .O(mux_o_60),
  .I0(dpx9b_inst_0_doutb[2]),
  .I1(dpx9b_inst_1_doutb[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_61 (
  .O(mux_o_61),
  .I0(dpx9b_inst_2_doutb[2]),
  .I1(dpx9b_inst_3_doutb[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_62 (
  .O(doutb[2]),
  .I0(mux_o_60),
  .I1(mux_o_61),
  .S0(dff_q_2)
);
MUX2 mux_inst_63 (
  .O(mux_o_63),
  .I0(dpx9b_inst_0_doutb[3]),
  .I1(dpx9b_inst_1_doutb[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_64 (
  .O(mux_o_64),
  .I0(dpx9b_inst_2_doutb[3]),
  .I1(dpx9b_inst_3_doutb[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_65 (
  .O(doutb[3]),
  .I0(mux_o_63),
  .I1(mux_o_64),
  .S0(dff_q_2)
);
MUX2 mux_inst_66 (
  .O(mux_o_66),
  .I0(dpx9b_inst_0_doutb[4]),
  .I1(dpx9b_inst_1_doutb[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_67 (
  .O(mux_o_67),
  .I0(dpx9b_inst_2_doutb[4]),
  .I1(dpx9b_inst_3_doutb[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_68 (
  .O(doutb[4]),
  .I0(mux_o_66),
  .I1(mux_o_67),
  .S0(dff_q_2)
);
MUX2 mux_inst_69 (
  .O(mux_o_69),
  .I0(dpx9b_inst_0_doutb[5]),
  .I1(dpx9b_inst_1_doutb[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_70 (
  .O(mux_o_70),
  .I0(dpx9b_inst_2_doutb[5]),
  .I1(dpx9b_inst_3_doutb[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_71 (
  .O(doutb[5]),
  .I0(mux_o_69),
  .I1(mux_o_70),
  .S0(dff_q_2)
);
MUX2 mux_inst_72 (
  .O(mux_o_72),
  .I0(dpx9b_inst_0_doutb[6]),
  .I1(dpx9b_inst_1_doutb[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_73 (
  .O(mux_o_73),
  .I0(dpx9b_inst_2_doutb[6]),
  .I1(dpx9b_inst_3_doutb[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_74 (
  .O(doutb[6]),
  .I0(mux_o_72),
  .I1(mux_o_73),
  .S0(dff_q_2)
);
MUX2 mux_inst_75 (
  .O(mux_o_75),
  .I0(dpx9b_inst_0_doutb[7]),
  .I1(dpx9b_inst_1_doutb[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_76 (
  .O(mux_o_76),
  .I0(dpx9b_inst_2_doutb[7]),
  .I1(dpx9b_inst_3_doutb[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_77 (
  .O(doutb[7]),
  .I0(mux_o_75),
  .I1(mux_o_76),
  .S0(dff_q_2)
);
MUX2 mux_inst_78 (
  .O(mux_o_78),
  .I0(dpx9b_inst_0_doutb[8]),
  .I1(dpx9b_inst_1_doutb[8]),
  .S0(dff_q_3)
);
MUX2 mux_inst_79 (
  .O(mux_o_79),
  .I0(dpx9b_inst_2_doutb[8]),
  .I1(dpx9b_inst_3_doutb[8]),
  .S0(dff_q_3)
);
MUX2 mux_inst_80 (
  .O(doutb[8]),
  .I0(mux_o_78),
  .I1(mux_o_79),
  .S0(dff_q_2)
);
MUX2 mux_inst_81 (
  .O(mux_o_81),
  .I0(dpx9b_inst_4_doutb[9]),
  .I1(dpx9b_inst_5_doutb[9]),
  .S0(dff_q_3)
);
MUX2 mux_inst_82 (
  .O(mux_o_82),
  .I0(dpx9b_inst_6_doutb[9]),
  .I1(dpx9b_inst_7_doutb[9]),
  .S0(dff_q_3)
);
MUX2 mux_inst_83 (
  .O(doutb[9]),
  .I0(mux_o_81),
  .I1(mux_o_82),
  .S0(dff_q_2)
);
MUX2 mux_inst_84 (
  .O(mux_o_84),
  .I0(dpx9b_inst_4_doutb[10]),
  .I1(dpx9b_inst_5_doutb[10]),
  .S0(dff_q_3)
);
MUX2 mux_inst_85 (
  .O(mux_o_85),
  .I0(dpx9b_inst_6_doutb[10]),
  .I1(dpx9b_inst_7_doutb[10]),
  .S0(dff_q_3)
);
MUX2 mux_inst_86 (
  .O(doutb[10]),
  .I0(mux_o_84),
  .I1(mux_o_85),
  .S0(dff_q_2)
);
MUX2 mux_inst_87 (
  .O(mux_o_87),
  .I0(dpx9b_inst_4_doutb[11]),
  .I1(dpx9b_inst_5_doutb[11]),
  .S0(dff_q_3)
);
MUX2 mux_inst_88 (
  .O(mux_o_88),
  .I0(dpx9b_inst_6_doutb[11]),
  .I1(dpx9b_inst_7_doutb[11]),
  .S0(dff_q_3)
);
MUX2 mux_inst_89 (
  .O(doutb[11]),
  .I0(mux_o_87),
  .I1(mux_o_88),
  .S0(dff_q_2)
);
MUX2 mux_inst_90 (
  .O(mux_o_90),
  .I0(dpx9b_inst_4_doutb[12]),
  .I1(dpx9b_inst_5_doutb[12]),
  .S0(dff_q_3)
);
MUX2 mux_inst_91 (
  .O(mux_o_91),
  .I0(dpx9b_inst_6_doutb[12]),
  .I1(dpx9b_inst_7_doutb[12]),
  .S0(dff_q_3)
);
MUX2 mux_inst_92 (
  .O(doutb[12]),
  .I0(mux_o_90),
  .I1(mux_o_91),
  .S0(dff_q_2)
);
MUX2 mux_inst_93 (
  .O(mux_o_93),
  .I0(dpx9b_inst_4_doutb[13]),
  .I1(dpx9b_inst_5_doutb[13]),
  .S0(dff_q_3)
);
MUX2 mux_inst_94 (
  .O(mux_o_94),
  .I0(dpx9b_inst_6_doutb[13]),
  .I1(dpx9b_inst_7_doutb[13]),
  .S0(dff_q_3)
);
MUX2 mux_inst_95 (
  .O(doutb[13]),
  .I0(mux_o_93),
  .I1(mux_o_94),
  .S0(dff_q_2)
);
MUX2 mux_inst_96 (
  .O(mux_o_96),
  .I0(dpx9b_inst_4_doutb[14]),
  .I1(dpx9b_inst_5_doutb[14]),
  .S0(dff_q_3)
);
MUX2 mux_inst_97 (
  .O(mux_o_97),
  .I0(dpx9b_inst_6_doutb[14]),
  .I1(dpx9b_inst_7_doutb[14]),
  .S0(dff_q_3)
);
MUX2 mux_inst_98 (
  .O(doutb[14]),
  .I0(mux_o_96),
  .I1(mux_o_97),
  .S0(dff_q_2)
);
MUX2 mux_inst_99 (
  .O(mux_o_99),
  .I0(dpx9b_inst_4_doutb[15]),
  .I1(dpx9b_inst_5_doutb[15]),
  .S0(dff_q_3)
);
MUX2 mux_inst_100 (
  .O(mux_o_100),
  .I0(dpx9b_inst_6_doutb[15]),
  .I1(dpx9b_inst_7_doutb[15]),
  .S0(dff_q_3)
);
MUX2 mux_inst_101 (
  .O(doutb[15]),
  .I0(mux_o_99),
  .I1(mux_o_100),
  .S0(dff_q_2)
);
MUX2 mux_inst_102 (
  .O(mux_o_102),
  .I0(dpx9b_inst_4_doutb[16]),
  .I1(dpx9b_inst_5_doutb[16]),
  .S0(dff_q_3)
);
MUX2 mux_inst_103 (
  .O(mux_o_103),
  .I0(dpx9b_inst_6_doutb[16]),
  .I1(dpx9b_inst_7_doutb[16]),
  .S0(dff_q_3)
);
MUX2 mux_inst_104 (
  .O(doutb[16]),
  .I0(mux_o_102),
  .I1(mux_o_103),
  .S0(dff_q_2)
);
MUX2 mux_inst_105 (
  .O(mux_o_105),
  .I0(dpx9b_inst_4_doutb[17]),
  .I1(dpx9b_inst_5_doutb[17]),
  .S0(dff_q_3)
);
MUX2 mux_inst_106 (
  .O(mux_o_106),
  .I0(dpx9b_inst_6_doutb[17]),
  .I1(dpx9b_inst_7_doutb[17]),
  .S0(dff_q_3)
);
MUX2 mux_inst_107 (
  .O(doutb[17]),
  .I0(mux_o_105),
  .I1(mux_o_106),
  .S0(dff_q_2)
);
endmodule //CRAM
