`timescale 1ns / 1ps

module clk(
input logic clk_in,
input logic reset,
output logic clk_out,
output logic locked,
output logic led_po

    );
    
clk_wiz_0 clk(
    // Clock out ports
    .clk_10MHz(clk_out),     // output clk_10MHz
    // Status and control signals
    .reset(reset), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(clk_in));      // input clk_in1

reloj_10MHz prueba(
    .clk_i(clk_in),
    .LED_po(led_po));

endmodule