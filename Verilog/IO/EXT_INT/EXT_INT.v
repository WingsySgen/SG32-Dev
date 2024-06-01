module HINT(
    input   wire        clk,
    input   wire        rst_n,
    input   wire[30:0]  ext_int_in,
    output  reg [30:0]  ext_int_out,


    input   [30:0]      hint_en,
    input   [30:0]      intc_int_en,
    input               cond_int_set_out,
    
    output              ext_int_temp,
    output              int_instruction
);
    
    assign ext_int_temp = |(ext_int_out & (intc_int_en) & hint_en);
    assign int_instruction = cond_int_set_out | ext_int_temp;

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) ext_int_out <= 31'd0;
        else begin
            ext_int_out <= ext_int_in;
        end
    end

endmodule