// Testbench for Streaming Systolic Array

module tb_systolic;

    parameter WIDTH = 8;

    logic clk, rst;
    logic valid;

    logic [WIDTH-1:0] A0, A1;
    logic [WIDTH-1:0] B0, B1;

    logic [2*WIDTH-1:0] C00, C01, C10, C11;

    // DUT
    matmul_systolic_stream #(WIDTH) dut (
        .clk(clk), .rst(rst),
        .valid_in(valid),
        .A0(A0), .A1(A1),
        .B0(B0), .B1(B1),
        .C00(C00), .C01(C01),
        .C10(C10), .C11(C11)
    );

    // clock
    always #5 clk = ~clk;

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_systolic);

    clk = 0;
    rst = 1;
    valid = 0;

    A0=0; A1=0; B0=0; B1=0;

    // Hold reset
    #20;
    rst = 0;

    // Cycle 1-------------
    valid = 1;
    A0 = 1; A1 = 0;
    B0 = 5; B1 = 0;

    #10;
    
    // Cycle 2-------------
    A0 = 2; A1 = 3;
    B0 = 7; B1 = 6;

    #10;

    // Cycle 3 -------------
    A0 = 0; A1 = 4;
    B0 = 0; B1 = 8;

    #10;

    // Stop input
    valid = 0;

    // Flush pipeline
    #100;

    $display("FINAL OUTPUT:");
    $display("C00=%d C01=%d", C00, C01);
    $display("C10=%d C11=%d", C10, C11);
    #100;
    $finish;
end
endmodule
