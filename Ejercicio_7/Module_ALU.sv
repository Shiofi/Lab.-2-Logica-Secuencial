`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2023 11:22:40 AM
// Design Name: 
// Module Name: Module_ALU
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


module Module_ALU #(parameter n = 4)

  (
  //Entradas
  input logic [n-1:0]   ALUA_i,
  input logic [n-1:0]   ALUB_i,
  input logic           ALUFlagIn_i,
  input logic [3:0]     ALUControl_i,

  //Salidas
  output logic [n-1:0] ALUResult_o,
  output logic         ALUCarry_o,
  output logic         ALUCero_o

  );
  
  localparam
            op_suma                  ='b0011,
            op_resta                 ='b0010,
            op_and                   ='b0001,
            op_or                    ='b0000,
            op_corrimiento_log_i     ='b1100;

always_comb  begin
      case(ALUControl_i)
      
      op_suma       : begin
                        ALUCero_o = 0;
                        ALUCarry_o = 0;
                        {ALUCarry_o,ALUResult_o} = ALUA_i + ALUB_i + ALUFlagIn_i; //Se suman las entradas y los datos son concatenados, el bit mas significativo es el carry, el resto son el resultado
                          if (ALUResult_o == '0) begin
                            ALUCero_o      = 1;
                          end
                       end
      op_resta       : begin
                        ALUCero_o = 0;
                        ALUCarry_o = 0;
                        {ALUCarry_o,ALUResult_o} = ALUA_i - ALUB_i - ALUFlagIn_i; //Misma logica que la resta pero se restan las entradas.
                          if (ALUResult_o == '0) begin
                            ALUCero_o      = 1;
                          end 
                        end
      
      
      op_and          : begin 
                          ALUCero_o    = 0;
                          ALUCarry_o = 0;
                          ALUResult_o  = ALUA_i & ALUB_i; //A AND B
                          if (ALUResult_o == '0) begin
                            ALUCero_o      = 1;
                          end 
                        end
                        
      op_or          : begin 
                          ALUCero_o    = 0;
                          ALUCarry_o = 0;
                          ALUResult_o  = ALUA_i | ALUB_i; //A OR B
                          if (ALUResult_o == '0) begin
                            ALUCero_o      = 1;
                          end 
                        end
      
      op_corrimiento_log_i          : begin 
                          ALUCero_o    = 0;
                          ALUCarry_o = 0;
                          {ALUCarry_o,ALUResult_o}  = ALUA_i << ALUB_i; //A se corre B bits hacia la izquierda
                          //El ultimo bit en salir hacia la izquierda es el carry (el más significativo)
                          ALUCarry_o = ALUResult_o[0];
                          if (ALUResult_o == '0) begin
                            ALUCero_o      = 1;
                          end
                        end
                        
         
      default                         :begin
            ALUResult_o = '0;
            ALUCero_o = 1;
            
        end
        endcase
end

endmodule


