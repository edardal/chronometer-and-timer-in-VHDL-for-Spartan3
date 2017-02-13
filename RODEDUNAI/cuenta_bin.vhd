----------------------------------------------------------------------------------
--- Company: RODEDUNAI
-- Engineer: ARCONES DEL ÁLAMO, EDUARDO
--				 DE LA FUENTE PABLO, NAIPI 
--				 JEREZ BEDON, RODRIGO
-- 
-- Create Date:    12:35:16 12/12/2016 
-- Design Name: 	 CUENTA ATRÁS
-- Module Name:    cuenta_bin - Behavioral 
-- Project Name: 	 SED PROYECT
-- Target Devices: 
-- Tool versions:  V2.1
-- Description:    ESTE MÓDULO SE ENCARGA DE LA CUENTA EN BINARIO
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
use ieee.numeric_std.all;


entity cuenta_bin is
    Port ( CLR_N : in  STD_LOGIC;
			  reinicio : in STD_LOGIC;
           CLK : in  STD_LOGIC;
           UP : in  STD_LOGIC;
           J0 : in  STD_LOGIC_VECTOR (3 downto 0);
			  J1 : in  STD_LOGIC_VECTOR (3 downto 0);
			  J2 : in  STD_LOGIC_VECTOR (3 downto 0);
           J3 : in  STD_LOGIC_VECTOR (3 downto 0);
			  Select1: in STD_LOGIC;
			  Select2: in STD_LOGIC;
			  Select3: in STD_LOGIC;
 
			  --LAP
			  LAP: in STD_LOGIC;
           CE_N : in  STD_LOGIC;
			  LOAD_N : in STD_LOGIC;
			  Q : out  STD_LOGIC_VECTOR (3 downto 0);
			  Q0 : out  STD_LOGIC_VECTOR (3 downto 0);
			  Q1 : out  STD_LOGIC_VECTOR (3 downto 0);
			  Q2 : out  STD_LOGIC_VECTOR (3 downto 0);
			  Q3 : out  STD_LOGIC_VECTOR (3 downto 0);
			  led_parpadeante: out STD_LOGIC
			  );
end cuenta_bin;

architecture Behavioral of cuenta_bin is
 
begin 
 process (CLR_N, CLK, LOAD_N, J0, J1, J2, J3,Select1,Select2,Select3)
   variable q0_i: STD_LOGIC_VECTOR(3 downto 0) := "0000";
  variable q1_i: STD_LOGIC_VECTOR(3 downto 0) := "0000";
  variable q2_i: STD_LOGIC_VECTOR(3 downto 0) := "0000";
  variable q3_i: STD_LOGIC_VECTOR(3 downto 0) := "0000";
  variable vector: UNSIGNED(3 downto 0);
  variable q_i: UNSIGNED(3 downto 0);
  variable led: STD_LOGIC;


begin

		if CLR_N = '1' or reinicio='1' then					
			q0_i := (others => '0');
			q1_i := (others => '0');
			q2_i := (others => '0');
			q3_i := (others => '0');
			vector := (others => '0');
			q_i := (others => '0');
			led := '0';
			Q0<=q0_i;	
			Q1<=q1_i;
			Q2<=q2_i;
			Q3<=q3_i;
			Q<=std_logic_vector(vector);
			led_parpadeante<=led;


		elsif clk'event and clk='1' then

			
			if (Select1='0' and Select2='0' and Select3='0') or (Select1='0' and Select2='0' and Select3='1') then 
				
				
				if CE_N='0' then					
					if LOAD_N = '0' then			
						vector:=J3(0)&J2(0)&J1(0)&J0(0);
						q0_i :=J0;
						q1_i :=J1;
						q2_i :=J2;
						q3_i :=J3;
					elsif UP = '1' then
						if vector/="1111" then			--**
							led:='0';
							vector := vector+1;
							q0_i :="000"& vector(0);	
							q1_i :="000"& vector(1);
							q2_i :="000"& vector(2);
							q3_i :="000"& vector(3);	
						else
		
							led:='1';
						end if;								--**
			
					else
          
						if vector/="0000" then		--*
							led:='0';
							vector := vector-1;
							q_i:=vector;
							q0_i :="000"& vector(0);	
							q1_i :="000"& vector(1);
							q2_i :="000"& vector(2);
							q3_i :="000"& vector(3);		
						else
							led:='1';
						end if;							--*
			
					end if;							--**
						Q0 <= q0_i;																		--2º Donde se hace la asignación de las salidas se hace aquí, al final del if CE_N='0', para que 
						Q1 <= q1_i;																		--se muestre en los displays solo los números contando, si el LAP está activado, al estar aquí la asignación
						Q2 <= q2_i;																		--dentro de este if, se queda en el display el 13 por ejemplo hasta que se desactive y retome el valor que 
						Q3 <= q3_i;																	--está contando internamente. 
						led_parpadeante<=led;
						Q<= std_logic_vector(vector);
				elsif LAP='1' and CE_N='1' then --------------------------------- 1ºPara empezar creamos este elsif, donde copiamos el codigo de arriba asi sigue contando aunque este parado
																									--y  aqui no se hace nada mas		
					if LOAD_N = '0' then			
						vector:=J3(3)&J2(2)&J1(1)&J0(0);
						q0_i :="000"& vector(0);	
						q1_i :="000"& vector(1);
						q2_i :="000"& vector(2);
						q3_i :="000"& vector(3);	
					elsif UP = '1' then
						if vector/="1111" then
							led:='0';
							vector := vector+1;
							q0_i :="000"& vector(0);	
							q1_i :="000"& vector(1);
							q2_i :="000"& vector(2);
							q3_i :="000"& vector(3);	
						else
		
							led:='1';
						end if;
				
					else
          
						if vector/="0000" then
							led:='0';
							vector := vector-1;
							q_i:=vector;
							q0_i :="000"& vector(0);	
							q1_i :="000"& vector(1);
							q2_i :="000"& vector(2);
							q3_i :="000"& vector(3);		
						else
							led:='1';
						end if;
			
					end if;
				end if;
			end if;									
		end if;									
	end process;
  
end behavioral;