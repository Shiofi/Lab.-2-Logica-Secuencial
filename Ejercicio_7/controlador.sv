`timescale 1ns / 1ps

module controlador(
    input logic clk,
    input logic reset_pi,
    input logic switch_pi,
    input logic [3:0] teclado_pi,
    input logic key_detect_i,
    output logic [2:0] codigo_error,
    output logic salida_mux_o,
    output logic activar_display_o,
    output logic [3:0] operacion_o,
    output logic control_registro_o,
    output logic [4:0] direccion_registro_o,
    output logic [4:0] direccion_lectura_1_o,
    output logic [4:0] direccion_lectura_2_o
    );
    
    logic listo;
    logic [4:0] registro_counter = 5'b00001;
    logic [4:0] direccion_1 = 5'b00001;
    logic [4:0] direccion_2 = 5'b00010;
    logic [4:0] operacion;
    logic cuenta_ciclo;
    
    typedef enum logic [4:0]{
        INICIO,
        RECIBIR_NUMERO,
        ALMACENAR_NUMERO,
        RECIBIR_OPERACION,
        LEER_REGISTRO,
        MOSTRAR_DISPLAY,
        MOSTRAR_OPERACION,
        REALIZAR_OPERACION} estado;
        
    estado estado_actual, siguiente_estado;
    
    always_ff @(posedge clk) 
        if (reset_pi)
            estado_actual <= INICIO;
        else
            estado_actual <= siguiente_estado;
            
    always_comb begin
        case (estado_actual)
            INICIO: 
                if (switch_pi == 1) begin
                    siguiente_estado = RECIBIR_NUMERO;
                    cuenta_ciclo = 0;
                    listo = 0;
                end
                else if (switch_pi == 0)
                    siguiente_estado = LEER_REGISTRO;
            
            RECIBIR_NUMERO:
                if (key_detect_i && teclado_pi[3:0] != 4'b0000 && teclado_pi[3:0] <= 4'b1001) begin
                    siguiente_estado = ALMACENAR_NUMERO;
                    control_registro_o = 1;
                    salida_mux_o = 'b0;
                end
                else begin
                    codigo_error = 3'b111;
                    siguiente_estado = RECIBIR_NUMERO;
                end
                    
            ALMACENAR_NUMERO: begin
                if (cuenta_ciclo == 0) begin
                    control_registro_o = 1;
                    direccion_1 = registro_counter;
                    registro_counter = registro_counter + 1;
                    siguiente_estado = MOSTRAR_DISPLAY;                   
                end
            else if (cuenta_ciclo == 1) begin
                    control_registro_o = 1;
                    registro_counter = registro_counter + 1;
                    direccion_2 = registro_counter;
                    siguiente_estado = MOSTRAR_DISPLAY;
                end
            end
                
            MOSTRAR_DISPLAY:
                if (listo == 1) //cambiar
                    siguiente_estado = INICIO;
                else begin
                    siguiente_estado = RECIBIR_OPERACION;
                    control_registro_o = 0;
                    activar_display_o = 1;
                end
                
            RECIBIR_OPERACION:
            begin
                if (4'b1010 <= teclado_pi <= 4'b1110) begin
                    operacion = teclado_pi;
                    siguiente_estado = MOSTRAR_OPERACION;
                    activar_display_o = 0;
                end
                
                else if (teclado_pi == 4'b1111 && cuenta_ciclo == 1) begin
                    operacion = teclado_pi;
                    siguiente_estado = LEER_REGISTRO;
                    activar_display_o = 0;
                end
                
                else begin
                    codigo_error = 3'b111;
                     siguiente_estado = RECIBIR_OPERACION;
                 end
            end
                    
            MOSTRAR_OPERACION: 
                begin  
                    operacion = teclado_pi;
                    siguiente_estado = RECIBIR_NUMERO;
                    cuenta_ciclo = 1;
                end
            
            LEER_REGISTRO:
                if (switch_pi == 1) begin
                    direccion_2 = registro_counter;
                    direccion_1 = registro_counter - 1;
                    siguiente_estado = REALIZAR_OPERACION;
                end
                
                else if (switch_pi == 0) begin
                    direccion_2 = registro_counter - 1;
                    siguiente_estado = MOSTRAR_DISPLAY;
                end
                    
            REALIZAR_OPERACION:
                begin
                    direccion_2 = registro_counter;
                    direccion_1 = registro_counter - 1;
                    siguiente_estado = ALMACENAR_NUMERO;
                    salida_mux_o = 1'b1;
                    listo = 1;
                end 
                     
            default: siguiente_estado = INICIO;
        endcase
 end       
    //assign control_registro_o = (estado_actual == ALMACENAR_NUMERO) ? 1'b1 : 1'b0;
    //assign activar_display_o = (estado_actual == MOSTRAR_DISPLAY) ? 1'b1 : 1'b0;
    assign direccion_registro_o = direccion_1;
    assign direccion_lectura_1_o = direccion_1;
    assign direccion_lectura_2_o = direccion_2;
    assign operacion_o = operacion;
    
endmodule
