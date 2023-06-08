// Assignment via `assign` to scalar members of an SVI instance.
// Array of SVIs

localparam int SIZE = 8;


interface I;

  logic x;
  logic y;
  logic z;

endinterface


module M
  ( I u_I [SIZE-1:0]
  );

  localparam bit Z = 1'b0;

  logic a;

  for (genvar i = 0; i < SIZE; i++) begin
    assign u_I[i].x = Z;      // Constant
    assign u_I[i].y = 1'b1;   // Literal
    assign u_I[i].z = a;      // Signal
  end

endmodule


module top
  ( output logic [SIZE-1:0] o_a
  , output logic [SIZE-1:0] o_b
  , output logic [SIZE-1:0] o_c
  );

  I u_I [SIZE-1:0] ();

  M u_M
    ( .*
    );

  for (genvar i = 0; i < SIZE; i++) begin
    assign o_a[i] = u_I[i].x;
    assign o_b[i] = u_I[i].y;
    assign o_c[i] = u_I[i].z;
  end

endmodule
