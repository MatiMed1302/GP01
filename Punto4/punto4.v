module punto4(
    input signed [7:0] x_in,
    input clock,
    input rst_n,
    output reg signed [11:0] y_out
);

reg signed [7:0] x1, x2, x3;
reg signed [11:0] y1;
wire signed [11:0] eqn;

assign eqn = {{4{x_in[7]}}, x_in} - {{4{x1[7]}}, x1} + {{4{x2[7]}}, x2} + {{4{x3[7]}}, x3} + (y_out >>> 1) + (y1 >>> 2);

always @(posedge clock or negedge rst_n) begin
    if (!rst_n) begin
        x1 <= 8'b0;
        x2 <= 8'b0;
        x3 <= 8'b0;
        y_out <= 12'b0;
        y1 <= 12'b0;
    end
    else begin
        x1 <= x_in;
        x2 <= x1;
        x3 <= x2;
        y_out <= eqn;
        y1 <= y_out;
    end
end

endmodule