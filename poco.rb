#!/usr/bin/env ruby

class Poco < Arch
  def initialize
    super('poco', 'poco.rb')
    @pc_incr = 1
    @vars = {
      'dst'      => {:bitnum => 4,  :sign => 'unsigned', :label => false, :jump => nil,        :asm_radix => 10,  :bin_radix => 10},
      'src'      => {:bitnum => 4,  :sign => 'unsigned', :label => false, :jump => nil,        :asm_radix => 10,  :bin_radix => 10},
      'adr'      => {:bitnum => 4,  :sign => 'unsigned', :label => false, :jump => nil,        :asm_radix => 10,  :bin_radix => 10},
      'imm8'     => {:bitnum => 8,  :sign => 'signed',   :label => false, :jump => nil,        :asm_radix => nil, :bin_radix => 10},
      'uimm8'    => {:bitnum => 8,  :sign => 'unsigned', :label => false, :jump => nil,        :asm_radix => nil, :bin_radix => 10},
      'uimm4'    => {:bitnum => 4,  :sign => 'unsigned', :label => false, :jump => nil,        :asm_radix => nil, :bin_radix => 10},
      'lr_imm8'  => {:bitnum => 8,  :sign => 'signed',   :label => true,  :jump => 'relative', :asm_radix => nil, :bin_radix => 10},
      'lr_imm11' => {:bitnum => 11, :sign => 'signed',   :label => true,  :jump => 'relative', :asm_radix => nil, :bin_radix => 10},
      'la_imm11' => {:bitnum => 11, :sign => 'signed',   :label => true,  :jump => 'absolute', :asm_radix => nil, :bin_radix => 10}
    }
    
    @opcodes = {
      'NOP'   => {:asm => '${dst}',               :bin => '0000_${dst}_xxxx_0000'      },
      'ADD'   => {:asm => 'r${dst}, r${src}',     :bin => '0000_${dst}_${src}_0001'},
      'SUB'   => {:asm => 'r${dst}, r${src}',     :bin => '0000_${dst}_${src}_0010'},
      'MV'    => {:asm => 'r${dst}, r${src}',     :bin => '0000_${dst}_${src}_0011'},
      'DONE'   => {:asm => '',                     :bin => '0000_xxxx_xxxx_1110'      },
      'DELAY'   => {:asm => '${dst}',               :bin => '0000_${dst}_xxxx_1111'      },
      'LDI'  => {:asm => 'r${dst}, #${uimm8}',   :bin => '0011_${dst}_${uimm8}'    },
      'ADDI'  => {:asm => 'r${dst}, #${imm8}',    :bin => '0100_${dst}_${imm8}'     },
      'BEZ'   => {:asm => 'r${dst}, ${lr_imm8}',  :bin => '1000_${dst}_${lr_imm8}'  },
      'BEZD'   => {:asm => 'r${dst}, ${lr_imm8}',  :bin => '1001_${dst}_${lr_imm8}'  },
      'BNZ'   => {:asm => 'r${dst}, ${lr_imm8}',  :bin => '1010_${dst}_${lr_imm8}'  },
      'BNZD'   => {:asm => 'r${dst}, ${lr_imm8}',  :bin => '1011_${dst}_${lr_imm8}'  },
      'LD_ADD'   => {:asm => 'r${dst}, r${src}, #${uimm4}',  :bin => '0001_${dst}_${src}_${uimm4}' },
      'LD_ADDL'   => {:asm => 'r${dst}, r${src}, #${uimm4}',  :bin => '0101_${dst}_${src}_${uimm4}' },
      'ST_ADDS'   => {:asm => 'r${dst}, r${src}, #${uimm4}',  :bin => '0110_${dst}_${src}_${uimm4}' },
      'ST_ADD'   => {:asm => 'r${dst}, r${src}, #${uimm4}',  :bin => '0010_${dst}_${src}_${uimm4}' }
    }
  end
  
  def absolute_branch_address(cur_pc, dst_pc)
    return dst_pc
  end
  
  def relative_branch_address(cur_pc, dst_pc)
    return dst_pc - cur_pc - @pc_incr
  end
end


$arch = Poco.new
