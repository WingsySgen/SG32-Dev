/*
    同8bit版本相比，
    取消了PC中内置的硬件栈，
    剥离了PC对call、ret、int、iret的特殊响应，
    并将其合并到内存的行为中，
    使得栈空间增大，以支持更多的递归

PC pc
(
    .clk(),
    .rst_n(),
    .wt_en(),
    .data_in(),
    .rd_A_en(),
    .data_A_out(),
    .rd_B_en(),
    .data_B_out(),
    .data_out(),
    .int_in(),
    .stack_in(),
    .stack_in_en(),
    .data_nxt()
);
*/

module PC
(
    input   wire        clk,
    input   wire        rst_n,
    input   wire        boot,

    input   wire        wt_en,
    input   wire[31:0]  data_in,

    input   wire        rd_A_en,
    output  wire[31:0]  data_A_out,

    input   wire        rd_B_en,
    output  wire[31:0]  data_B_out,

    output  wire[31:0]  data_out,

    input   wire        int_in,
    input   wire        wt_type,    //1 = 作为增量处理 0 = 作为常量处理 
    /*
        立即数在这里被认为是个12位的有符号数，而除了立即数外，PC还应当支持从寄存器获取32位的值
        但是PC本身无法判断从data_in输入的位宽
        这里引入wt_type来告知PC应当以何种方式处理输入，同时每种条件指令都应当有其增量版本和常量版本
        该信号应当由COND发出
    */
    input   wire[31:0]  stack_in,   //栈顶输入
    input   wire        ret_en,     //ret使能
    input   wire        cal_en,     //call使能
    output  wire[31:0]  data_nxt
);

    reg[31:0]   data;
    wire[31:0]  inc;
    
    initial begin
        data <= 32'd0;
    end

    assign data_A_out = rd_A_en ? data : 32'bz;
    assign data_B_out = rd_B_en ? data : 32'bz;
    assign data_out = data;

//    assign inc = (data_in[7] ? {{24{1'b1}}, data_in[7:0]} : data_in); 
    
    assign inc = data_in[11] ? {{20{1'b1}}, data_in[11:0]} : data_in;
    assign data_nxt = (wt_en && !cal_en) ? (wt_type ? data + inc : data_in) : data + 1'b1;

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            if (boot) data <= 32'd3;
            else data <= 32'd0;
        end
        else begin
            if (int_in) data <= 32'd2;
            else if (cal_en) data <= (wt_type ? data + inc : data_in);
            else if (ret_en) data <= stack_in;
            else data <= data_nxt;
        end
    end

endmodule