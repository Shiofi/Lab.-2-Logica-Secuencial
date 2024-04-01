`timescale 1ns / 1ps

module module_top(
input logic dp_i3, dp_i2, dp_i1, dp_i0,
input logic dp_ce,
input logic clk,  
output logic [3:0] dp_o,
output logic [6:0] dp_out

    );
    

logic clk_10MHz;
//logic dp_o3, dp_o2, dp_o1, dp_o0;

clk_wiz_0 clkA(
    // Clock out ports
    .clk_out1(clk_10MHz),     // output clk_10MHz
    // Status and control signals
    
    
   // Clock in ports
    .clk_in1(clk));      // input clk_in1

//logic  [3:0] in_deco = {dp_o3, dp_o2, dp_o1, dp_o0};

module_registro regA(.dp_i3(dp_i3), .dp_i2(dp_i2), .dp_i1(dp_i1), .dp_i0(dp_i0), .dp_o(dp_o), .dp_ce(dp_ce), .clk(clk));

module_deco decoA(.num(dp_o),.LED(dp_out));

    
endmodule

