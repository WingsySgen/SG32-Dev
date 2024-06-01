module INTC
(
    input   wire            clk,
    input   wire            rst_n,

//    input   wire            wt_en,
//    input   wire[31:0]      data_in,
    
    input   wire            rd_A_en,
    output  wire[31:0]      data_A_out,

    input   wire            rd_B_en,
    output  wire[31:0]      data_B_out,

    output  wire[31:0]      data_out,

    input   wire[62:0]      set_in,     //int_in    set
    input   wire[62:0]      en_in,      //int_en    中断使能输入
    input   wire            reset_in,
    output  wire            int_out,

    output  wire[30:0]      intc_int_en
);

    wire[63:0]  res_with_set, res_with_set_t, res, res_t;
    wire[63:0]  sr_o;
    wire[63:0]  reset_en;
    wire[5:0]   data_in;

    assign intc_int_en = ~(res_with_set[62:32] | sr_o[62:32]);//让res_with_set带有本位信息 

    reg[5:0]    data;
    initial begin
        data <= 6'b111111;
    end

    assign data_A_out = rd_A_en ? data_out : 32'bz;
    assign data_B_out = rd_B_en ? data_out : 32'bz;

    assign data_out = {26'd0, data};
    // assign int_out = (data_in < data) & data_in[5];  //该端口已经作废
    assign int_out = 1'b0;

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) data <= 6'b111111;
        else begin
            data <= data_in;
        end
    end

    assign sr_o[63] = 1'b1;

    assign res_with_set_t[0] = set_in[0] | sr_o[0];
    assign res_with_set_t[1] = set_in[1] | sr_o[1] | res_with_set_t[0];
    assign res_with_set_t[2] = set_in[2] | sr_o[2];
    assign res_with_set_t[3] = set_in[3] | sr_o[3] | res_with_set_t[1] | res_with_set_t[2];
    assign res_with_set_t[4] = set_in[4] | sr_o[4];
    assign res_with_set_t[5] = set_in[5] | sr_o[5] | res_with_set_t[4];
    assign res_with_set_t[6] = set_in[6] | sr_o[6];
    assign res_with_set_t[7] = set_in[7] | sr_o[7] | res_with_set_t[3] | res_with_set_t[5] | res_with_set_t[6];
    assign res_with_set_t[8] = set_in[8] | sr_o[8];
    assign res_with_set_t[9] = set_in[9] | sr_o[9] | res_with_set_t[8];
    assign res_with_set_t[10] = set_in[10] | sr_o[10];
    assign res_with_set_t[11] = set_in[11] | sr_o[11] | res_with_set_t[9] | res_with_set_t[10];
    assign res_with_set_t[12] = set_in[12] | sr_o[12];
    assign res_with_set_t[13] = set_in[13] | sr_o[13] | res_with_set_t[12];
    assign res_with_set_t[14] = set_in[14] | sr_o[14];
    assign res_with_set_t[15] = set_in[15] | sr_o[15] | res_with_set_t[7] | res_with_set_t[11] | res_with_set_t[13] | res_with_set_t[14];
    assign res_with_set_t[16] = set_in[16] | sr_o[16];
    assign res_with_set_t[17] = set_in[17] | sr_o[17] | res_with_set_t[16];
    assign res_with_set_t[18] = set_in[18] | sr_o[18];
    assign res_with_set_t[19] = set_in[19] | sr_o[19] | res_with_set_t[17] | res_with_set_t[18];
    assign res_with_set_t[20] = set_in[20] | sr_o[20];
    assign res_with_set_t[21] = set_in[21] | sr_o[21] | res_with_set_t[20];
    assign res_with_set_t[22] = set_in[22] | sr_o[22];
    assign res_with_set_t[23] = set_in[23] | sr_o[23] | res_with_set_t[19] | res_with_set_t[21] | res_with_set_t[22];
    assign res_with_set_t[24] = set_in[24] | sr_o[24];
    assign res_with_set_t[25] = set_in[25] | sr_o[25] | res_with_set_t[24];
    assign res_with_set_t[26] = set_in[26] | sr_o[26];
    assign res_with_set_t[27] = set_in[27] | sr_o[27] | res_with_set_t[25] | res_with_set_t[26];
    assign res_with_set_t[28] = set_in[28] | sr_o[28];
    assign res_with_set_t[29] = set_in[29] | sr_o[29] | res_with_set_t[28];
    assign res_with_set_t[30] = set_in[30] | sr_o[30];
    assign res_with_set_t[31] = set_in[31] | sr_o[31] | res_with_set_t[15] | res_with_set_t[23] | res_with_set_t[27] | res_with_set_t[29] | res_with_set_t[30];
    assign res_with_set_t[32] = set_in[32] | sr_o[32];
    assign res_with_set_t[33] = set_in[33] | sr_o[33] | res_with_set_t[32];
    assign res_with_set_t[34] = set_in[34] | sr_o[34];
    assign res_with_set_t[35] = set_in[35] | sr_o[35] | res_with_set_t[33] | res_with_set_t[34];
    assign res_with_set_t[36] = set_in[36] | sr_o[36];
    assign res_with_set_t[37] = set_in[37] | sr_o[37] | res_with_set_t[36];
    assign res_with_set_t[38] = set_in[38] | sr_o[38];
    assign res_with_set_t[39] = set_in[39] | sr_o[39] | res_with_set_t[35] | res_with_set_t[37] | res_with_set_t[38];
    assign res_with_set_t[40] = set_in[40] | sr_o[40];
    assign res_with_set_t[41] = set_in[41] | sr_o[41] | res_with_set_t[40];
    assign res_with_set_t[42] = set_in[42] | sr_o[42];
    assign res_with_set_t[43] = set_in[43] | sr_o[43] | res_with_set_t[41] | res_with_set_t[42];
    assign res_with_set_t[44] = set_in[44] | sr_o[44];
    assign res_with_set_t[45] = set_in[45] | sr_o[45] | res_with_set_t[44];
    assign res_with_set_t[46] = set_in[46] | sr_o[46];
    assign res_with_set_t[47] = set_in[47] | sr_o[47] | res_with_set_t[39] | res_with_set_t[43] | res_with_set_t[45] | res_with_set_t[46];
    assign res_with_set_t[48] = set_in[48] | sr_o[48];
    assign res_with_set_t[49] = set_in[49] | sr_o[49] | res_with_set_t[48];
    assign res_with_set_t[50] = set_in[50] | sr_o[50];
    assign res_with_set_t[51] = set_in[51] | sr_o[51] | res_with_set_t[49] | res_with_set_t[50];
    assign res_with_set_t[52] = set_in[52] | sr_o[52];
    assign res_with_set_t[53] = set_in[53] | sr_o[53] | res_with_set_t[52];
    assign res_with_set_t[54] = set_in[54] | sr_o[54];
    assign res_with_set_t[55] = set_in[55] | sr_o[55] | res_with_set_t[51] | res_with_set_t[53] | res_with_set_t[54];
    assign res_with_set_t[56] = set_in[56] | sr_o[56];
    assign res_with_set_t[57] = set_in[57] | sr_o[57] | res_with_set_t[56];
    assign res_with_set_t[58] = set_in[58] | sr_o[58];
    assign res_with_set_t[59] = set_in[59] | sr_o[59] | res_with_set_t[57] | res_with_set_t[58];
    assign res_with_set_t[60] = set_in[60] | sr_o[60];
    assign res_with_set_t[61] = set_in[61] | sr_o[61] | res_with_set_t[60];
    assign res_with_set_t[62] = set_in[62] | sr_o[62];
    assign res_with_set_t[63] = 1'b1;

    assign res_with_set[0] = 1'b0;
    assign res_with_set[1] = res_with_set_t[0];
    assign res_with_set[2] = res_with_set_t[1];
    assign res_with_set[3] = res_with_set_t[2] | res_with_set_t[1];
    assign res_with_set[4] = res_with_set_t[3];
    assign res_with_set[5] = res_with_set_t[4] | res_with_set_t[3];
    assign res_with_set[6] = res_with_set_t[5] | res_with_set_t[3];
    assign res_with_set[7] = res_with_set_t[6] | res_with_set_t[5] | res_with_set_t[3];
    assign res_with_set[8] = res_with_set_t[7];
    assign res_with_set[9] = res_with_set_t[8] | res_with_set_t[7];
    assign res_with_set[10] = res_with_set_t[9] | res_with_set_t[7];
    assign res_with_set[11] = res_with_set_t[10] | res_with_set_t[9] | res_with_set_t[7];
    assign res_with_set[12] = res_with_set_t[11] | res_with_set_t[7];
    assign res_with_set[13] = res_with_set_t[12] | res_with_set_t[11] | res_with_set_t[7];
    assign res_with_set[14] = res_with_set_t[13] | res_with_set_t[11] | res_with_set_t[7];
    assign res_with_set[15] = res_with_set_t[14] | res_with_set_t[13] | res_with_set_t[11] | res_with_set_t[7];
    assign res_with_set[16] = res_with_set_t[15];
    assign res_with_set[17] = res_with_set_t[16] | res_with_set_t[15];
    assign res_with_set[18] = res_with_set_t[17] | res_with_set_t[15];
    assign res_with_set[19] = res_with_set_t[18] | res_with_set_t[17] | res_with_set_t[15];
    assign res_with_set[20] = res_with_set_t[19] | res_with_set_t[15];
    assign res_with_set[21] = res_with_set_t[20] | res_with_set_t[19] | res_with_set_t[15];
    assign res_with_set[22] = res_with_set_t[21] | res_with_set_t[19] | res_with_set_t[15];
    assign res_with_set[23] = res_with_set_t[22] | res_with_set_t[21] | res_with_set_t[19] | res_with_set_t[15];
    assign res_with_set[24] = res_with_set_t[23] | res_with_set_t[15];
    assign res_with_set[25] = res_with_set_t[24] | res_with_set_t[23] | res_with_set_t[15];
    assign res_with_set[26] = res_with_set_t[25] | res_with_set_t[23] | res_with_set_t[15];
    assign res_with_set[27] = res_with_set_t[26] | res_with_set_t[25] | res_with_set_t[23] | res_with_set_t[15];
    assign res_with_set[28] = res_with_set_t[27] | res_with_set_t[23] | res_with_set_t[15];
    assign res_with_set[29] = res_with_set_t[28] | res_with_set_t[27] | res_with_set_t[23] | res_with_set_t[15];
    assign res_with_set[30] = res_with_set_t[29] | res_with_set_t[27] | res_with_set_t[23] | res_with_set_t[15];
    assign res_with_set[31] = res_with_set_t[30] | res_with_set_t[29] | res_with_set_t[27] | res_with_set_t[23] | res_with_set_t[15];
    assign res_with_set[32] = res_with_set_t[31];
    assign res_with_set[33] = res_with_set_t[32] | res_with_set_t[31];
    assign res_with_set[34] = res_with_set_t[33] | res_with_set_t[31];
    assign res_with_set[35] = res_with_set_t[34] | res_with_set_t[33] | res_with_set_t[31];
    assign res_with_set[36] = res_with_set_t[35] | res_with_set_t[31];
    assign res_with_set[37] = res_with_set_t[36] | res_with_set_t[35] | res_with_set_t[31];
    assign res_with_set[38] = res_with_set_t[37] | res_with_set_t[35] | res_with_set_t[31];
    assign res_with_set[39] = res_with_set_t[38] | res_with_set_t[37] | res_with_set_t[35] | res_with_set_t[31];
    assign res_with_set[40] = res_with_set_t[39] | res_with_set_t[31];
    assign res_with_set[41] = res_with_set_t[40] | res_with_set_t[39] | res_with_set_t[31];
    assign res_with_set[42] = res_with_set_t[41] | res_with_set_t[39] | res_with_set_t[31];
    assign res_with_set[43] = res_with_set_t[42] | res_with_set_t[41] | res_with_set_t[39] | res_with_set_t[31];
    assign res_with_set[44] = res_with_set_t[43] | res_with_set_t[39] | res_with_set_t[31];
    assign res_with_set[45] = res_with_set_t[44] | res_with_set_t[43] | res_with_set_t[39] | res_with_set_t[31];
    assign res_with_set[46] = res_with_set_t[45] | res_with_set_t[43] | res_with_set_t[39] | res_with_set_t[31];
    assign res_with_set[47] = res_with_set_t[46] | res_with_set_t[45] | res_with_set_t[43] | res_with_set_t[39] | res_with_set_t[31];
    assign res_with_set[48] = res_with_set_t[47] | res_with_set_t[31];
    assign res_with_set[49] = res_with_set_t[48] | res_with_set_t[47] | res_with_set_t[31];
    assign res_with_set[50] = res_with_set_t[49] | res_with_set_t[47] | res_with_set_t[31];
    assign res_with_set[51] = res_with_set_t[50] | res_with_set_t[49] | res_with_set_t[47] | res_with_set_t[31];
    assign res_with_set[52] = res_with_set_t[51] | res_with_set_t[47] | res_with_set_t[31];
    assign res_with_set[53] = res_with_set_t[52] | res_with_set_t[51] | res_with_set_t[47] | res_with_set_t[31];
    assign res_with_set[54] = res_with_set_t[53] | res_with_set_t[51] | res_with_set_t[47] | res_with_set_t[31];
    assign res_with_set[55] = res_with_set_t[54] | res_with_set_t[53] | res_with_set_t[51] | res_with_set_t[47] | res_with_set_t[31];
    assign res_with_set[56] = res_with_set_t[55] | res_with_set_t[47] | res_with_set_t[31];
    assign res_with_set[57] = res_with_set_t[56] | res_with_set_t[55] | res_with_set_t[47] | res_with_set_t[31];
    assign res_with_set[58] = res_with_set_t[57] | res_with_set_t[55] | res_with_set_t[47] | res_with_set_t[31];
    assign res_with_set[59] = res_with_set_t[58] | res_with_set_t[57] | res_with_set_t[55] | res_with_set_t[47] | res_with_set_t[31];
    assign res_with_set[60] = res_with_set_t[59] | res_with_set_t[55] | res_with_set_t[47] | res_with_set_t[31];
    assign res_with_set[61] = res_with_set_t[60] | res_with_set_t[59] | res_with_set_t[55] | res_with_set_t[47] | res_with_set_t[31];
    assign res_with_set[62] = res_with_set_t[61] | res_with_set_t[59] | res_with_set_t[55] | res_with_set_t[47] | res_with_set_t[31];
    assign res_with_set[63] = res_with_set_t[62] | res_with_set_t[61] | res_with_set_t[59] | res_with_set_t[55] | res_with_set_t[47] | res_with_set_t[31];

    assign res_t[0] = sr_o[0];
    assign res_t[1] = sr_o[1] | res_t[0];
    assign res_t[2] = sr_o[2];
    assign res_t[3] = sr_o[3] | res_t[1] | res_t[2];
    assign res_t[4] = sr_o[4];
    assign res_t[5] = sr_o[5] | res_t[4];
    assign res_t[6] = sr_o[6];
    assign res_t[7] = sr_o[7] | res_t[3] | res_t[5] | res_t[6];
    assign res_t[8] = sr_o[8];
    assign res_t[9] = sr_o[9] | res_t[8];
    assign res_t[10] = sr_o[10];
    assign res_t[11] = sr_o[11] | res_t[9] | res_t[10];
    assign res_t[12] = sr_o[12];
    assign res_t[13] = sr_o[13] | res_t[12];
    assign res_t[14] = sr_o[14];
    assign res_t[15] = sr_o[15] | res_t[7] | res_t[11] | res_t[13] | res_t[14];
    assign res_t[16] = sr_o[16];
    assign res_t[17] = sr_o[17] | res_t[16];
    assign res_t[18] = sr_o[18];
    assign res_t[19] = sr_o[19] | res_t[17] | res_t[18];
    assign res_t[20] = sr_o[20];
    assign res_t[21] = sr_o[21] | res_t[20];
    assign res_t[22] = sr_o[22];
    assign res_t[23] = sr_o[23] | res_t[19] | res_t[21] | res_t[22];
    assign res_t[24] = sr_o[24];
    assign res_t[25] = sr_o[25] | res_t[24];
    assign res_t[26] = sr_o[26];
    assign res_t[27] = sr_o[27] | res_t[25] | res_t[26];
    assign res_t[28] = sr_o[28];
    assign res_t[29] = sr_o[29] | res_t[28];
    assign res_t[30] = sr_o[30];
    assign res_t[31] = sr_o[31] | res_t[15] | res_t[23] | res_t[27] | res_t[29] | res_t[30];
    assign res_t[32] = sr_o[32];
    assign res_t[33] = sr_o[33] | res_t[32];
    assign res_t[34] = sr_o[34];
    assign res_t[35] = sr_o[35] | res_t[33] | res_t[34];
    assign res_t[36] = sr_o[36];
    assign res_t[37] = sr_o[37] | res_t[36];
    assign res_t[38] = sr_o[38];
    assign res_t[39] = sr_o[39] | res_t[35] | res_t[37] | res_t[38];
    assign res_t[40] = sr_o[40];
    assign res_t[41] = sr_o[41] | res_t[40];
    assign res_t[42] = sr_o[42];
    assign res_t[43] = sr_o[43] | res_t[41] | res_t[42];
    assign res_t[44] = sr_o[44];
    assign res_t[45] = sr_o[45] | res_t[44];
    assign res_t[46] = sr_o[46];
    assign res_t[47] = sr_o[47] | res_t[39] | res_t[43] | res_t[45] | res_t[46];
    assign res_t[48] = sr_o[48];
    assign res_t[49] = sr_o[49] | res_t[48];
    assign res_t[50] = sr_o[50];
    assign res_t[51] = sr_o[51] | res_t[49] | res_t[50];
    assign res_t[52] = sr_o[52];
    assign res_t[53] = sr_o[53] | res_t[52];
    assign res_t[54] = sr_o[54];
    assign res_t[55] = sr_o[55] | res_t[51] | res_t[53] | res_t[54];
    assign res_t[56] = sr_o[56];
    assign res_t[57] = sr_o[57] | res_t[56];
    assign res_t[58] = sr_o[58];
    assign res_t[59] = sr_o[59] | res_t[57] | res_t[58];
    assign res_t[60] = sr_o[60];
    assign res_t[61] = sr_o[61] | res_t[60];
    assign res_t[62] = sr_o[62];
    assign res_t[63] = 1'b1;

    assign res[0] = 1'b0;
    assign res[1] = res_t[0];
    assign res[2] = res_t[1];
    assign res[3] = res_t[2] | res_t[1];
    assign res[4] = res_t[3];
    assign res[5] = res_t[4] | res_t[3];
    assign res[6] = res_t[5] | res_t[3];
    assign res[7] = res_t[6] | res_t[5] | res_t[3];
    assign res[8] = res_t[7];
    assign res[9] = res_t[8] | res_t[7];
    assign res[10] = res_t[9] | res_t[7];
    assign res[11] = res_t[10] | res_t[9] | res_t[7];
    assign res[12] = res_t[11] | res_t[7];
    assign res[13] = res_t[12] | res_t[11] | res_t[7];
    assign res[14] = res_t[13] | res_t[11] | res_t[7];
    assign res[15] = res_t[14] | res_t[13] | res_t[11] | res_t[7];
    assign res[16] = res_t[15];
    assign res[17] = res_t[16] | res_t[15];
    assign res[18] = res_t[17] | res_t[15];
    assign res[19] = res_t[18] | res_t[17] | res_t[15];
    assign res[20] = res_t[19] | res_t[15];
    assign res[21] = res_t[20] | res_t[19] | res_t[15];
    assign res[22] = res_t[21] | res_t[19] | res_t[15];
    assign res[23] = res_t[22] | res_t[21] | res_t[19] | res_t[15];
    assign res[24] = res_t[23] | res_t[15];
    assign res[25] = res_t[24] | res_t[23] | res_t[15];
    assign res[26] = res_t[25] | res_t[23] | res_t[15];
    assign res[27] = res_t[26] | res_t[25] | res_t[23] | res_t[15];
    assign res[28] = res_t[27] | res_t[23] | res_t[15];
    assign res[29] = res_t[28] | res_t[27] | res_t[23] | res_t[15];
    assign res[30] = res_t[29] | res_t[27] | res_t[23] | res_t[15];
    assign res[31] = res_t[30] | res_t[29] | res_t[27] | res_t[23] | res_t[15];
    assign res[32] = res_t[31];
    assign res[33] = res_t[32] | res_t[31];
    assign res[34] = res_t[33] | res_t[31];
    assign res[35] = res_t[34] | res_t[33] | res_t[31];
    assign res[36] = res_t[35] | res_t[31];
    assign res[37] = res_t[36] | res_t[35] | res_t[31];
    assign res[38] = res_t[37] | res_t[35] | res_t[31];
    assign res[39] = res_t[38] | res_t[37] | res_t[35] | res_t[31];
    assign res[40] = res_t[39] | res_t[31];
    assign res[41] = res_t[40] | res_t[39] | res_t[31];
    assign res[42] = res_t[41] | res_t[39] | res_t[31];
    assign res[43] = res_t[42] | res_t[41] | res_t[39] | res_t[31];
    assign res[44] = res_t[43] | res_t[39] | res_t[31];
    assign res[45] = res_t[44] | res_t[43] | res_t[39] | res_t[31];
    assign res[46] = res_t[45] | res_t[43] | res_t[39] | res_t[31];
    assign res[47] = res_t[46] | res_t[45] | res_t[43] | res_t[39] | res_t[31];
    assign res[48] = res_t[47] | res_t[31];
    assign res[49] = res_t[48] | res_t[47] | res_t[31];
    assign res[50] = res_t[49] | res_t[47] | res_t[31];
    assign res[51] = res_t[50] | res_t[49] | res_t[47] | res_t[31];
    assign res[52] = res_t[51] | res_t[47] | res_t[31];
    assign res[53] = res_t[52] | res_t[51] | res_t[47] | res_t[31];
    assign res[54] = res_t[53] | res_t[51] | res_t[47] | res_t[31];
    assign res[55] = res_t[54] | res_t[53] | res_t[51] | res_t[47] | res_t[31];
    assign res[56] = res_t[55] | res_t[47] | res_t[31];
    assign res[57] = res_t[56] | res_t[55] | res_t[47] | res_t[31];
    assign res[58] = res_t[57] | res_t[55] | res_t[47] | res_t[31];
    assign res[59] = res_t[58] | res_t[57] | res_t[55] | res_t[47] | res_t[31];
    assign res[60] = res_t[59] | res_t[55] | res_t[47] | res_t[31];
    assign res[61] = res_t[60] | res_t[59] | res_t[55] | res_t[47] | res_t[31];
    assign res[62] = res_t[61] | res_t[59] | res_t[55] | res_t[47] | res_t[31];
    assign res[63] = res_t[62] | res_t[61] | res_t[59] | res_t[55] | res_t[47] | res_t[31];

    genvar i;
    generate
        for (i = 0 ; i < 63; i = i + 1) begin : sr_gen
            SR sr_i(
                .clk(clk),
                .rst_n(rst_n),
                .set_in(set_in[i]),
                .en(en_in[i] & !res_with_set[i]),
                .reset_in(reset_in & reset_en[i]),
                .data(sr_o[i])
            );
        end
    endgenerate

    generate
        for (i = 0; i < 63; i = i + 1) begin : dec_gen
            INTController_Decoder_Unit
            #(
                .coef(i)
            )
            dec (
                .en_in(sr_o[i]),
                .prefix_or_in(res[i]),
                .reset_out(reset_en[i]),
                .data_out(data_in)
            );
        end
    endgenerate

    INTController_Decoder_Unit
    #(
        .coef(63)
    )
    dec63 (
        .en_in(1'b1),
        .prefix_or_in(res[63]),
        .reset_out(reset_en[63]),
        .data_out(data_in)
    );

endmodule

module INTController_Decoder_Unit
#(
    parameter coef = 0
)
(
    input   wire        en_in,
    input   wire        prefix_or_in,
    output  wire        reset_out,
    output  wire[5:0]   data_out
);
    assign data_out = (prefix_or_in ? 6'dz : (en_in ? coef[5:0] : 6'dz));
    assign reset_out = (prefix_or_in ? 1'b0 : (en_in ? 1'b1 : 1'b0));
endmodule

module SR //sr触发器
(
    input   wire    clk,
    input   wire    rst_n,
    input   wire    set_in,
    input   wire    en,
    input   wire    reset_in,
    output  reg     data
);

    initial data <= 1'd0;

//    always @(posedge clk, negedge rst_n) begin
//        if (!rst_n) data <= 1'b0;
//        else if (en) begin
//            case ({set_in, res_with_setet_in})
//                2'b00 : data <= data;
//                2'b01 : data <= 1'b0;
//                2'b10 : data <= 1'b1;
//                2'b11 : data <= 1'b0;
//                default : data <= data;
//            endcase
//        end
//        else begin
//            data <= data;
//        end
//    end

    //如果在中断内通过使能寄存器组拉低使能，那么在没有en的时候上面的代码不能iret
    //iret不该被en限制
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) data <= 1'b0;
        else if (reset_in) data <= 1'b0;
        else if (en && set_in) data <= 1'b1;
        else data <= data;
    end
endmodule