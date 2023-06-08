// Assignment via `assign` to scalar members within an SVI.

interface I;

  logic z;
  logic y;
  logic x;
  localparam bit Z = 1'b0;

  assign z = Z;      // Constant
  assign y = 1'b1;   // Literal
  assign x = ~z;      // Signal

endinterface


module M1
  ( I u_I
  , output logic o_b
  );

  assign o_b = ~u_I.y | (u_I.x ^ u_I.z);

endmodule


module M2
  ( I u_I
  , output logic o_b
  );

  assign o_b = (u_I.x ^ u_I.y) | (u_I.x ^ u_I.z);

endmodule


module top
  ( input logic i_a
  , output logic o_b
  );

  I u_I ();

  M1 u_M1
    ( .u_I  (u_I)
    );

  M2 u_M2
    ( .u_I  (u_I)
    );

  assign o_b = ~(u_M2.o_b & u_M1.o_b) ^ (i_a & 1'b1);

endmodule
