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
 type ROM_type is array (0 to ((2**30)-1)) of std_logic_vector(31 downto 0);
 constant rom_data: ROM_type:=(
   others => (others=>'0')
  );
begin

  rom_addr <= pc(31 downto 2);
  instruction <= rom_data(to_integer(unsigned(rom_addr)));

end Behavioral;