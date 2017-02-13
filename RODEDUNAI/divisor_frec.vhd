----------------------------------------------------------------------------------
-- Company: RODEDUNAI
-- Engineer: ARCONES DEL ÁLAMO, EDUARDO
--				 DE LA FUENTE PABLO, NAIPI 
--				 JEREZ BEDON, RODRIGO
--
-- Create Date:    12:36:47 12/12/2016 
-- Design Name:    CUENTA ATRAS
-- Module Name:    divisor_frec - Behavioral 
-- Project Name: 	 SED PROYECT
-- Target Devices: 
-- Tool versions: V2.1
-- Description:    ESTE MÓDULO SE ENCARGA DE OBTENER UN CLK CON UNA FRECUENCIA DE 1Hz==>1 segundo
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

entity divisor_frec is
    Port (
        entrada: in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        salida : out STD_LOGIC
    );
end divisor_frec;

architecture Behavioral of divisor_frec is
    signal temporal: STD_LOGIC;
    signal contador: integer range 0 to 24999999 := 0;
begin
    divisor_frecuencia: process (reset, entrada) begin
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