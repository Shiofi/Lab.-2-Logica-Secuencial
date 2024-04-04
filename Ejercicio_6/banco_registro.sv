`timescale 1ns / 1ps

//parameter N = 1;
//parameter W = 1;

module banco_registro(input logic clk,  
                      input logic rst,
                      input logic we,
                      input logic [8-1:0] data_in,
                      input logic [8-1:0] addr_rd,
                      input logic [8-1:0] addr_rs1,
                      input logic [8-1:0] addr_rs2,
                      output logic [8-1:0] rs1,
                      output logic [8-1:0] rs2);
                      

logic [8-1:0] registro [0:2*8-1];

always_ff @(posedge clk, posedge rst) begin 
   if (rst) begin 
        for (int i = 0; i < 2*8; i = i++) begin 
            registro[i] = 0; 
        end
   end  
end

always_ff @(posedge clk, posedge we) begin 
    if(we) begin    
        registro[addr_rd] = data_in; 
    end
end

always_ff @(*) begin
    if(addr_rs1 == 0) begin
        rs1 = '0;
    end else begin 
        rs1 = registro[addr_rs1];
    end
    
    if(addr_rs2 == 0) begin
        rs2 = '0;
    end else begin 
        rs2 = registro[addr_rs2];
    end
end
   
endmodule
