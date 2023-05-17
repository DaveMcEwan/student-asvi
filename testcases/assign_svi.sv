// Assignment via `assign` to scalar members within an SVI.
interface I;

  localparam bit Z = 1'b0;

  logic z;
  logic y;
  logic x;

  assign z = Z;      // Constant
  assign y = 1'b1;   // Literal
  assign x = z;      // Signal

endinterface


module top;

 I u_I();

endmodule
