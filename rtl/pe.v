// Processing Element (PE) for Systolic Array
// - Performs Multiply-Accumulate (MAC) operation
// - Passes input data to neighboring PEs
// - Accumulates partial sum over clock cycles

module pe #(parameter WIDTH = 16)(
    input  logic clk,
    input  logic rst,

    // Input operands
    input  logic [WIDTH-1:0] a_in,
    input  logic [WIDTH-1:0] b_in,

    // Data propagation to next PE
    output logic [WIDTH-1:0] a_out,
    output logic [WIDTH-1:0] b_out,

    // Accumulated result
    output logic [2*WIDTH-1:0] acc_out
);

    // Internal accumulator register
    logic [2*WIDTH-1:0] acc;

    // Sequential MAC operation
    always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        acc   <= 0;
        a_out <= 0;
        b_out <= 0;
    end else begin
        acc   <= acc + (a_in * b_in);

        // IMPORTANT: ensure no X propagation
        a_out <= (a_in === 'x) ? 0 : a_in;
        b_out <= (b_in === 'x) ? 0 : b_in;
    end
end
    
    assign acc_out = acc;	// Output assignment

endmodule
