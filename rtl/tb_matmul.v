// Testbench

module tb_matmul;

    parameter WIDTH = 8;

    // Inputs
    logic [WIDTH-1:0] A00, A01, A10, A11;
    logic [WIDTH-1:0] B00, B01, B10, B11;

    // Outputs
    logic [2*WIDTH-1:0] C00, C01, C10, C11;

    // DUT
    matmul_unrolled #(WIDTH) dut (
        .A00(A00), .A01(A01),
        .A10(A10), .A11(A11),

        .B00(B00), .B01(B01),
        .B10(B10), .B11(B11),

        .C00(C00), .C01(C01),
        .C10(C10), .C11(C11)
    );

    initial begin
  
    $dumpfile("wave.vcd");   // file name
    $dumpvars(0, tb_matmul); // dump all signals
    
        // Initialize inputs (VERY IMPORTANT)
        A00 = 0; A01 = 0; A10 = 0; A11 = 0;
        B00 = 0; B01 = 0; B10 = 0; B11 = 0;

        #1;

        // Assign values
        // A = [1 2; 3 4]
        // B = [5 6; 7 8]
        A00 = 1; A01 = 2;
        A10 = 3; A11 = 4;

        B00 = 5; B01 = 6;
        B10 = 7; B11 = 8;

        #1;

        $display("Matrix C:");
        $display("C00 = %d", C00);
        $display("C01 = %d", C01);
        $display("C10 = %d", C10);
        $display("C11 = %d", C11);
	#100;
        $finish;
    end

endmodule
