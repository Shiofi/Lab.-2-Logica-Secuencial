`timescale 1ns / 1ps
module tb_top(

    );
    
reg  i3, i2, i1, i0;

//reg  o3, o2, o1, o0;
logic ce;
logic clk_tb;
logic clk_10MHz;
reg [6:0] dp_out;
reg [3:0] dp_o;

//wire clk;

//Se intancia el clk wizard
clk_wiz_0 clkA(
    // Clock out ports
    .clk_out1(clk_10MHz),     // output clk_10MHz
    // Status and control signals
    
   // Clock in ports
    .clk_in1(clk_tb));      // input clk_in1

//Se instancia las salidas del modulo registro


module_top topA(.dp_i3(i3), .dp_i2(i2), .dp_i1(i1), .dp_i0(i0), .dp_ce(ce), .clk(clk_tb), .dp_o(dp_o), .dp_out(dp_out));
initial
begin
initial begin
        // Semilla aleatoria basada en el tiempo
        $randomseed($time);
        clk_tb = 0;
 $randomseed($time);
  #5;
  
   repeat(10) begin
            @(negedge  clk_tb);
            i3 = $random % 4;
            i2 = $random % 4;
            i1 = $random % 4;
            i0 = $random % 4;
   $display("i3 = %b, i2 = %b, i1 = %b, i0 = %b", i3, i2, i1, i0);
            $display("result = %b", dp_out);
        end

        // Finalizar la simulación
        $finish;
    end

endmodule
