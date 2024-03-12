`timescale 1ns / 1ps


module reloj_tb;

logic clk_in;
logic reset;
logic locked;
logic clk_out;

reloj Dut (
.clk_in (clk_in),
.reset (reset),
.clk_out (clk_out),
.locked (locked)
);
always begin
#5 clk_in = ~clk_in;
end

initial begin 
reset = 0;
clk_in = 0;
#10
reset = 1;
#10
reset = 0;


end
endmodule
