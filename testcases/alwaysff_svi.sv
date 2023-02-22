//Assignment via `always_comb` to scalar members within an SVI.

interface I
 ( input var logic i_clk
 );

 logic z;
 logic y;
 logic x;

 localparam bit Z = 1'b0;

 always_ff @(posedge i_clk) z = Z;      // Constant
 always_ff @(posedge i_clk) y = 1'b1;   // Literal
 always_ff @(posedge i_clk) x = z;      // Signal

endinterface

module M
 ( input var logic i_clk
 );

 I u_I(.*);

endmodule
