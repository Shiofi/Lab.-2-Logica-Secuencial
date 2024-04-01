`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2023 19:40:03
// Design Name: 
// Module Name: tb_registro
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_registro(

);

reg  i3, i2, i1, i0;

reg  [3:0] out;
logic ce;
logic clk_tb;
logic clk_10MHz;

//wire clk;

//Se intancia el clk wizard
clk_wiz_0 clkA(
    // Clock out ports
    .clk_out1(clk_10MHz),     // output clk_10MHz
    // Status and control signals
    
    
   // Clock in ports
    .clk_in1(clk_tb));      // input clk_in1


//Se instancia las salidas del modulo registro


module_registro regA(.dp_i3(i3), .dp_i2(i2), .dp_i1(i1), .dp_i0(i0), .dp_o(out), .dp_ce(ce), .clk(clk_tb));

initial
begin


//Se inicializa el reloj
clk_tb = 0;
forever
#5
clk_tb = ~clk_tb;

end

initial
begin

#3000;


//Se crean los registros de entrada iniciales

i3 = 1'b1;
i2 = 1'b0;
i1 = 1'b1;
i0 = 1'b0;


//Se prueba el clock enable

ce = 1'b0;
#20;

ce = 1'b1;
#100;

//Se crean los registros de entrada posteriores

i3 = 1'b1; 
i2 = 1'b1;
i1 = 1'b1;
i0 = 1'b1;

//Se prueba el clock enable

ce = 1'b0;
#20;

ce = 1'b1;
#20;
//#1000;
//$stop;

end


endmodule
