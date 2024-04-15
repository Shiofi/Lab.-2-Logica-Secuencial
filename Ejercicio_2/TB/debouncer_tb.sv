`timescale 1ns / 1ps

module debouncer_tb;

    // Inputs
    logic clk;
    logic boton_pi;
    
    // Outputs
    logic boton_debounce_o;

    // Instantiate the debouncer module
    debouncer u_debouncer (
        .clk(clk),
        .boton_pi(boton_pi),
        .boton_debounce_o(boton_debounce_o)
    );

    // Clock generation
    always begin
        #50 clk = ~clk; // Toggle the clock every 5 time units
    end

    // Initial block to initialize signals
    initial begin
        // Initialize inputs
        clk = 0;
        boton_pi = 0;
        
        // Monitor the outputs
        $display("Time = %t, boton_debounce_o = %b", $time, boton_debounce_o);

        // Apply some input changes
        #60 boton_pi = 1;
        #70 boton_pi = 0;
        #80 boton_pi = 1;
        #90 boton_pi = 0;
        #100 boton_pi = 1;
        #110 boton_pi = 0;
        #120 boton_pi = 1;
        #130 boton_pi = 0;
        
        // Monitor the outputs
        $display("Time = %t, boton_debounce_o = %b", $time, boton_debounce_o);
        
        // Finish simulation
        $finish;
    end

endmodule
