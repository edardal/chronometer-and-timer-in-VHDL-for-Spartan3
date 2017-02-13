----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:48:57 01/16/2017 
-- Design Name: 
-- Module Name:    divisor_frec_botones - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divisor_frec_botones is
    Port (
        entrada: in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        salida : out STD_LOGIC
    );
end divisor_frec_botones;

architecture Behavioral of divisor_frec_botones is
    signal temporal: STD_LOGIC;
    signal contador: integer range 0 to 249999 := 0;
begin
 process (reset, entrada) begin
        if (reset = '1') then
            temporal <= '0';
            contador <= 0;
        elsif entrada'event and entrada='1' then
            if (contador = 24999999) then
                temporal <= NOT(temporal);
                contador <= 0;
            else
                contador <= contador+1;
            end if;
        end if;
    end process;
 
    salida <= temporal;
end Behavioral;