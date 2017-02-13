----------------------------------------------------------------------------------
-- Company: RODEDUNAI
-- Engineer: ARCONES DEL ÁLAMO, EDUARDO
--				 DE LA FUENTE PABLO, NAIPI 
--				 JEREZ BEDON, RODRIGO
--
-- Create Date:    12:27:54 12/12/2016 
-- Design Name: 	 CUENTA ATRAS
-- Module Name:    decoder - dataflow 
-- Project Name: 	 SED PROYECT
-- Target Devices: 
-- Tool versions:  V2.1
-- Description:    ESTE MODULO SE ENCARGA DE DECODICAR LOS 4 BITS DE CADA NUMERO A 7 BITS PARA LOS DISPLAYS
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
use IEEE.NUMERIC_STD.ALL;


entity decoder7seg is
	port(
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		

		
		entrada: IN STD_LOGIC_VECTOR(3 downto 0);
		salida: OUT STD_LOGIC_VECTOR(7 downto 0)

	);
end decoder7seg;

architecture Behavioral of decoder7seg is

begin
	process(entrada) begin
		case entrada is
		
		-- CORRESPONDENCIA 7SEG(DE ARRIBA A ABAJO)
		--BIT 7 DE SALIDA=>PUNTO 
		--BIT 6 DE SALIDA==> 4
		--BIT 5 DE SALIDA==> 2
		--BIT 4 DE SALIDA==> 5
		--BIT 3 DE SALIDA==> 7
		--BIT 2 DE SALIDA==> 6
		--BIT 1 DE SALIDA==> 3
		--BIT 0 DE SALIDA==> 1
			when "0000" =>	 salida <= x"03";  -- 0
			when "0001" =>  salida <= x"9F"; -- 1
         when "0010" =>  salida <= x"25"; -- 2
         when "0011" =>  salida <= x"0D"; -- 3
         when "0100" =>  salida <= x"99"; -- 4
         when "0101" =>  salida <= x"49"; -- 5
         when "0110" =>  salida <= x"41"; -- 6
         when "0111" =>  salida <= x"1F"; -- 7
         when "1000" =>  salida <= x"01"; -- 8
         when "1001" =>  salida <= x"19"; -- 9
         when "1010" =>  salida <= x"11"; -- A
         when "1011" =>  salida <= x"C1"; -- B
         when "1100" =>  salida <= x"63"; -- C
         when "1101" =>  salida <= x"85"; -- D
         when "1110" =>  salida <= x"61"; -- E
         when "1111" =>  salida <= x"71"; -- F
			when others =>  salida <= x"FE"; -- Nada
		
		end case;
	end process;
end Behavioral;

