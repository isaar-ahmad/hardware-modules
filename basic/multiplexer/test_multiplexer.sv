module tb_mux;

  // Parameters
  parameter N = 4;  // You can change this value to test different sizes
  parameter M = 8;  // You can change this value to test different sizes

  // Testbench signals
  logic [M-1:0] in [N-1:0];
  logic [$clog2(N)-1:0] sel;
  logic [M-1:0] out;

  // Instantiate the multiplexer
  multiplexer #(.N(N),.M(M)) uut (
    .in(in),
    .sel(sel),
    .out(out)
  );

  // Test procedure
  initial begin
    // Initialize inputs
    
    in = {0,0,0,0};
    sel = 0;

    // Apply test vectors
    #10 in  = {99,124,119,123}; sel = 2'b00;  // Expect out = in[0] = 0
    #10 sel = 2'b01;  // Expect out = in[1] = 1
    #10 sel = 2'b10;  // Expect out = in[2] = 0
    #10 sel = 2'b11;  // Expect out = in[3] = 1

    // Add more test cases as needed
    #10 $finish;
  end

  // Monitor changes
  initial begin
     for (int i = 0; i < N; i++) begin
        $monitor("Time = %0t, sel = %b, out = %0d", $time, sel, out);
     end
  end

endmodule