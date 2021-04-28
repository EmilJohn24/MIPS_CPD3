library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;  
-- VHDL code for the register file of the MIPS Processor
entity register_file_VHDL is
port (
 clk,rst: in std_logic;
 reg_write_en: in std_logic;
 reg_write_dest: in std_logic_vector(4 downto 0);
 reg_write_data: in std_logic_vector(31 downto 0);
 reg_read_addr_1: in std_logic_vector(4 downto 0);
 reg_read_data_1: out std_logic_vector(31 downto 0);
 reg_read_addr_2: in std_logic_vector(4 downto 0);
 reg_read_data_2: out std_logic_vector(31 downto 0)
);
end register_file_VHDL;

    architecture Behavioral of register_file_VHDL is
type reg_type is array (0 to 31) of std_logic_vector (31 downto 0);
signal reg_array: reg_type;
begin
 process(clk,rst) 
 begin
 if(rst='1') then
   reg_array<= (others=>x"00000000");
 elsif(rising_edge(clk)) then
   if(reg_write_en='1') then
    reg_array(to_integer(unsigned(reg_write_dest))) <= reg_write_data;
   end if;
 end if;
 end process;

 reg_read_data_1 <= x"00000000" when reg_read_addr_1 = "00000" else reg_array(to_integer(unsigned(reg_read_addr_1)));
 reg_read_data_2 <= x"00000000" when reg_read_addr_2 = "00000" else reg_array(to_integer(unsigned(reg_read_addr_2)));

end Behavioral;