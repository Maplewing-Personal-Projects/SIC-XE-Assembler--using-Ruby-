OPTAB = {}
OPTAB["ADD"]    = {:opcode => 0x18, :format => 3}
OPTAB["ADDF"]   = {:opcode => 0x58, :format => 3}
OPTAB["ADDR"]   = {:opcode => 0x90, :format => 2}
OPTAB["AND"]    = {:opcode => 0x40, :format => 3}
OPTAB["CLEAR"]  = {:opcode => 0xB4, :format => 2}
OPTAB["COMP"]   = {:opcode => 0x28, :format => 3}
OPTAB["COMPF"]  = {:opcode => 0x88, :format => 3}
OPTAB["COMPR"]  = {:opcode => 0xA0, :format => 2}
OPTAB["DIV"]    = {:opcode => 0x24, :format => 3}
OPTAB["DIVF"]   = {:opcode => 0x64, :format => 3}
OPTAB["DIVR"]   = {:opcode => 0x9C, :format => 2}
OPTAB["FIX"]    = {:opcode => 0xC4, :format => 1}
OPTAB["FLOAT"]  = {:opcode => 0xC0, :format => 1}
OPTAB["HIO"]    = {:opcode => 0xF4, :format => 1}
OPTAB["J"]      = {:opcode => 0x3C, :format => 3}
OPTAB["JEQ"]    = {:opcode => 0x30, :format => 3}
OPTAB["JGT"]    = {:opcode => 0x34, :format => 3}
OPTAB["JLT"]    = {:opcode => 0x38, :format => 3}
OPTAB["JSUB"]   = {:opcode => 0x48, :format => 3}
OPTAB["LDA"]    = {:opcode => 0x00, :format => 3}
OPTAB["LDB"]    = {:opcode => 0x68, :format => 3}
OPTAB["LDCH"]   = {:opcode => 0x50, :format => 3}
OPTAB["LDF"]    = {:opcode => 0x70, :format => 3}
OPTAB["LDL"]    = {:opcode => 0x08, :format => 3}
OPTAB["LDS"]    = {:opcode => 0x6C, :format => 3}
OPTAB["LDT"]    = {:opcode => 0x74, :format => 3}
OPTAB["LDX"]    = {:opcode => 0x04, :format => 3}
OPTAB["LPS"]    = {:opcode => 0xD0, :format => 3}
OPTAB["MUL"]    = {:opcode => 0x20, :format => 3}
OPTAB["MULF"]   = {:opcode => 0x60, :format => 3}
OPTAB["MULR"]   = {:opcode => 0x98, :format => 2}
OPTAB["NORM"]   = {:opcode => 0xC8, :format => 1}
OPTAB["OR"]     = {:opcode => 0x44, :format => 3}
OPTAB["RD"]     = {:opcode => 0xD8, :format => 3}
OPTAB["RMO"]    = {:opcode => 0xAC, :format => 2}
OPTAB["RSUB"]   = {:opcode => 0x4C, :format => 3}
OPTAB["SHIFTL"] = {:opcode => 0xA4, :format => 2}
OPTAB["SHIFTR"] = {:opcode => 0xA8, :format => 2}
OPTAB["SIO"]    = {:opcode => 0xF0, :format => 1}
OPTAB["SSK"]    = {:opcode => 0xEC, :format => 3}
OPTAB["STA"]    = {:opcode => 0x0C, :format => 3}
OPTAB["STB"]    = {:opcode => 0x78, :format => 3}
OPTAB["STCH"]   = {:opcode => 0x54, :format => 3}
OPTAB["STF"]    = {:opcode => 0x80, :format => 3}
OPTAB["STI"]    = {:opcode => 0xD4, :format => 3}
OPTAB["STL"]    = {:opcode => 0x14, :format => 3}
OPTAB["STS"]    = {:opcode => 0x7C, :format => 3}
OPTAB["STSW"]   = {:opcode => 0xE8, :format => 3}
OPTAB["STT"]    = {:opcode => 0x84, :format => 3}
OPTAB["STX"]    = {:opcode => 0x10, :format => 3}
OPTAB["SUB"]    = {:opcode => 0x1C, :format => 3}
OPTAB["SUBF"]   = {:opcode => 0x5C, :format => 3}
OPTAB["SUBR"]   = {:opcode => 0x94, :format => 2}
OPTAB["SVC"]    = {:opcode => 0xB0, :format => 2}
OPTAB["TD"]     = {:opcode => 0xE0, :format => 3}
OPTAB["TIO"]    = {:opcode => 0xF8, :format => 1}
OPTAB["TIX"]    = {:opcode => 0x2C, :format => 3}
OPTAB["TIXR"]   = {:opcode => 0xB8, :format => 2}
OPTAB["WD"]     = {:opcode => 0xDC, :format => 3}

DIRTAB = ["BASE","NOBASE","START","END","BYTE","WORD","RESB","RESW","USE","CSECT","EQU"]

SICXE_REGEXP = /^\s*(?:(\w+)\s+)?(\+?(?i:#{OPTAB.keys().join("|")+"|"+DIRTAB.join("|")}))(?:\s+([\w\#\@']+(?:\s*,[\w\#\@'])*))?\s*$/
SICXE_COMMENT = /^\s*(?:\..*)?\s*$/
STRING_CONSTANT = /^C'(.*)'/
X_CONSTANT = /^X'(.*)'/