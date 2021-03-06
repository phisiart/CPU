# -*- coding: utf-8 -*-

from assembler import *
import sys, os

if __name__ == '__main__':
    source_file_name = sys.argv[1]
    insts = asbl_file(source_file_name)

    out = '''
// This ROM is automatically generated by the assembler.

module ROM(
    input [31:0] addr,
    output reg[31:0] data
);

    always @(*) begin
        case (addr)
'''

    for inst in insts:
        out += "        32'h%08X: data <= 32'h%08X; // %s\n" % (inst[0], inst[1], inst[2])
        # out += (' ' * 8 + "32'h" + ("%08X" % inst[0]) + ": data = " + '\n')
    
    out += '''
        default: data <= 32'h00000000;
        endcase
    end

endmodule

    '''

    handle = open('rom.v', 'w')
    handle.write(out)
    handle.close()
