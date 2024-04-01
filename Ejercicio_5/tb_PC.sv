module tb_PC;

    // parámetros del módulo
    localparam W = 8;

    // declaración de señales
    logic clk;
    logic rst;
    logic [1:0] sel;
    logic [W-1:0] pc_i;
    logic [W-1:0] pc_o;
    logic [W-1:0] pcinc_o;

    // instancia del módulo bajo prueba
    PC #(W) uut (
        .clk(clk),
        .rst(rst),
        .sel(sel),
        .pc_i(pc_i),
        .pc_o(pc_o),
        .pcinc_o(pcinc_o)
    );

    // generación de señales de reloj
    always #5 clk = ~clk;

    // inicialización de las entradas
    initial begin
        clk = 0;
        rst = 1;
        sel = 2'b00; // Reset
        pc_i = 8'd0;
        #10 rst = 0;
        #10 sel = 2'b10; // PC_PLUS_4
        #10 sel = 2'b11; // JUMP
        #10 sel = 2'b01; // HOLD
        #10 sel = 2'b00; // Reset
        #10 $finish;
    end

    // monitoreo de las salidas
    always @(posedge clk) begin
        $display("Time=%0t: pc_o=%h, pcinc_o=%h", $time, pc_o, pcinc_o);
    end

endmodule