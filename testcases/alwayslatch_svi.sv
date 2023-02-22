// Assignment via `always_latch` to scalar members within an SVI.

interface I
 ( input logic i_clk
 , input logic i_arst
 );

logic y;
logic x;

always_latch
 if (!i_arst)
   y <= 1'b0;
 else if (i_clk)
   y <= x;
endinterface

module M
 ( input logic i_clk
 , input logic i_arst
 );

I u_I(.*);

endmodule
