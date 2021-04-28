library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;  
-- VHDL code for the Instruction Memory of the MIPS Processor
entity Instruction_Memory_VHDL is
port (
 pc: in std_logic_vector(15 downto 0);
 instruction: out  std_logic_vector(15 downto 0)
);
end Instruction_Memory_VHDL;

architecture Behavioral of Instruction_Memory_VHDL is
signal rom_addr: std_logic_vector(3 downto 0);
 -- lw $3, 0($0) -- pc=0
 -- Loop: sltiu  $1, $3, 11= pc = 2
 -- beq $1, $0, Skip = 4 --PCnext=PC_current+2+BranchAddr
 -- add $4, $4, $3 = 6
 -- addi $3, $3, 1 = 8
 -- beq $0, $0, Loop--a
 -- Skip c = 12 = 4 + 2 + br
 type ROM_type is array (0 to 15 ) of std_logic_vector(15 downto 0);
 constant rom_data: ROM_type:=(
   0 => x"2403",
   1 => x"002d",
   2 => x"2402",
   3 => x"0019",
   4 => x"0062",
   5 => x"202a",
   6 => x"1080",
   7 => x"0006",
   8 => x"0000",
   9 => x"0000",
   10 => x"0043",
   11 => x"1023",
   12 => x"1443",
   13 => x"fffc",
   14 => x"0062",
   15 => x"202a"--,
--   16 => x"03e0",
--   17 => x"0008",
--   18 => x"0000",
--   19 => x"0000",
--   20 => x"0062",
--   21 => x"1823",
--   22 => x"1443",
--   23 => x"fff7",
--   24 => x"0062",
--   25 => x"202a",
--   26 => x"1000",
--   27 => x"fffa"
  );
begin

 rom_addr <= pc(4 downto 1);
  instruction <= rom_data(to_integer(unsigned(rom_addr))) when pc < x"0020" else x"0000";

end Behavioral;