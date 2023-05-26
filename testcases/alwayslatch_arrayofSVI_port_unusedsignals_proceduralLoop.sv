// Assignment via `always_latch` to scalar members of an SVI port.
// Array of SVIs
// Using modports, output 'y' from module M1 is an input to module M2

localparam int SIZE = 8;


interface I
  ( input logic arst
  , input logic en
  );
 
  logic y;
  logic x;
  logic w;

  modport P1
    ( input x
    , output y
    );

  modport P2
    ( input y
    , output w
    );

endinterface


module M1  // Module does not use signal w.
  ( I.P1 p1[SIZE-1:0]
  , output logic [SIZE-1:0]o_a
  );
  logic en;
  logic rst;

  I u_I 
    ( .arst(rst)
    , .en
    );
  
  for(genvar i = 0; i < SIZE; i++) begin
    always_comb p1[i].x = 1'b1;
    always_latch begin
      if (!rst)
        p1[i].y <= 1'b0;
      else if (en)
        p1[i].y <= p1[i].x;
    end
  assign o_a[i] = p1[i].y;
  end

endmodule


module M2  // Module does not use signal x.
  ( I.P2 p2[SIZE-1:0]
  , output logic [SIZE-1:0]o_b
  );
 
  logic en;

  I u_I 
    ( 
    .en
    );

  for(genvar i = 0; i < SIZE; i++) begin
    always_latch begin
     if (en)
       p2[i].w <= p2[i].y;
    end
    assign o_b[i] = p2[i].w;
  end

endmodule


module top
  ( input logic en
  , input logic i_clk
  , input logic i_arst
  , output logic [SIZE-1:0]o_a 
  , output logic [SIZE-1:0]o_b
  );

  logic [SIZE-1:0] a_a;
  logic [SIZE-1:0] b_b;
  
  I u_I [SIZE-1:0]
    ( .arst(i_arst)
    , .en(en)
    );

  M1 u_M1
    ( .p1(u_I)
    , .o_a(a_a)
    );

  M2 u_M2
    ( .p2(u_I)
    , .o_b(b_b)
    );

  int i =0;
  always_ff @(posedge i_clk) begin
    if (i >= SIZE)
      i <= 0;
    else begin
      o_a[i] <= a_a[i];
      o_b[i] <= b_b[i];
      i++;
    end
  end

endmodule
