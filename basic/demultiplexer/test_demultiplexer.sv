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
