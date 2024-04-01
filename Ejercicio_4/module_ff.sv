`timescale 1ns / 1ps


// modulo para crear un flipflop
module module_ff(
input logic  D,
input logic reloj,
input logic CE,       
output  reg  Q=0
);

always  @(posedge reloj) begin
    if(CE==1)
    Q<=D;                                    
end



endmodule