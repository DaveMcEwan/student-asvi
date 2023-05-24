// Assignment via `always_comb` to scalar members of an SVI port.
// Array of SVIs
//Similar implementation of alwayscomb_arraySVI_inst.sv
//Removes modport warnings.

localparam int SIZE = 8;
interface I;

  logic x;
  logic y;
  logic z;
  
  modport P
    ( output x
    , output y
    , output z
    );

endinterface

module M
  ( I.P p[SIZE]
  );

  logic a = 1'b0;
  logic b = 1'b1;
  logic c;

  for (genvar i=0; i<SIZE; i++) begin
    always_comb p[i].x = a;
    always_comb p[i].y = b;
    always_comb p[i].z = c;      
  end

endmodule

module top
  ( input logic i_clk
  , output logic [SIZE-1:0] o_a
  , output logic [SIZE-1:0] o_b
  , output logic [SIZE-1:0] o_c
  );
  I u_I [SIZE]();
  M u_M (.p(u_I));
  
  for (genvar i=0;i<SIZE;i++)begin
    assign o_a[i] = u_I[i].x;      
    assign o_b[i] = u_I[i].y;
    assign o_c[i] = u_I[i].z;    
  end
    
endmodule
