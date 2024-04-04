`timescale 1ns / 1ps

module calculo_top(
  input logic clk,
  input logic reset_i,
  input logic switch_pi,
  input logic sw_pi,
  input logic [3:0] keypad_input,
  input logic key_detect,
  output logic display_enable,
  output logic [2:0] codigo_error,
  output logic [3:0] operation,
  output logic control_reg,
  output logic [6:0]led_o,
  output logic [3:0] an_o
);

    logic clk_10MHz;
    logic seleccion_mux;
    logic [15:0]salida_mux;
    logic control_registro;
    logic [4:0] direccion_escritura;
    logic [4:0] direccion_lectura_1; //Leer la 2 en el display
    logic [4:0] direccion_lectura_2;
    logic [15:0] resultado_alu;
    logic [15:0] salida_registro_1;
    logic [15:0] salida_registro_2;
    logic [15:0] dato_reg;
    logic clk_1kHz;
    logic carry_out;
    logic zero_out;


    
    
  clk_wiz_0 reloj(
    .clk_10MHz(clk_10MHz),    
    .reset(reset_i),
    .clk_in1(clk));     
    
  controlador controller(
    .clk(clk),
    .reset_pi(reset_i),
    .switch_pi(switch_pi),
    .teclado_pi(keypad_input),
    .key_detect_i(key_detect),
    .codigo_error(codigo_error),
    .activar_display_o(display_enable),
    .salida_mux_o(seleccion_mux),
    .operacion_o(operation),
    .control_registro_o(control_registro), //Simplificar
    .direccion_registro_o(direccion_escritura),
    .direccion_lectura_1_o(direccion_lectura_1),
    .direccion_lectura_2_o(direccion_lectura_2)
  );
  
   mux_2_a_1 mux(
   .dato_teclado_i(keypad_input),
   .dato_alu_i(resultado_alu),
   .seleccion_i(seleccion_mux),
   .salida_o(salida_mux));
   
   bancoreg registro(
   .clk10MHz_i(clk_10MHz),
   .rst_i(reset_i),
   .we_i(control_registro),
   .datain_i(salida_mux),
   .addrWrite_i(direccion_lectura_2),
   .addrRead1_i(direccion_lectura_1),
   .addrRead2_i(direccion_lectura_2),
   .rs1_o(salida_registro_1),
   .rs2_o(salida_registro_2));
   
   Module_ALU opera(
  .ALUA_i(salida_registro_1),
  .ALUB_i(salida_registro_2),
  .ALUFlagIn_i(control_registro),
  .ALUControl_i(operation),
  .ALUResult_o(resultado_alu),
  .ALUCarry_o(carry_out),  
  .ALUCero_o(zero_out)     
);
   
   registro_7_segmentos registra(
   .reset_i(reset_i),
   .we_i(display_enable),
   .clk_i(clk_10MHz),
   .digits_i(salida_registro_2),
   .data_out(dato_reg));
   
   clk_1kHz reduce (
   .clk_i(clk_10MHz),
   .reset_i(reset_i),
   .clk_1kHz_o(clk_1kHz));
   
   display_7_segmentos display(
   .dat_reg(salida_registro_2),
   .sw_pi(sw_pi),
   .clk1k(clk_1kHz),
   .LED_o(led_o),
   .an_o(an_o));
endmodule
