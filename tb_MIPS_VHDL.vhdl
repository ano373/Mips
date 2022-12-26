------------------------------------------------------------------------
-- File:           MIPS.vhdl
-- Engineer: 	   Ahmad Qasim
-- Description:    This is an implementation of a MIP_Processor 
--                 behavioral architecture.
------------------------------------------------------------------------


--Library'
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


--Entity
ENTITY tb_MIPS_VHDL IS
END tb_MIPS_VHDL;
 
 
--Architecture
ARCHITECTURE behavior OF tb_MIPS_VHDL IS 
    
    COMPONENT MIPS_VHDL
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         pc_out : OUT  std_logic_vector(15 downto 0);
         alu_result : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
  
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   
   signal pc_out : std_logic_vector(15 downto 0);
   signal alu_result : std_logic_vector(15 downto 0);
   
   constant clk_period : time := 10 ns;
BEGIN
 
   uut: MIPS_VHDL PORT MAP (
          clk => clk,
          reset => reset,
          pc_out => pc_out,
          alu_result => alu_result
        );

   
   clk_process :process
   begin
  clk <= '0';
  wait for clk_period/2;
  clk <= '1';
  wait for clk_period/2;
   end process;
   
   stim_proc: process
   begin  
      reset <= '1';
      wait for clk_period*10;
  reset <= '0';
      
      wait;
   end process;

END;