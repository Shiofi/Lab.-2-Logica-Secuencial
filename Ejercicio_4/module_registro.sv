`timescale 1ns / 1ps

// modulo para crear un flipflop
module module_registro(


input logic  dp_i3,
input logic  dp_i2,
input logic  dp_i1,
input logic  dp_i0,
input logic dp_ce,
//input logic clk_wiz_0 reloj,
input logic clk,
output logic [3:0] dp_o
//output logic  dp_o3,
//output logic  dp_o2,
//output logic  dp_o1,
//output logic  dp_o0

);

logic clk_10MHz;


clk_wiz_0 clkA(
    // Clock out ports
    .clk_out1(clk_10MHz),     // output clk_10MHz
    // Status and control signals
    
    
   // Clock in ports
    .clk_in1(clk));      // input clk_in1
    
module_ff ffA(.D(dp_i3),.CE(dp_ce),.Q(dp_o[3]),.reloj(clk_10MHz));
module_ff ffB(.D(dp_i2),.CE(dp_ce),.Q(dp_o[2]),.reloj(clk_10MHz));
module_ff ffC(.D(dp_i1),.CE(dp_ce),.Q(dp_o[1]),.reloj(clk_10MHz));
module_ff ffD(.D(dp_i0),.CE(dp_ce),.Q(dp_o[0]),.reloj(clk_10MHz));

endmodule