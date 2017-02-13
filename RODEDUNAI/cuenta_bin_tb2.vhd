--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:21:54 01/09/2017
-- Design Name:   
-- Module Name:   C:/Users/asus1/Desktop/proyectoSED/RODEDUNAI/cuenta_bin_tb2.vhd
-- Project Name:  RODEDUNAI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cuenta_bin
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
 
ENTITY cuenta_bin_tb2 IS
END cuenta_bin_tb2;
 
ARCHITECTURE behavior OF cuenta_bin_tb2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cuenta_bin
    PORT(
         CLR_N : IN  std_logic;
         CLK : IN  std_logic;
         UP : IN  std_logic;
         J0 : IN  std_logic_vector(3 downto 0);
         J1 : IN  std_logic_vector(3 downto 0);
         J2 : IN  std_logic_vector(3 downto 0);
         J3 : IN  std_logic_vector(3 downto 0);
         LAP : IN  std_logic;
         CE_N : IN  std_logic;
         LOAD_N : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0);
         Q0 : OUT  std_logic_vector(3 downto 0);
         Q1 : OUT  std_logic_vector(3 downto 0);
         Q2 : OUT  std_logic_vector(3 downto 0);
         Q3 : OUT  std_logic_vector(3 downto 0);
         led_parpadeante : OUT  std_logic;
        );
    END COMPONENT;
    

   --Inputs
   signal CLR_N : std_logic := '0';
   signal CLK : std_logic := '0';
   signal UP : std_logic := '0';
   signal J0 : std_logic_vector(3 downto 0) := (others => '0');
   signal J1 : std_logic_vector(3 downto 0) := (others => '1');
   signal J2 : std_logic_vector(3 downto 0) := (others => '1');
   signal J3 : std_logic_vector(3 downto 0) := (others => '1');
   signal LAP : std_logic := '0';
   signal CE_N : std_logic := '0';
   signal LOAD_N : std_logic := '1';

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);
   signal Q0 : std_logic_vector(3 downto 0);
   signal Q1 : std_logic_vector(3 downto 0);
   signal Q2 : std_logic_vector(3 downto 0);
   signal Q3 : std_logic_vector(3 downto 0);
   signal led_parpadeante : std_logic;
  

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cuenta_bin PORT MAP (
          CLR_N => CLR_N,
          CLK => CLK,
          UP => UP,
          J0 => J0,
          J1 => J1,
          J2 => J2,
          J3 => J3,
          LAP => LAP,
          CE_N => CE_N,
          LOAD_N => LOAD_N,
          Q => Q,
          Q0 => Q0,
          Q1 => Q1,
          Q2 => Q2,
          Q3 => Q3,
          led_parpadeante => led_parpadeante
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

 -- Stimulus process
   stim_proc: process
   begin		
  CLR_N<='0';
  wait for 20 ns;
  CLR_N<='1';
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
  wait for 150 ns;
  assert false
  report "fin de la simulacion."
  severity failure;
  
   end process;

END;
