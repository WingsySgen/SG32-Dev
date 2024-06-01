/*
2023.09.05 16:43
新建文件夹

2023.10.04 
#0 - #25    GPRs
#26         WIMM    gpr封装
#27         INTC
#28         IOAD    gpr封装
#29         IOC
#30         TIMER
#31         PC

#io0        int_en_regs         中断使能寄存器组
#io1        base_addr_regs      地址寄存器组
#io2        boot_mode           选择写入的RAM
#io3        simple_hard_timer   简单硬定时器
#io4        multi_hard_timer    多任务硬定时器

#io5        inc_dec_regs        自增自减寄存器组

#io8        uart0
#io9        uart1
#io10       spi

RAM                 13位地址   8192
RAM_prog            13位地址   8192
*/


/*
CORE
#(
    .FREQ(),
    .IONUM()
)
(
    .clk(),
    .rst_n(),
    .io_wt_en(),
    .io_cs_en(),
    .io_data()
);
*/

module CORE
#(
    parameter FREQ = 27000000,
    parameter IONUM = 32
)
(
    input   wire        clk,
    input   wire        rst_n,

    //BOOT
    input   wire        bootSerial,
    output  wire        boot_mode,
    //

    //WATCH
    output  wire[31:0]  watch,
    //

    //IO
    output  wire        io_wt_en,
    output  wire        io_rd_en,
    output  wire[IONUM - 1:0]   io_cs_en,
    inout   wire[31:0]  io_data,
    output  wire[3:0]   io_reg_addr,
    output  wire        ioad_wt_en,
    //

    //内部UART
    input   wire        RX0,
    output  wire        TX0,
    //
    
    //外部中断
    input   wire[14:0]  ext_int
    //
);

    //总线部分
    wire[31:0]  bus_A;
    wire[31:0]  bus_B;
    wire[31:0]  bus_C;
    wire[31:0]  en_A;
    wire[31:0]  en_B;
    wire[31:0]  en_C;
    //

    wire        alu_en;         //ALU使能
    wire        cond_en;        //COND使能
    wire        ram_en;         //RAM使能
    wire        through_C_en;   //COND输出的直通总线#C的使能
//    wire        ext_en;         //扩展指令使能

    wire[31:0]  rom_o;          //程序RAM输出
//    wire        stack_en;       //栈输入使能 //用stack_inc_en替代，两者逻辑相同
    wire[5:0]   opcode;         //ID输出的 真操作码
    wire[1:0]   opcode_imm;     //ID输出的 立即数种类
    wire        cond_o;         //条件输出
    wire[31:0]  gpr_o[31:0];    //32个寄存器的常输出
    wire[31:0]  pc_nxt_o;       //PC输出的 下一条指令的地址    用来向栈输入
    wire[31:0]  ram_o;          //RAM输出
    wire[31:0]  stack_o;        //栈输出
    wire        wt_type;        //PC处理输入的方式
    wire[31:0]  ram_o_prog;     //程序RAM的输出
    wire[31:0]  ram_o_data;     //数据RAM的输出
    wire[31:0]  ram_o;          //经过boot mode选择的映射输出

    //基址寄存器部分
    wire[31:0]  base_prog_addr;
    wire[31:0]  base_ram_addr;
    wire[31:0]  stack_addr;
    wire stack_dec_en;
    wire stack_inc_en;
    wire cal_en;
    wire ret_en;
    //

    //中断部分
    wire[62:0]  int_en;                 //IO挂载的中断使能寄存器组
    wire        alu_int;                //alu发出的中断信号，0号中断
//    wire        intc_int_out;           //intc对pc的通知，已经作废
    wire        int_instruction;        //当前是否有有效的中断信号，对pc、stack的中断通知
    wire        cond_int_set_out;       //cond在int指令时拉高
    wire        cond_int_reset_out;     //cond在iret指令时拉高
    wire[30:0]  intc_int_en;            //intc输出的对外部中断的使能线，
    wire[31:0]  sint;                   //cond输出的软中断线
    wire[30:0]  ext_int_out;            //硬中断通过时钟整形之后的信号

    wire        ext_int_temp;           //当前是否有有效的外部中断信号
    //

    assign  watch = 32'd0;

    assign  ioad_wt_en = en_C[28];

    HINT hint(
        .clk(clk),
        .rst_n(rst_n),
        .ext_int_in({ext_int, 14'b0, uart_int, mht_int}),
        .ext_int_out(ext_int_out),

        .hint_en(int_en[62:32]),
        .intc_int_en(intc_int_en),
        .cond_int_set_out(cond_int_set_out),
        .ext_int_temp(ext_int_temp),
        .int_instruction(int_instruction)
    );

    ID id(
        .opcode_in(rom_o),

        .alu_en(alu_en),
        .cond_en(cond_en),
        .ram_en(ram_en),

        .opcode_out(opcode),

        .imm(opcode_imm),

        .data_A_out(bus_A),
        .data_B_out(bus_B),
        .data_C_out(bus_C),

        .gprs_wt_en(en_C),
        .gprs_rd_A_en(en_A),
        .gprs_rd_B_en(en_B)
    );

    __ALU __alu(
        .en(alu_en),
        .clk(clk),
        .rst_n(rst_n),
        .opcode_in(opcode),
        .data_A_in(bus_A),
        .data_B_in(bus_B),
        .data_out(bus_C),
        .int_out(alu_int)
    );

    COND cond(
        .en(cond_en),
        .clk(clk),
        .rst_n(rst_n),
        .opcode_in(opcode),
        .data_A_in(bus_A),
        .data_B_in(bus_B),
        .data_out(cond_o),
        .wt_type(wt_type),
        .ret_en(ret_en),
        .cal_en(cal_en),
        .int_type_out(sint),
        .int_reset(cond_int_reset_out),
        .int_set(cond_int_set_out),
        .opcode_imm(opcode_imm),
        .through_C_en(through_C_en)
    );

    GPR0 gpr0(
        .clk(clk),
        .rst_n(rst_n),
        .wt_en(en_C[0]),
        .data_in(bus_C),
        .rd_A_en(en_A[0]),
        .data_A_out(bus_A),
        .rd_B_en(en_B[0]),
        .data_B_out(bus_B),
        .through_C_en(1'b0),
        .data_C_out(),
        .data_out(gpr_o[0])
    );

    genvar gpr_gen_i;
    generate
        for (gpr_gen_i = 1; gpr_gen_i <= 25; gpr_gen_i = gpr_gen_i + 1) begin : gpr_gen
            GPR gpr_i(
                .clk(clk),
                .rst_n(rst_n),
                .wt_en(en_C[gpr_gen_i]),
                .data_in(bus_C),
                .rd_A_en(en_A[gpr_gen_i]),
                .data_A_out(bus_A),
                .rd_B_en(en_B[gpr_gen_i]),
                .data_B_out(bus_B),
                .through_C_en(1'b0),
                .data_C_out(),
                .data_out(gpr_o[gpr_gen_i])
            );
        end
    endgenerate

    GPR wimm(
        .clk(clk),
        .rst_n(rst_n),
        .wt_en(en_C[26]),
        .data_in(bus_C),
        .rd_A_en(en_A[26]),
        .data_A_out(bus_A),
        .rd_B_en(en_B[26]),
        .data_B_out(bus_B),
        .through_C_en(through_C_en),
        .data_C_out(bus_C),
        .data_out(gpr_o[26])
    );

    INTC intc(
        .clk(clk),
        .rst_n(rst_n),
        .rd_A_en(en_A[27]),
        .data_A_out(bus_A),
        .rd_B_en(en_B[27]),
        .data_B_out(bus_B),
        .data_out(gpr_o[27]),
        .set_in({ext_int_out, 32'd0} | {31'd0, sint}),
        .en_in(int_en),
        .reset_in(cond_int_reset_out),
        .int_out(),
        .intc_int_en(intc_int_en)
    );

    GPR ioad(
        .clk(clk),
        .rst_n(rst_n),
        .wt_en(en_C[28]),
        .data_in(bus_C),
        .rd_A_en(en_A[28]),
        .data_A_out(bus_A),
        .rd_B_en(en_B[28]),
        .data_B_out(bus_B),
        .through_C_en(1'b0),
        .data_C_out(),
        .data_out(gpr_o[28])
    );

    IOController
    #(
        .IONUM(IONUM)
    )
    ioc(
        .wt_en(en_C[29]),
        .data_in(bus_C),
        .rd_A_en(en_A[29]),
        .data_A_out(bus_A),
        .rd_B_en(en_B[29]),
        .data_B_out(bus_B),
        .data_out(gpr_o[29]),
        .addr_in(gpr_o[28]),
        .wt_io(io_wt_en),
        .rd_io(io_rd_en),
        .cs_io(io_cs_en),
        .data(io_data),
        .register_addr_out(io_reg_addr)
    );

    TIMER
    #(
        .FREQ(FREQ)
    )
    timer(
        .clk(clk),
        .rst_n(rst_n),
        .rd_A_en(en_A[30]),
        .data_A_out(bus_A),
        .rd_B_en(en_B[30]),
        .data_B_out(bus_B),
        .data_out(gpr_o[30])
    );

    PC pc(
        .clk(~clk),
        .rst_n(rst_n),
        .boot(bootSerial),
        .wt_en(en_C[31] | cond_o),
        .data_in(bus_C),
        .rd_A_en(en_A[31]),
        .data_A_out(bus_A),
        .rd_B_en(en_B[31]),
        .data_B_out(bus_B),
        .data_out(gpr_o[31]),
        .int_in(int_instruction),
        .wt_type(wt_type),
        .stack_in(stack_o),
        .ret_en(ret_en | cond_int_reset_out),
        .cal_en(cal_en),
        .data_nxt(pc_nxt_o)
    );


    MEM memory(
        .en(ram_en),
        .clk(clk),
        .rst_n(rst_n),
        .opcode_in(opcode),
        .data_A_in(bus_A),
        .data_B_in(bus_B),
        .boot(boot_mode),
        .PC_in(gpr_o[31]),
        .instuction(rom_o),
        .data_out(bus_C),
        .cal_en(cal_en),
        .int_en(int_instruction),
        .ret_en(ret_en),
        .irt_en(cond_int_reset_out),
        .hint_en(ext_int_temp),
        .sp(stack_addr),
        .pc_nxt(pc_nxt_o),
        .stack_inc(stack_inc_en),
        .stack_dec(stack_dec_en),
        .stack_out(stack_o)
    );

    BASE_ADDR_INTERFACE base_addr_interface
    (
        .clk(clk),
        .rst_n(rst_n),
        .data_io(io_data),
        .cs_en(io_cs_en[1]),
        .wt_en(io_wt_en),
        .rd_en(io_rd_en),
        .addr_in(io_reg_addr),
        .stack_inc_en(stack_inc_en),    //call  int
        .stack_dec_en(stack_dec_en),    //ret   iret
        .base_prog_addr(base_prog_addr),
        .base_ram_addr(base_ram_addr),
        .stack_addr(stack_addr)
    );

    INT_EN_INTERFACE int_en_interface(
        .clk(clk),
        .rst_n(rst_n),
        .data_io(io_data),
        .cs_en(io_cs_en[0]),
        .wt_en(io_wt_en),
        .rd_en(io_rd_en),
        .int_en(int_en)
    );

    BOOT_EN_INTERFACE boot_en_interface
    (
        .clk(clk),
        .rst_n(rst_n),
        .data_io(io_data),
        .cs_en(io_cs_en[2]),
        .wt_en(io_wt_en),
        .rd_en(io_rd_en),
        .boot_mode(boot_mode)
    );

    UART_INTERFACE 
    #(
        .FREQ(FREQ)
    )
    uart_0(
        .clk(clk),
        .rst_n(rst_n),
        .data_io(io_data),
        .cs_en(io_cs_en[8]),
        .wt_en(io_wt_en),
        .rd_en(ioad_wt_en),
        .addr_in(io_reg_addr),
        .RX(RX0),
        .TX(TX0),
        .int(uart_int)
    );

    MultiHardTimer mht
    (
        .clk(clk),
        .rst_n(rst_n),
        .data_io(io_data),
        .cs_en(io_cs_en[4]),
        .wt_en(io_wt_en),
        .rd_en(io_rd_en),
        .addr_in(io_reg_addr),
        .timer_in(gpr_o[30]),
        .int(mht_int)
    ); 

endmodule