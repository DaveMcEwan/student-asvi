// Assignment via `assign` to scalar members within an SVI.
interface I;

  localparam bit Z = 1'b0;

  logic z;
  logic y;
  logic x;

  always_comb z = Z;      // Constant
  always_comb y = 1'b1;   // Literal
  always_comb x = z;      // Signal

endinterface


module M;

 I u_I();

endmodule
