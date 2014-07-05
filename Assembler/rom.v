
// This ROM is automatically generated by the assembler.

module ROM(
    input wire[31:0] addr,
    output reg[31:0] data
);

    always @(*) begin
        case (addr)
        32'h00400000: data = 32'h02308820; // add $s1 $s1 $s0
        32'h00400004: data = 32'h22100001; // addi $s0 $s0 1
        32'h00400008: data = 32'h1612FFFD; // bne $s0 $s2 loop
        32'h0040000C: data = 32'h02201020; // add $v0 $s1 $0
        32'h00400010: data = 32'h03E00008; // jr $ra

        default: data = 32'hCCCCCCCC;
        endcase
    end

endmodule

    