// 2x2 Systolic Array (Streaming Version)

module matmul_systolic_stream #(parameter WIDTH=8)(
    input logic clk,
    input logic rst,

    input logic valid_in,

    input logic [WIDTH-1:0] A0, A1,   // row 0 stream
    input logic [WIDTH-1:0] B0, B1,   // col 0 stream

    output logic [2*WIDTH-1:0] C00, C01,
    output logic [2*WIDTH-1:0] C10, C11
);

    // internal connections
    logic v00, v01, v10, v11;
    logic [WIDTH-1:0] a00, a01, a10, a11;
    logic [WIDTH-1:0] b00, b01, b10, b11;

    // PE (0,0)
    pe_stream #(WIDTH) pe00 (
        .clk(clk), .rst(rst),
        .valid_in(valid_in),
        .a_in(A0),
        .b_in(B0),
        .valid_out(v00),
        .a_out(a00),
        .b_out(b00),
        .acc_out(C00)
    );

    // PE (0,1)
    pe_stream #(WIDTH) pe01 (
        .clk(clk), .rst(rst),
        .valid_in(v00),
        .a_in(a00),
        .b_in(B1),
        .valid_out(v01),
        .a_out(a01),
        .b_out(b01),
        .acc_out(C01)
    );

    // PE (1,0)
    pe_stream #(WIDTH) pe10 (
        .clk(clk), .rst(rst),
        .valid_in(v00),
        .a_in(A1),
        .b_in(b00),
        .valid_out(v10),
        .a_out(a10),
        .b_out(b10),
        .acc_out(C10)
    );

    // PE (1,1)
    pe_stream #(WIDTH) pe11 (
        .clk(clk), .rst(rst),
        .valid_in(v10),
        .a_in(a10),
        .b_in(b01),
        .valid_out(v11),
        .a_out(a11),
        .b_out(b11),
        .acc_out(C11)
    );

endmodule
