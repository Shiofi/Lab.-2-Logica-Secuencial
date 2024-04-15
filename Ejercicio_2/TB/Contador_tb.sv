`timescale 1ns / 1ps

module contador_tb;

    // Inputs
    logic clk;
    logic reset_i;
    logic boton_i;
    
    // Outputs
    logic [7:0] conta_o;

    // Instantiate the contador module
    contador u_contador (
        .clk(clk),
        .reset_i(reset_i),
        .boton_i(boton_i),
        .conta_o(conta_o)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle the clock every 5 time units
    end

    // Initial block to initialize signals
    initial begin
        // Initialize inputs
        clk = 0;
        reset_i = 0;
        boton_i = 0;
        
        // Apply reset
        reset_i = 1;
        #10 reset_i = 0;
        
        
        // Apply some input changes
        #10 boton_i = 1;
        #10 boton_i = 0;
        #10 boton_i = 1;
        #10 boton_i = 0;
        #10 boton_i = 1;
        #10 boton_i = 0;
        #10 boton_i = 1;
        #10 boton_i = 0;
        #10 boton_i = 1;
        #10 boton_i = 0;
        #10 boton_i = 1;
        #10 boton_i = 0;
        #10 boton_i = 0;
        #10 boton_i = 1;
        #10 boton_i = 0;
        #10 boton_i = 1;
        #10 boton_i = 0;
        
        // Monitor the outputs
        $display("Time = %t, conta_o = %h", $time, conta_o);
        
        // Finish simulation
        $finish;
    end

endmodule

