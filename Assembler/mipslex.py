# -*- coding: utf-8 -*-
import ply.lex as lex
import re
import sys

# Reserved keywords.
# 保留关键字
reserved = {
    'NOP'   : r'(?i)nop'    ,
    'LW'    : r'(?i)lw'     ,
    'SW'    : r'(?i)sw'     ,
    'LUI'   : r'(?i)lui'    ,
    'ADD'   : r'(?i)add'    ,
    'ADDU'  : r'(?i)addu'   ,
    'SUB'   : r'(?i)sub'    ,
    'SUBU'  : r'(?i)subu'   ,
    'ADDI'  : r'(?i)addi'   ,
    'ADDIU' : r'(?i)addiu'  ,
    'AND'   : r'(?i)and'    ,
    'OR'    : r'(?i)or'     ,
    'XOR'   : r'(?i)xor'    ,
    'NOR'   : r'(?i)nor'    ,
    'NOR'   : r'(?i)nor'    ,
    'ANDI'  : r'(?i)andi'   ,
    'SLL'   : r'(?i)sll'    ,
    'SRL'   : r'(?i)srl'    ,
    'SRA'   : r'(?i)sra'    ,
    'SLT'   : r'(?i)slt'    ,
    'SLTI'  : r'(?i)slti'   ,
    'SLTIU' : r'(?i)sltiu'  ,
    'BEQ'   : r'(?i)beq'    ,
    'BNE'   : r'(?i)bne'    ,
    'BLEZ'  : r'(?i)blez'   ,
    'BGTZ'  : r'(?i)bgtz'   ,
    'BLTZ'  : r'(?i)bltz'   ,
    'J'     : r'(?i)j'      ,
    'JAL'   : r'(?i)jal'    ,
    'JR'    : r'(?i)jr'     ,
    'JALR'  : r'(?i)jalr'   ,
    'ZERO'  : r'zero'       ,
    'AT'    : r'at'         ,
    'V'     : r'v[01]'      ,
    'A'     : r'a[0-3]'     ,
    'T'     : r't[0-9]'     ,
    'S'     : r's[0-7]'     ,
    'K'     : r'k[01]'      ,
    'GP'    : r'gp'         ,
    'SP'    : r'sp'         ,
    'FP'    : r'fp'         ,
    'RA'    : r'ra'         ,
    'KERNAL': r'kernal'     ,
    'TEXT'  : r'text'       ,
}

for key in reserved.keys():
    reserved[key] += r'$'

# List of token names. This is always required.
# token 列表的名字一定要叫 tokens
tokens = [
    'IDENTIFIER',   # identifier
    'LBRACKET',     # (
    'RBRACKET',     # )
    'NUMBER',       # number
    'REGPREFIX',    # $
    'COLON',        # :
    'DOT',          # .
] + list(reserved.keys())

# Regular expression rules for simple tokens
# 这些定义一定要用 t_ 前缀加上之前定义的 token 名
t_LBRACKET = r'\('
t_RBRACKET = r'\)'
t_REGPREFIX = r'\$'
t_COLON = r'\:'
t_DOT = r'\.'

# 有的 token 也可以被定义为函数，参数为识别出来的 token，返回值还是 token

def t_NUMBER(t):
    r'(-)?[0-9][0-9a-zA-Z]*'
    t.value = int(t.value)
    return t

def t_IDENTIFIER(t):
    r'[a-zA-Z_][a-zA-Z_0-9]*'
    # for (_token, _pattern) in reserved.iteritems():
    #     # if (re.match(_pattern, t.value)):
    #     if (_token.lower() == t.value.lower()):
    #         t.type = _token
    #         return t
    for (_token, _pattern) in reserved.iteritems():
        if (re.match(_pattern, t.value)):
            t.type = _token
            return t
    return t

t_ignore = " \t,"

def t_newline(t):
    r'\n+'
    t.lexer.lineno += t.value.count("\n")
    
def t_comment(t):
    r'\#[^\n]*'
    #t.lexer.lineno += 1

def t_error(t):
    print ("Illegal character '%s'" % t.value[0])
    t.lexer.skip(1)

# Build lexer.
lexer = lex.lex()

if __name__ == '__main__':
    data = '''
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
main:
    lw $4 4($3) # User code starts at [0x00400000]
    nop
    sw $4 4($3)
    lui $4 1000 # Whatever comment
    add $4 $3 $4
    addu $4 $3 $4
    sub $4 $3 $4
    subu $4 $3 $4
    and $4 $3 $4
    or $v0 $3 $4
    xor $4 $3 $4
    nor $4 $3 $4
    addi $4 $4 100
    addiu $4 $3 200
    sll $4 $3 10
    srl $4 $3 10
    sra $4 $3 10
    slt $4 $4 $4
    slti $4 $4 10
    addr:
    beq $0 $0 addr
    bne $0 $0 addr
    blez $3 addr
    bltz $4 addr
    bgtz $5 addr
    j addr
    jal addr
    jalr $3 $31
    jr $3
        addi $s2 $zero 10         # line 0
        addi $s0 $zero 1          # line 1
loop:   add $s1 $s1 $s0   # line 2
        addi $s0 $s0 1    # line 3
        bne $s0 $s2 loop  # line 4
        add $v0 $s1 $0    # line 5
        jr $ra            # line 6
    '''

    if len(sys.argv) >= 2:
        source_file_name = sys.argv[1]
        source_file_handle = open(source_file_name, 'r')
        source_code = source_file_handle.read()
        source_file_handle.close()
        data = source_code

    lexer.input(data)
    
    while True:
        tok = lexer.token()
        if not tok:
            break
        print((tok.type, tok.value))
        #print tok.value
