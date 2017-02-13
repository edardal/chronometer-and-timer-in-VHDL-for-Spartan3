--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:11:39 01/11/2017
-- Design Name:   
-- Module Name:   C:/Users/Usuario/Desktop/proyectoSED/RODEDUNAI/cuenta_DHO_tb.vhd
-- Project Name:  RODEDUNAI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cuenta_DHO
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
 
ENTITY cuenta_DHO_tb IS
END cuenta_DHO_tb;
 
ARCHITECTURE behavioral OF cuenta_DHO_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cuenta_DHO
    PORT(
         clk : IN  std_logic;
         clr_n : IN  std_logic;
			reinicio: in std_logic;
         up : IN  std_logic;
         load_N : IN  std_logic;
         LAP : IN  std_logic;
         CE_N : IN  std_logic;
			Select1 : IN  std_logic;
         Select2 : IN  std_logic;
			Select3 : IN  std_logic;
         IN_DIG1 : IN  std_logic_vector(3 downto 0);
         IN_DIG2 : IN  std_logic_vector(3 downto 0);
         IN_DIG3 : IN  std_logic_vector(3 downto 0);
         IN_DIG4 : IN  std_logic_vector(3 downto 0);
         DIGITO1 : OUT  std_logic_vector(3 downto 0);
         DIGITO2 : OUT  std_logic_vector(3 downto 0);
         DIGITO3 : OUT  std_logic_vector(3 downto 0);
         DIGITO4 : OUT  std_logic_vector(3 downto 0);
         FINAL : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal clr_n : std_logic := '1';
	signal reinicio: std_logic:='0';
   signal up : std_logic := '0';
   signal load_N : std_logic := '1';
   signal LAP : std_logic := '0';
   signal CE_N : std_logic := '0';
	signal Select1 : std_logic := '1';
   signal Select2 : std_logic := '0';
	signal Select3 : std_logic := '0';
   signal IN_DIG1 : std_logic_vector(3 downto 0) := X"7";
   signal IN_DIG2 : std_logic_vector(3 downto 0) := X"0";
   signal IN_DIG3 : std_logic_vector(3 downto 0) := X"0";
   signal IN_DIG4 : std_logic_vector(3 downto 0) := X"0";

 	--Outputs
   signal DIGITO1 : std_logic_vector(3 downto 0);
   signal DIGITO2 : std_logic_vector(3 downto 0);
   signal DIGITO3 : std_logic_vector(3 downto 0);
   signal DIGITO4 : std_logic_vector(3 downto 0);
   signal FINAL : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cuenta_DHO PORT MAP (
          clk => clk,
          clr_n => clr_n,
			 reinicio => reinicio,
          up => up,
          load_N => load_N,
          LAP => LAP,
          CE_N => CE_N,
			 Select1 => Select1,
          Select2 => Select2,
			 Select3 => Select3,
          IN_DIG1 => IN_DIG1,
          IN_DIG2 => IN_DIG2,
          IN_DIG3 => IN_DIG3,
          IN_DIG4 => IN_DIG4,
          DIGITO1 => DIGITO1,
          DIGITO2 => DIGITO2,
          DIGITO3 => DIGITO3,
          DIGITO4 => DIGITO4,
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
  wait for 200 ns;
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