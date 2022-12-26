------------------------------------------------------------------------
-- File:           Instruction_Memory.vhdl
-- Engineer: 	   Ahmad Qasim
-- Description:    This is an implementation of a Instruction_Memory 
--                 behavioral architecture.
------------------------------------------------------------------------

--Library'
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;  

--Entity

entity Instruction_Memory_VHDL is
port (
 pc: in std_logic_vector(15 downto 0);
 instruction: out  std_logic_vector(15 downto 0)
);
end Instruction_Memory_VHDL;



--Architecture
architecture Behavioral of Instruction_Memory_VHDL is

--Defined Signals
signal rom_addr: std_logic_vector(3 downto 0);


 type ROM_type is array (0 to 15 ) of std_logic_vector(15 downto 0);
 constant rom_data: ROM_type:=(
   "1000000110000000",
   "0010110010001011",
   "1100010000000011",
   "0001000111000000",
   "1110110110000001",
   "1100000001111011",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000"
  );
begin

 rom_addr <= pc(4 downto 1);
  instruction <= rom_data(to_integer(unsigned(rom_addr))) when pc < x"0020" else x"0000";

end Behavioral;