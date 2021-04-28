library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;  
-- VHDL code for the Instruction Memory of the MIPS Processor
entity Instruction_Memory_VHDL is
port (
 pc: in std_logic_vector(31 downto 0);
 instruction: out  std_logic_vector(31 downto 0)
);
end Instruction_Memory_VHDL;

architecture Behavioral of Instruction_Memory_VHDL is
signal rom_addr: std_logic_vector(29 downto 0);
 -- lw $3, 0($0) -- pc=0
 -- Loop: sltiu  $1, $3, 11= pc = 2
 -- beq $1, $0, Skip = 4 --PCnext=PC_current+2+BranchAddr
 -- add $4, $4, $3 = 6
 -- addi $3, $3, 1 = 8
 -- beq $0, $0, Loop--a
 -- Skip c = 12 = 4 + 2 + br
 type ROM_type is array (0 to 31) of std_logic_vector(31 downto 0);
 constant rom_data: ROM_type:=(
    --    0 => x"2403002d",
    --    1 => x"24020019",
    --    2 => x"0062202a",
    --    3 => x"10800006",
    --    4 => x"00000000",
    --    5 => x"00431023",
    --    6 => x"1462fffc",
    --    7 => x"0062202a",
    --    8 => x"03e00008",
    --    9 => x"00000000",
    --    10 => x"00621823",
    --    11 => x"1462fff7",
    --    12 => x"0062202a",
    --    13 => x"1000fffa",
    --    14 => x"00000000",
           0 => "00100000000000100000000000110111", --10111
           1 => "00100000000000110000000010100110",
           2 => x"10620006",
           3 => x"0043202a",
           4 => x"10800006",
           5 => x"00000000",
           6 => x"00621822",
           7 => x"1443fffb", --c
           8 => x"0043202a",
           9 => x"08000009", --jump back
           10 => x"00000000",
           11 => x"00431022",
           12 => x"1443fff6", --7,
           13 => x"0043202a",
           14 => x"08000009", --jump back
           15 => x"00000000",
    others => x"00000000"
  );
begin

  rom_addr <= pc(31 downto 2);
  instruction <= rom_data(to_integer(unsigned(rom_addr)));

end Behavioral;