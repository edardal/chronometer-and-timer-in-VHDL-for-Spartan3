--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:45:43 01/11/2017
-- Design Name:   
-- Module Name:   C:/Users/Usuario/Desktop/proyectoSED/RODEDUNAI/cronometro_tb.vhd
-- Project Name:  RODEDUNAI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cronometro
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY cronometro_tb IS
END cronometro_tb;
 
ARCHITECTURE behavior OF cronometro_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cronometro
    PORT(
         clk : IN  std_logic;
         clr_n : IN  std_logic;
         lap : IN  std_logic;
         ce_n : IN  std_logic;
         up : IN  std_logic;
         load_N : IN  std_logic;
			Select1 : IN  std_logic;
         Select2 : IN  std_logic;
			Select3 : IN  std_logic;
			reinicio : IN  std_logic;
         IN_SEG0 : IN  std_logic_vector(3 downto 0);
         IN_SEG1 : IN  std_logic_vector(3 downto 0);
         IN_MIN0 : IN  std_logic_vector(3 downto 0);
         IN_MIN1 : IN  std_logic_vector(3 downto 0);
         Segundo0 : OUT  std_logic_vector(3 downto 0);
         Segundo1 : OUT  std_logic_vector(3 downto 0);
         Minuto0 : OUT  std_logic_vector(3 downto 0);
         Minuto1 : OUT  std_logic_vector(3 downto 0);
         FINAL : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal clr_n : std_logic := '0';
   signal lap : std_logic := '0';
   signal ce_n : std_logic := '0';
   signal up : std_logic := '0';
   signal load_N : std_logic := '1';
	signal reinicio : std_logic := '0';
   signal IN_SEG0 : std_logic_vector(3 downto 0) := x"8";
   signal IN_SEG1 : std_logic_vector(3 downto 0) := x"0";
   signal IN_MIN0 : std_logic_vector(3 downto 0) := x"0";
   signal IN_MIN1 : std_logic_vector(3 downto 0) := x"0";
	signal Select1 : std_logic := '0';
   signal Select2 : std_logic := '1';
	signal Select3 : std_logic := '1';

 	--Outputs
   signal Segundo0 : std_logic_vector(3 downto 0);
   signal Segundo1 : std_logic_vector(3 downto 0);
   signal Minuto0 : std_logic_vector(3 downto 0);
   signal Minuto1 : std_logic_vector(3 downto 0);
   signal FINAL : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cronometro PORT MAP (
          clk => clk,
          clr_n => clr_n,
          lap => lap,
          ce_n => ce_n,
          up => up,
          load_N => load_N,
			 Select1 => Select1,
          Select2 => Select2,
			 Select3 => Select3,
			 reinicio => reinicio,
          IN_SEG0 => IN_SEG0,
          IN_SEG1 => IN_SEG1,
          IN_MIN0 => IN_MIN0,
          IN_MIN1 => IN_MIN1,
          Segundo0 => Segundo0,
          Segundo1 => Segundo1,
          Minuto0 => Minuto0,
          Minuto1 => Minuto1,
          FINAL => FINAL
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

  -- Stimulus process
   stim_proc: process
   begin		
  CLR_N<='1';
  wait for 20 ns;
  CLR_N<='0';
  UP<='1';
  wait for 90 ns;
  LOAD_N<='0';
  
  wait for 50 ns;
  LOAD_N<='1';
  UP<='0';
  
  wait for 10 ns;
  CE_N<='1';
  LAP<='1';

 wait for 30 ns;
  CE_N<='0';
  LAP<='0';
  wait for 50 ns;
  
  UP<='1';
  
  wait for 80 ns;
  
  
  assert false
  report "fin de la simulacion."
  severity failure;
  
   end process;

END;
