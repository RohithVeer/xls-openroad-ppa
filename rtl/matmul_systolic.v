// Systolic Array based Matrix Multiplication
// - Parameterized NxN matrix multiplication
// - Uses grid of Processing Elements (PEs)
// - Designed for hardware-efficient ML acceleration


module matmul_systolic #(parameter N = 4, WIDTH = 16)(
    input  logic clk,
    input  logic rst,

    // Input matrices
    input  logic [WIDTH-1:0] A [N][N],
    input  logic [WIDTH-1:0] B [N][N],

    // Output matrix
    output logic [2*WIDTH-1:0] C [N][N]
);

    // Internal data buses between PEs
    logic [WIDTH-1:0] a_bus [N][N];
    logic [WIDTH-1:0] b_bus [N][N];
    logic [2*WIDTH-1:0] acc   [N][N];

    // Generate NxN grid of Processing Elements ----------------------------
    genvar i, j;

    generate
        for (i = 0; i < N; i++) begin
            for (j = 0; j < N; j++) begin

                // Input wires for each PE
                logic [WIDTH-1:0] a_in_wire;
                logic [WIDTH-1:0] b_in_wire;	// Boundary conditions
                
                if (j == 0) begin			// - First column gets data from matrix A
                    assign a_in_wire = (A[i][0] === 'x) ? 0 : A[i][0];
                end else begin
                    assign a_in_wire = a_bus[i][j-1];
                end

                if (i == 0) begin			// - First row gets data from matrix B
                    assign b_in_wire = (B[0][j] === 'x) ? 0 : B[0][j];
                end else begin
                    assign b_in_wire = b_bus[i-1][j];
                end
                
                // Instantiate Processing Element ---------------------------
         
                pe #(.WIDTH(WIDTH)) pe_inst (
                    .clk(clk),
                    .rst(rst),
                    .a_in(a_in_wire),
                    .b_in(b_in_wire),
                    .a_out(a_bus[i][j]),
                    .b_out(b_bus[i][j]),
                    .acc_out(acc[i][j])
                );

                // Assign output
                assign C[i][j] = acc[i][j];

            end
        end
    endgenerate

endmodule
