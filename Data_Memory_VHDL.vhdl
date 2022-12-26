------------------------------------------------------------------------
-- File:           Data_Memory.vhdl
-- Engineer: 	   Ahmad Qasim
-- Description:    This is an implementation of a Data_Memory 
--                 behavioral architecture.
------------------------------------------------------------------------

--Library'
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;  

--Entity Declaration
entity Data_Memory_VHDL is
port (
 clk: in std_logic;
 mem_access_addr: in std_logic_Vector(15 downto 0);
 mem_write_data: in std_logic_Vector(15 downto 0);
 mem_write_en,mem_read:in std_logic;
 mem_read_data: out std_logic_Vector(15 downto 0)
);
end Data_Memory_VHDL;


-- Architecture
architecture Behavioral of Data_Memory_VHDL is

--Defined Signals
signal i: integer;
signal ram_addr: std_logic_vector(7 downto 0);


type data_mem is array (0 to 255 ) of std_logic_vector (15 downto 0);
signal RAM: data_mem :=(
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000",
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000",
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000",
   x"0000",x"0000",x"0000",x"0000",
   x"0000",x"0000",x"0000",x"0000",
   x"0000",x"0000",x"0000",x"0000",
   x"0000",x"0000",x"0000",x"0000",
   x"0000",x"0000",x"0000",x"0000",
   x"0000",x"0000",x"0000",x"0000",
   x"0000",x"0000",x"0000",x"0000",
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000",
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000",
   x"0000",x"0000",x"0000",x"0000", 
   x"0000",x"0000",x"0000",x"0000",
   x"0000",x"0000",x"0000",x"0000",
   x"0000",x"0000",x"0000",x"0000",
   x"0000",x"0000",x"0000",x"0000",
   x"0000",x"0000",x"0000",x"0000",
   x"0000",x"0000",x"0000",x"0000",
   x"0000",x"0000",x"0000",x"0000",
   x"0000",x"0000",x"0000",x"0000"
   ); 
begin

 ram_addr <= mem_access_addr(8 downto 1);
 
 --process that is used to r\w the values
 process(clk)
 begin
  if(rising_edge(clk)) then
		if (mem_write_en='1') then
				ram(to_integer(unsigned(ram_addr))) <= mem_write_data;
		end if;
	end if;
 end process;
   
   mem_read_data <= ram(to_integer(unsigned(ram_addr))) when (mem_read='1') else x"0000";

end Behavioral;