`timescale 1ns / 1ps
// This ROM is automatically generated by the assembler.

module ROM(
    input [31:0] addr,
    output reg[31:0] data
);

    always @(*) begin
        case (addr)
        32'h00400000: data <= 32'h3C084000; // lui $t0 16384
        32'h00400004: data <= 32'h21100020; // addi $s0 $t0 32
        32'h00400008: data <= 32'h8E080000; // lw $t0 0($s0)
        32'h0040000C: data <= 32'h00084780; // sll $t0 $t0 30
        32'h00400010: data <= 32'h000847C2; // srl $t0 $t0 31
        32'h00400014: data <= 32'h15000001; // bne $t0 $zero EXIT_READ_LOOP_1
        32'h00400018: data <= 32'h08100002; // j READ_LOOP_1
        32'h0040001C: data <= 32'h8E11FFFC; // lw $s1 -4($s0)
        32'h00400020: data <= 32'h8E080000; // lw $t0 0($s0)
        32'h00400024: data <= 32'h00084780; // sll $t0 $t0 30
        32'h00400028: data <= 32'h000847C2; // srl $t0 $t0 31
        32'h0040002C: data <= 32'h15000001; // bne $t0 $zero EXIT_READ_LOOP_2
        32'h00400030: data <= 32'h08100008; // j READ_LOOP_2
        32'h00400034: data <= 32'h8E12FFFC; // lw $s2 -4($s0)
        32'h00400038: data <= 32'h00112600; // sll $a0 $s1 24
        32'h0040003C: data <= 32'h00042702; // srl $a0 $a0 28
        32'h00400040: data <= 32'h0C100049; // jal DECODER
        32'h00400044: data <= 32'h0002A140; // sll $s4 $v0 5
        32'h00400048: data <= 32'h20080007; // addi $t0 $zero 7
        32'h0040004C: data <= 32'h0288A025; // or $s4 $s4 $t0
        32'h00400050: data <= 32'h00112700; // sll $a0 $s1 28
        32'h00400054: data <= 32'h00042702; // srl $a0 $a0 28
        32'h00400058: data <= 32'h0C100049; // jal DECODER
        32'h0040005C: data <= 32'h0002A940; // sll $s5 $v0 5
        32'h00400060: data <= 32'h2008000B; // addi $t0 $zero 11
        32'h00400064: data <= 32'h02A8A825; // or $s5 $s5 $t0
        32'h00400068: data <= 32'h00122600; // sll $a0 $s2 24
        32'h0040006C: data <= 32'h00042702; // srl $a0 $a0 28
        32'h00400070: data <= 32'h0C100049; // jal DECODER
        32'h00400074: data <= 32'h0002B140; // sll $s6 $v0 5
        32'h00400078: data <= 32'h2008000D; // addi $t0 $zero 13
        32'h0040007C: data <= 32'h02C8B025; // or $s6 $s6 $t0
        32'h00400080: data <= 32'h00122700; // sll $a0 $s2 28
        32'h00400084: data <= 32'h00042702; // srl $a0 $a0 28
        32'h00400088: data <= 32'h0C100049; // jal DECODER
        32'h0040008C: data <= 32'h0002B940; // sll $s7 $v0 5
        32'h00400090: data <= 32'h2008000E; // addi $t0 $zero 14
        32'h00400094: data <= 32'h02E8B825; // or $s7 $s7 $t0
        32'h00400098: data <= 32'h00007820; // add $t7 $zero $zero
        32'h0040009C: data <= 32'h02202020; // add $a0 $s1 $zero
        32'h004000A0: data <= 32'h02402820; // add $a1 $s2 $zero
        32'h004000A4: data <= 32'h0C100036; // jal Euclidean
        32'h004000A8: data <= 32'h00409820; // add $s3 $v0 $zero
        32'h004000AC: data <= 32'hAE13FFEC; // sw $s3 -20($s0)
        32'h004000B0: data <= 32'hAE13FFF8; // sw $s3 -8($s0)
        32'h004000B4: data <= 32'h8E080000; // lw $t0 0($s0)
        32'h004000B8: data <= 32'h00084740; // sll $t0 $t0 29
        32'h004000BC: data <= 32'h000847C2; // srl $t0 $t0 31
        32'h004000C0: data <= 32'h15000001; // bne $t0 $zero SEND
        32'h004000C4: data <= 32'h0810002D; // j SEND_LOOP
        32'h004000C8: data <= 32'h20080001; // addi $t0 $zero 1
        32'h004000CC: data <= 32'hAE080000; // sw $t0 0($s0)
        32'h004000D0: data <= 32'hAE000000; // sw $zero 0($s0)
        32'h004000D4: data <= 32'h08100002; // j READ_LOOP_1
        32'h004000D8: data <= 32'h23BDFFF8; // addi $sp $sp -8
        32'h004000DC: data <= 32'hAFB00000; // sw $s0 0($sp)
        32'h004000E0: data <= 32'hAFB10004; // sw $s1 4($sp)
        32'h004000E4: data <= 32'h00808020; // add $s0 $a0 $zero
        32'h004000E8: data <= 32'h00A08820; // add $s1 $a1 $zero
        32'h004000EC: data <= 32'h0211402A; // slt $t0 $s0 $s1
        32'h004000F0: data <= 32'h11000003; // beq $t0 $zero NOT_SWITCH
        32'h004000F4: data <= 32'h02004020; // add $t0 $s0 $zero
        32'h004000F8: data <= 32'h02208020; // add $s0 $s1 $zero
        32'h004000FC: data <= 32'h01008820; // add $s1 $t0 $zero
        32'h00400100: data <= 32'h02114022; // sub $t0 $s0 $s1
        32'h00400104: data <= 32'h11000002; // beq $t0 $zero Euclidean_RETURN
        32'h00400108: data <= 32'h01008020; // add $s0 $t0 $zero
        32'h0040010C: data <= 32'h0810003B; // j LOOP
        32'h00400110: data <= 32'h02001020; // add $v0 $s0 $zero
        32'h00400114: data <= 32'h8FB10004; // lw $s1 4($sp)
        32'h00400118: data <= 32'h8FB00000; // lw $s0 0($sp)
        32'h0040011C: data <= 32'h23BD0008; // addi $sp $sp 8
        32'h00400120: data <= 32'h03E00008; // jr $ra
        32'h00400124: data <= 32'h14800002; // bne $a0 $zero DECODER_NOT_0
        32'h00400128: data <= 32'h20020001; // addi $v0 $zero 1
        32'h0040012C: data <= 32'h08100086; // j DECODER_RETURN
        32'h00400130: data <= 32'h20080001; // addi $t0 $zero 1
        32'h00400134: data <= 32'h14880002; // bne $a0 $t0 DECODER_NOT_1
        32'h00400138: data <= 32'h2002004F; // addi $v0 $zero 79
        32'h0040013C: data <= 32'h08100086; // j DECODER_RETURN
        32'h00400140: data <= 32'h20080002; // addi $t0 $zero 2
        32'h00400144: data <= 32'h14880002; // bne $a0 $t0 DECODER_NOT_2
        32'h00400148: data <= 32'h20020012; // addi $v0 $zero 18
        32'h0040014C: data <= 32'h08100086; // j DECODER_RETURN
        32'h00400150: data <= 32'h20080003; // addi $t0 $zero 3
        32'h00400154: data <= 32'h14880002; // bne $a0 $t0 DECODER_NOT_3
        32'h00400158: data <= 32'h20020006; // addi $v0 $zero 6
        32'h0040015C: data <= 32'h08100086; // j DECODER_RETURN
        32'h00400160: data <= 32'h20080004; // addi $t0 $zero 4
        32'h00400164: data <= 32'h14880002; // bne $a0 $t0 DECODER_NOT_4
        32'h00400168: data <= 32'h2002004C; // addi $v0 $zero 76
        32'h0040016C: data <= 32'h08100086; // j DECODER_RETURN
        32'h00400170: data <= 32'h20080005; // addi $t0 $zero 5
        32'h00400174: data <= 32'h14880002; // bne $a0 $t0 DECODER_NOT_5
        32'h00400178: data <= 32'h20020024; // addi $v0 $zero 36
        32'h0040017C: data <= 32'h08100086; // j DECODER_RETURN
        32'h00400180: data <= 32'h20080006; // addi $t0 $zero 6
        32'h00400184: data <= 32'h14880002; // bne $a0 $t0 DECODER_NOT_6
        32'h00400188: data <= 32'h20020020; // addi $v0 $zero 32
        32'h0040018C: data <= 32'h08100086; // j DECODER_RETURN
        32'h00400190: data <= 32'h20080007; // addi $t0 $zero 7
        32'h00400194: data <= 32'h14880002; // bne $a0 $t0 DECODER_NOT_7
        32'h00400198: data <= 32'h2002000F; // addi $v0 $zero 15
        32'h0040019C: data <= 32'h08100086; // j DECODER_RETURN
        32'h004001A0: data <= 32'h20080008; // addi $t0 $zero 8
        32'h004001A4: data <= 32'h14880002; // bne $a0 $t0 DECODER_NOT_8
        32'h004001A8: data <= 32'h20020000; // addi $v0 $zero 0
        32'h004001AC: data <= 32'h08100086; // j DECODER_RETURN
        32'h004001B0: data <= 32'h20080009; // addi $t0 $zero 9
        32'h004001B4: data <= 32'h14880002; // bne $a0 $t0 DECODER_NOT_9
        32'h004001B8: data <= 32'h20020004; // addi $v0 $zero 4
        32'h004001BC: data <= 32'h08100086; // j DECODER_RETURN
        32'h004001C0: data <= 32'h2008000A; // addi $t0 $zero 10
        32'h004001C4: data <= 32'h14880002; // bne $a0 $t0 DECODER_NOT_A
        32'h004001C8: data <= 32'h20020008; // addi $v0 $zero 8
        32'h004001CC: data <= 32'h08100086; // j DECODER_RETURN
        32'h004001D0: data <= 32'h2008000B; // addi $t0 $zero 11
        32'h004001D4: data <= 32'h14880002; // bne $a0 $t0 DECODER_NOT_B
        32'h004001D8: data <= 32'h20020060; // addi $v0 $zero 96
        32'h004001DC: data <= 32'h08100086; // j DECODER_RETURN
        32'h004001E0: data <= 32'h2008000C; // addi $t0 $zero 12
        32'h004001E4: data <= 32'h14880002; // bne $a0 $t0 DECODER_NOT_C
        32'h004001E8: data <= 32'h20020031; // addi $v0 $zero 49
        32'h004001EC: data <= 32'h08100086; // j DECODER_RETURN
        32'h004001F0: data <= 32'h2008000D; // addi $t0 $zero 13
        32'h004001F4: data <= 32'h14880002; // bne $a0 $t0 DECODER_NOT_D
        32'h004001F8: data <= 32'h20020042; // addi $v0 $zero 66
        32'h004001FC: data <= 32'h08100086; // j DECODER_RETURN
        32'h00400200: data <= 32'h2008000E; // addi $t0 $zero 14
        32'h00400204: data <= 32'h14880002; // bne $a0 $t0 DECODER_NOT_E
        32'h00400208: data <= 32'h20020030; // addi $v0 $zero 48
        32'h0040020C: data <= 32'h08100086; // j DECODER_RETURN
        32'h00400210: data <= 32'h20020038; // addi $v0 $zero 56
        32'h00400214: data <= 32'h08100086; // j DECODER_RETURN
        32'h00400218: data <= 32'h03E00008; // jr $ra
        32'h80000000: data <= 32'h08000013; // j EXCEPTION
        32'h80000004: data <= 32'h08000002; // j INTERRUPT
        32'h80000008: data <= 32'h15E00003; // bne $t7 $zero INTERRUPT_NOT_0
        32'h8000000C: data <= 32'hAE14FFF4; // sw $s4 -12($s0)
        32'h80000010: data <= 32'h200F0001; // addi $t7 $zero 1
        32'h80000014: data <= 32'h08000014; // j KERNAL_RETURN
        32'h80000018: data <= 32'h20080001; // addi $t0 $zero 1
        32'h8000001C: data <= 32'h15E80003; // bne $t7 $t0 INTERRUPT_NOT_1
        32'h80000020: data <= 32'hAE15FFF4; // sw $s5 -12($s0)
        32'h80000024: data <= 32'h200F0002; // addi $t7 $zero 2
        32'h80000028: data <= 32'h08000014; // j KERNAL_RETURN
        32'h8000002C: data <= 32'h20080002; // addi $t0 $zero 2
        32'h80000030: data <= 32'h15E80003; // bne $t7 $t0 INTERRUPT_NOT_2
        32'h80000034: data <= 32'hAE16FFF4; // sw $s6 -12($s0)
        32'h80000038: data <= 32'h200F0003; // addi $t7 $zero 3
        32'h8000003C: data <= 32'h08000014; // j KERNAL_RETURN
        32'h80000040: data <= 32'hAE17FFF4; // sw $s7 -12($s0)
        32'h80000044: data <= 32'h200F0000; // addi $t7 $zero 0
        32'h80000048: data <= 32'h08000014; // j KERNAL_RETURN
        32'h8000004C: data <= 32'h08000014; // j KERNAL_RETURN
        32'h80000050: data <= 32'h03400008; // jr $k0

        default: data <= 32'hCCCCCCCC;
        endcase
    end

endmodule

    