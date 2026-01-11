module alu (
    input  [15:0] a, b,
    input  [2:0]  opcode,
    output reg [16:0] o,
    output reg s, c, p, z
);

always @(*) begin
    c = 0;

    case (opcode)
        3'd0: begin {c, o} = a + b; end
        3'd1: begin {c, o} = a - b; end
        3'd2: begin o = a + 1; end
        3'd3: begin o = a - 1; end
        3'd4: begin o = a & b; end
        3'd5: begin o = a | b; end
        3'd6: begin o = a ^ b; end
        3'd7: begin o = ~a; end
        default: o = 0;
    endcase

    s = o[15];
    z = (o == 0);
    p = ~^o[15:0];
end

endmodule

