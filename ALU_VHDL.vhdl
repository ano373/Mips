------------------------------------------------------------------------
-- File:           ALU.vhdl
-- Engineer: 	   Ahmad Qasim
-- Description:    This is an implementation of a ALU
--                 behavioral architecture.
------------------------------------------------------------------------

--Library'
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;


--Entity 
entity ALU_VHDL is
port(
 a           : in std_logic_vector(15 downto 0); 
 b           : in std_logic_vector(15 downto 0);
 alu_control : in std_logic_vector(2 downto 0); 
 alu_result  : out std_logic_vector(15 downto 0);
 zero        : out std_logic
 );
end ALU_VHDL;


--Architecture
architecture Behavioral of ALU_VHDL is
signal result: std_logic_vector(15 downto 0);
signal zero_flag : std_logic;

begin
process(alu_control,a,b)
begin
 case alu_control is
 when "000" =>
  result <= a + b; 
 when "001" =>
  result <= a - b; 
 when "010" => 
  result <= a and b; 
 when "011" =>
  result <= a or b; 
 when "100" =>
  if (a<b) then
   result <= x"0001";
  else 
   result <= x"0000";
  end if;
 when others => result <= a + b; 
 end case;
end process;
  
  zero_flag <= '1' when (result =x"0000") else '0';
  alu_result <= result;
  zero <= zero_flag;
  
end Behavioral;