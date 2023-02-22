// Add short description of what's being tested

interface in_adders (input int b,c);

endinterface

module add_mult(
 output int a,
 input int b,c
);

in_adders aci (
 .b(b),
 .c(c)
);

// declare internal signals
logic [31:0] x;
logic [31:0] y;

always_comb begin
 x = aci.b + aci.c;
 y = aci.b * aci.c;
end

assign a = x + y;

endmodule
