`timescale 1ns/100ps

module tb_punto2();

wire [15:0] o_dataC;

reg [15:0] i_dataA;
reg [15:0] i_dataB;
reg [1:0] i_sel;

// Estímulos
initial begin
    
    i_sel   = 2'b00; //Suma
    i_dataA = 16'sh0004;
    i_dataB = 16'sh0001;

    #50;

    i_dataA = 16'sh0004;
    i_dataB = -16'sh0001;

    #50;

    i_sel   = 2'b01; //Resta
    i_dataA = 16'sh0004;
    i_dataB = 16'sh0001;

    #50;

    i_dataA = 16'sh0004;
    i_dataB = -16'sh0001;

    #50;

    i_sel   = 2'b10; //AND bit a bit
    i_dataA = 16'sh0707;
    i_dataB = 16'sh0101;

    #50;

    i_sel   = 2'b11; //OR bit a bit
    i_dataA = 16'sh0707;
    i_dataB = 16'sh0101;
    
end

// DUT
punto2 u_punto2 (
    .i_dataA    (i_dataA),
    .i_dataB    (i_dataB),
    .i_sel      (i_sel),
    .o_dataC     (o_dataC)
);

endmodule