// Assignment via `always_comb` to a packed array of an interface port.
// Use of modport expressions for slices of a 1D packed array.
/* Single generic interface.Two instantiations of module M with
different modport views*/
// NOTE: Lines 25, 26, 36, 37, 40, and 41. 

interface I;
  
  logic [7:0] x;

  modport P1
    ( output .p1(x[3:0])
    );

  modport P2
    ( output .p2(x[7:4])
    );

endinterface


module M
  ( interface i   //Generic interface
  );

  always_comb i.p1 = '0; //write 0000
  always_comb i.p2 = '1; //write 1111
                        
endmodule


module top
  ( output logic [7:0] o_a
  );

  I u_I ();

  M u_M1 
    ( u_I.P1 //LSBs
    );

  M u_M2
    ( u_I.P2 //MSBs
    );

  assign o_a = u_I.x; //output the full vector 11110000

endmodule
