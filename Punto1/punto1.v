module punto_uno
(
    input [2:0] i_data1,
    input [2:0] i_data2,
    input [1:0] i_sel,
    input clock,
    input i_rst_n,
    output o_overflow,
    output [5:0] o_data
);

reg [3:0] mux_out;
wire [3:0] sum1_out;
wire [6:0] sum2_out;

reg o_overflow_reg;
reg [5:0] o_data_reg;

assign sum1_out = {1'b0, i_data1} + {1'b0, i_data2};

always @(*) begin
   case (i_sel)
    2'b00 :  mux_out = {1'b0, i_data2};
    2'b01 :  mux_out = sum1_out;
    2'b10 :  mux_out = {1'b0, i_data1};
    default: mux_out = {4{1'b0}};
    endcase 
end

assign sum2_out = {3'b000, mux_out} + {1'b0, o_data_reg};

always @(posedge clock or negedge i_rst_n) begin
    if (!i_rst_n) begin
        {o_overflow_reg, o_data_reg} <= 7'b0000000;
    end
    else begin
        {o_overflow_reg, o_data_reg} <= sum2_out;
    end      
end

assign o_data = o_data_reg;
assign o_overflow = o_overflow_reg;

endmodule

