module demultiplexer #(
    parameter N = 4,       // Number of output lines
    parameter M = 8        // Number of bits per output line
) (
    input  logic [M-1:0] in,          // M-bit input
    input  logic [$clog2(N)-1:0] sel, // Select signal (log2(N) bits)
    output logic [M-1:0] out [N]      // Array of M-bit outputs
);
    always_comb begin
        for (int i = 0; i < N; i++) begin
            out[i] = '0;   // Default all outputs to 0
        end
        out[sel] = in;       // Set selected output
    end
endmodule
