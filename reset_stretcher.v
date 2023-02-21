
module reset_stretcher (
  input  clk,
  input  rst_i,
  output reg rst_o
);

  parameter PERIOD = 4;
  parameter RST_POL = 1'b1;

  reg [PERIOD-1:0] flipflops;
  

  always @(posedge clk) begin
    if (rst_i == RST_POL) begin
      flipflops <= {PERIOD{RST_POL}};
    end else begin
      flipflops <= {flipflops[PERIOD-2:0], ~RST_POL};
    end
  end

  assign rst_o = flipflops[PERIOD-1];

endmodule

