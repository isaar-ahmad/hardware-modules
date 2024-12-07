# ChatGPT Conversation

**User:**
Generate the systemverilog code for a demultiplexer with N output lines of M bits each.

---
**ChatGPT:**
~~~
module demux #(
    parameter N = 4,       // Number of output lines
    parameter M = 8        // Number of bits per output line
) (
    input  logic [M-1:0] in,       // M-bit input
    input  logic [$clog2(N)-1:0] sel, // Select signal (log2(N) bits)
    output logic [M-1:0] out [N]  // Array of M-bit outputs
);
    always_comb begin
        for (int i = 0; i < N; i++) begin
            out[i] = '0;   // Default all outputs to 0
        end
        out[sel] = in;       // Set selected output
    end
endmodule
~~~
---

**User:**
Rename it to "demultiplexer" . Also, add a systemverilog testbench with random input testing for upto 10 test input/output pairs. Use monitor statement to log the results.

---
**ChatGPT:**
SystemVerilog Code for demultiplexer
~~~
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
~~~
Testbench for demultiplexer
~~~

module tb_demultiplexer;

    parameter N = 4;       // Number of output lines
    parameter M = 8;       // Number of bits per output line

    logic [M-1:0] in;
    logic [$clog2(N)-1:0] sel;
    logic [M-1:0] out [N];

    demultiplexer #(.N(N), .M(M)) uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $display("Time\tInput\tSel\tOutputs");
        $monitor("%0t\t%b\t%b\t%b %b %b %b", $time, in, sel, out[0], out[1], out[2], out[3]);

        // Randomized test cases
        for (int i = 0; i < 10; i++) begin
            in = $urandom_range(0, (1 << M) - 1);
            sel = $urandom_range(0, N-1);
            #5; // Wait for 5 time units
        end
        #10 $finish;
    end
endmodule
~~~
---
