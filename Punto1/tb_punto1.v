`timescale 1ns/100ps

module tb_punto1();

wire       o_overflow;
wire [5:0] o_data;

reg [2:0] i_data1;
reg [2:0] i_data2;
reg [1:0] i_sel;
reg       clock;
reg       i_rst_n;


// Clock: período = 10 ns
always #5 clock = ~clock;


// Estímulos
initial begin
    clock   = 1'b0;
    i_rst_n = 1'b0;      // Reset activo
    i_data1 = 3'b000;
    i_data2 = 3'b000;
    i_sel   = 2'b11;

    #50;

    i_rst_n = 1'b1;      // Libero reset

    @(posedge clock);
    i_data1 = 3'b001;
    i_data2 = 3'b001;
    i_sel   = 2'b01;
end


// Detector de overflow
always @(posedge o_overflow) begin
    $display("Overflow de suma unsigned");
    $display("Tiempo = %0t ns", $time);
    $display("o_data = %d", o_data);
    $finish;
end


// DUT
punto_uno u_punto1 (
    .i_data1    (i_data1),
    .i_data2    (i_data2),
    .i_sel      (i_sel),
    .clock      (clock),
    .i_rst_n    (i_rst_n),
    .o_overflow (o_overflow),
    .o_data     (o_data)
);

endmodule