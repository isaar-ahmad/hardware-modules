module multiplexer #(
    parameter N = 4,    // Number of input lines
    parameter M = 8     // Bit width of each input
) (
    input  logic [M-1:0] in [N-1:0],  // Flattened N inputs of M bits each
    input  logic [$clog2(N)-1:0] sel, // Selector (log2(N) bits)
    output logic [M-1:0] out    // Output line
);

    assign       out = in[sel];
   

endmodule