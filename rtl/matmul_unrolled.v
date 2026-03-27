// Matrix Multiplication (Fully Tool-Safe Version)
// - Uses flat vectors (NO array ports)
// - Fully combinational
// - Guaranteed to work in Icarus Verilog

module matmul_unrolled #(parameter WIDTH=8)(
    input  logic [WIDTH-1:0] A00, A01, A10, A11,
    input  logic [WIDTH-1:0] B00, B01, B10, B11,
    input logic clk,

    output logic [2*WIDTH-1:0] C00, C01, C10, C11
);

    always_comb begin
        C00 = (A00 * B00) + (A01 * B10);
        C01 = (A00 * B01) + (A01 * B11);
        C10 = (A10 * B00) + (A11 * B10);
        C11 = (A10 * B01) + (A11 * B11);
    end

endmodule
