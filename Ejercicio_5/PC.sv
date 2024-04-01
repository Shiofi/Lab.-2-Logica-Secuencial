module PC #(parameter W = 8)(
    input logic clk, rst,
    input logic [1:0] sel,
    input logic [W-1:0] pc_i,
    output logic [W-1:0] pc_o,
    output logic [W-1:0] pcinc_o
);

// parámetros para las operaciones
localparam HOLD = 2'b01;
localparam PC_PLUS_4 = 2'b10;
localparam JUMP = 2'b11;

// declaración de registros internos
logic [W-1:0] pc_reg;
logic [W-1:0] pcinc_reg;

always_ff @(posedge clk, posedge rst) begin
    if (rst) begin
        pc_reg <= 8'd0;
        pcinc_reg <= 8'd4;
    end else begin
        case(sel)
            HOLD: begin
                pc_reg <= pc_reg;
                pcinc_reg <= pc_reg + 4;
            end
            PC_PLUS_4: begin
                pc_reg <= pc_reg + 4;
                pcinc_reg <= pc_reg + 4;
            end
            JUMP: begin
                pc_reg <= pc_i;
                pcinc_reg <= pc_i + 4;
            end
            default: begin // Reset
                pc_reg <= 8'd0;
                pcinc_reg <= 8'd4;
            end
        endcase
    end
end

// asignación de salidas
assign pc_o = pc_reg;
assign pcinc_o = pcinc_reg;

endmodule