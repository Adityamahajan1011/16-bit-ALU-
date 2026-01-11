module tb_alu;
reg clk ;
reg [15:0] a, b;
reg [2:0] opcode;

wire [16:0] o;
wire s, c, p, z;

integer k;

alu a1 (
   
    .a(a),
    .b(b),
    .opcode(opcode),
    .o(o),
    .s(s),
    .c(c),
    .p(p),
    .z(z)
);

initial clk = 1'b0;
always #5 clk = ~clk;

initial begin
    opcode = 000 ; 
    a = 16'd120;
    b = 16'd100;

    for (k = 1; k < 8; k = k + 1) begin
        #10 opcode = k[2:0];
        
    end
end

initial begin
    $monitor("time=%0t opcode=%0d result=%0d carry=%b sign=%b parity=%b zero=%b",
              $time, opcode, o, c, s, p, z);
end

initial begin
    $dumpfile("tb_alu.vcd");
    $dumpvars(0, tb_alu);
end

initial begin
    #200 $finish;
end

endmodule
