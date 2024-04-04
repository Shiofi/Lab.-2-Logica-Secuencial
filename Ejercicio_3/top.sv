`timescale 1ns / 1ps

module top(input logic clk,
           input logic in_1,
           input logic in_2,
           input logic in_3,
           input logic in_4,
           output logic out_1,
           output logic out_2,
           output logic out_3,
           output logic out_4,
           input logic rst,
           output logic [3:0] sal
           );
           
clk_divider clk_1(
.clk(clk), .divide_clk(divide_clk)
);

counter_2bits c_2(.clk(clk), .rst(rst), .pause(pause), .count(count));         

Antirebote(.clk(clk), .boton_pi(boton_pi), .boton_debounce_o(boton_debounce_o));
  
endmodule
