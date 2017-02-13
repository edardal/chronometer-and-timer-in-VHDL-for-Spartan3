--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:31:29 01/19/2017
-- Design Name:   
-- Module Name:   C:/Users/asus1/Desktop/RODEDUNAI_copia_PRUEBAS/divisor_frec_tb.vhd
-- Project Name:  RODEDUNAI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: divisor_frec
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
 
ENTITY divisor_frec_tb IS
END divisor_frec_tb;
 
ARCHITECTURE behavior OF divisor_frec_tb IS
    COMPONENT divisor_frec
    PORT(
        entrada : IN  std_logic;
        reset   : IN  std_logic;
        salida  : OUT std_logic
    );
    END COMPONENT;
 
    -- Inputs
    signal entrada : std_logic := '0';
    signal reset   : std_logic := '0';
    -- Outputs
    signal salida  : std_logic;
    constant entrada_t : time := 20 ns; 
BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: divisor_frec PORT MAP (
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
    stim_proc: process
    begin
        reset <= '1'; 
        wait for 100 ns;
        reset <= '0'; 
        wait;
    end process;
END;