library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- VHDL code for ALU Control Unit of the MIPS Processor
entity ALU_Control_VHDL is
port(
  ALU_Control: out std_logic_vector(3 downto 0);
  ALUOp : in std_logic_vector(1 downto 0);
  ALU_Funct : in std_logic_vector(5 downto 0)
);
end ALU_Control_VHDL;

architecture Behavioral of ALU_Control_VHDL is
begin
process(ALUOp,ALU_Funct)
begin
case ALUOp is
when "00" => 
 ALU_Control <= "0010" ;
when "01" => 
 ALU_Control <= "0110";
when "10" => 
    case ALU_Funct is
        when "100000" =>
            ALU_Control <= "0010" ;
        when "100010" =>
            ALU_Control <= "0110";
        when "100100" =>
            ALU_Control <= "0000" ;
        when "100101" =>
            ALU_Control <= "0001" ;
        when "101010" =>
            ALU_Control <= "0111" ;
        when others =>  ALU_Control <= "0010";
       end case;
when others => ALU_Control <= "0010";
end case;
end process;
end Behavioral;