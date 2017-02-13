--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:17:15 01/19/2017
-- Design Name:   
-- Module Name:   C:/Users/asus1/Desktop/RODEDUNAI_copia_PRUEBAS/clk200Hz_tb.vhd
-- Project Name:  RODEDUNAI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: clk200Hz
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
 
ENTITY clk200Hz_tb IS
END clk200Hz_tb;
 
ARCHITECTURE behavior OF clk200Hz_tb IS
    COMPONENT clk200Hz
    PORT(
        entrada : IN  std_logic;
        reset   : IN  std_logic;
        salida  : OUT std_logic
    );
    END COMPONENT;
 
    -- Inputs
    signal entrada : std_logic := '0';
    signal reset   : std_logic := '1';
    -- Outputs
    signal salida  : std_logic;
    constant entrada_t : time := 20 ns; 
BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: clk200Hz PORT MAP (
        entrada => entrada,
        reset   => reset,
        salida  => salida
    );
 
    -- Clock period definitions
    entrada_process :process
        begin
        entrada <= '0';
        wait for entrada_t / 2;
        entrada <= '1';
        wait for entrada_t / 2;
    end process;
 
    -- Stimulus process
    stim_proc: process --100 ms en la simulacion
begin
        reset <= '1';
        wait for 100 ns;
        reset <= '0'; 
        wait;
    end process;
END;