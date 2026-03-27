// Streaming Processing Element 

module pe_stream #(parameter WIDTH=8)(
    input  logic clk,
    input  logic rst,

    input  logic valid_in,
    input  logic [WIDTH-1:0] a_in,
    input  logic [WIDTH-1:0] b_in,

    output logic valid_out,
    output logic [WIDTH-1:0] a_out,
    output logic [WIDTH-1:0] b_out,
    output logic [2*WIDTH-1:0] acc_out
);

// Internal registers-----------------------

    logic [2*WIDTH-1:0] acc;
    logic [1:0] count;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            acc       <= 0;
            a_out     <= 0;
            b_out     <= 0;
            valid_out <= 0;
            count     <= 0;
        end else begin
            // propagate data
            a_out     <= a_in;
            b_out     <= b_in;
            valid_out <= valid_in;

            // count valid cycles
            if (valid_in)
                count <= count + 1;

            // accumulate only for first 2 cycles (N=2)
            if (valid_in && count < 2) begin
                acc <= acc + (a_in * b_in);
            end
        end
    end

    assign acc_out = acc;

endmodule
