`timescale 1ns / 1ps

parameter N = 6;
parameter W = 6;

module banco_registro(input logic clk,  
                      input logic rst,
                      input logic we,
                      input logic [W-1:0] data_in,
                      input logic [N-1:0] addr_rd,
                      input logic [N-1:0] addr_rs1,
                      input logic [N-1:0] addr_rs2,
                      output logic [W-1:0] rs1,
                      output logic [W-1:0] rs2);
                      
logic [W-1:0] [2**N-1:0] registro;

always_ff @(posedge clk, posedge rst) begin 
   if (rst) begin 
        registro <= '0;
   end
   else if (we) begin 
        registro[addr_rd] <= data_in;
   end
end

always_ff @(*) begin
    if(addr_rs1 == 0)
        rs1 <= '0;
    else
        rs1 <= registro[addr_rs1];
end     

always_ff @(*) begin
    if(addr_rs2 == 0)
        rs2 <= '0;
    else
        rs2 <= registro[addr_rs2];
end

endmodule
