----------------------------------------------------------------------------------
-- Company: RODEDUNAI
-- Engineer: ARCONES DEL ÁLAMO, EDUARDO
--				 DE LA FUENTE PABLO, NAIPI 
--				 JEREZ BEDON, RODRIGO
--
-- Create Date:    12:36:08 12/12/2016 
-- Design Name: 	 CUENTA ATRAS
-- Module Name:    cronometro - Behavioral 
-- Project Name: 	 SED PROYECT	
-- Target Devices: 
-- Tool versions: V2.1
-- Description: 	ESTE MÓDULO SE ENCARGA DE REALIZAR LA CUENTA EN SEXAGESIMAL
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;


entity cronometro is
    Port ( clk : in  STD_LOGIC;
           clr_n : in  STD_LOGIC;
			  reinicio : in STD_LOGIC;
			  lap : in STD_LOGIC;
			  ce_n : IN STD_LOGIC;
			  up  : in  STD_LOGIC;
			  load_N : in STD_LOGIC;
			  Select1: in STD_LOGIC;
			  Select2: in STD_LOGIC;
			  Select3: in STD_LOGIC;
				IN_SEG0: In std_logic_vector(3 downto 0);
				IN_SEG1: In std_logic_vector(3 downto 0);
				IN_MIN0: In std_logic_vector(3 downto 0);
				IN_MIN1: In std_logic_vector(3 downto 0);
			
			  
				Segundo0   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);  --Primer digito de los segundos.
				Segundo1   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); --Segundo digito de los segundos.
				
				Minuto0   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); --Primer digito del minuto.
				Minuto1   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); --Segundo digito del minuto.
				FINAL		 : OUT STD_LOGIC				--LLEGADA A FINAL
	);
end cronometro;

architecture Behavioral of cronometro is

begin
 process (clk, clr_n,Select1,Select2,Select3)

	variable segundero0: UNSIGNED(3 downto 0);
	variable segundero1: UNSIGNED(3 downto 0);
	
	variable minutero0: UNSIGNED(3 downto 0);
	variable minutero1: UNSIGNED(3 downto 0);
	variable fin : std_logic := '0'; 
 begin
			fin:='0';
 			if  clr_n = '1' OR reinicio='1' then
				minutero1 := (others => '0');
				minutero0 := (others => '0');
				segundero1 := (others => '0');
				segundero0 := (others => '0');
				fin := '0';
				Segundo0 <= STD_LOGIC_VECTOR(segundero0);
				Segundo1 <= STD_LOGIC_VECTOR(segundero1);
	
				Minuto0 <= STD_LOGIC_VECTOR(minutero0);
				Minuto1 <= STD_LOGIC_VECTOR(minutero1);
				Final<= fin;
			elsif clk'event and clk='1' then
					
					
					if (Select1='0' and Select2='1' and Select3='0') or (Select1='0' and Select2='1' and Select3='1') then 	
						
						if CE_N='0' then
							if load_N = '0' then 
								segundero0 := unsigned(IN_SEG0);
								segundero1 := unsigned(IN_SEG1);
								minutero0 := unsigned(IN_MIN0);
								minutero1 := unsigned(IN_MIN1);
			
						elsif up = '1' then --CUENTA HACIA ALANTE 
			--CUENTA HACIA ALANTE 
					--XXXX==>XXX(X+1)
				
					--5X:XX
					if minutero1 = "0101" then
					
						-- 59:XX
						if minutero0= "1001" then

							
							--59:5X
							if segundero1="0101" then
								
											--59:59==>59:59
								if segundero0="1001" then
									minutero1:= "0101";
									minutero0:="1001";
									segundero1:= "0101";
									segundero0:= "1001";
									fin:='1';
								
											--59:5X==>59:5(X+1)
								else
									segundero0 := segundero0+1;
									segundero1 :="0101";
									minutero0 :="1001";
									minutero1 :="0101";
								end if;	
							
							--59:XQ
							else
											--59:X9==>59:(X+1)0
								if segundero0="1001" then
									segundero0:= "0000";
									segundero1:= segundero1+1;
									minutero0 :="1001";
									minutero1 :="0101";
											--59:XX==>59:X(X+1);
								else
									segundero0:=segundero0+1;
									segundero1 :=segundero1;
									minutero0 :="1001";
									minutero1 :="0101";
								end if;
									
							end if;
						
						--5:XQQ
						else
							--5X:5Q
							if segundero1="0101" then
											--5X:59==>5(X+1):00
								if segundero0="1001" then
									minutero1:= "0101";
									minutero0:= minutero0+1;
									segundero1:= "0000";
									segundero0:= "0000";
								
											--5X:5X==>5X:5(X+1)
								else
									segundero0 := segundero0+1;
									segundero1 :="0101";
									minutero0 :=minutero0;
									minutero1 :="0101";
								end if;	
							
							--5X:XQ
							else
											--5X:X9==>5X:(X+1)0
								if segundero0="1001" then
									segundero0:= "0000";
									segundero1:= segundero1+1;
									minutero0 :=minutero0;
									minutero1 :="0101";
										--5X:XX==>5X:X(X+1);
								else
									segundero0:=segundero0+1;
									segundero1 :=segundero1;
									minutero0 :=minutero0;
									minutero1 :="0101";
								end if;
									
							end if;
						end if;
					
					--XQ:QQ	
					else
						-- X9:XX
						if minutero0= "1001" then

							
							--X9:5X
							if segundero1="0101" then
								
											--X9:59==>(x+1)000
								if segundero0="1001" then
									minutero1:= minutero1+1;
									minutero0:= "0000";
									segundero1:= "0000";
									segundero0:= "0000";
								
											--X9:5X==>X9:5(X+1)
								else
									segundero0 := segundero0+1;
									segundero1 :="0101";
									minutero0 :="1001";
									minutero1 :=minutero1;
								end if;	
							
							--X9:XQ
							else
											--X9:X9==>X9:(X+1)0
								if segundero0="1001" then
									segundero0:= "0000";
									segundero1:= segundero1+1;
									minutero0 :="1001";
									minutero1 :=minutero1;
											--X9:XX==>X9:X(X+1);
								else
									segundero0:=segundero0+1;
									segundero1 :=segundero1;
									minutero0 :="1001";
									minutero1 :=minutero1;
								end if;
									
							end if;
						
						--XX:QQ
						else
							--XX:5Q
							if segundero1="0101" then
											--XX:59==>X(X+1):00
								if segundero0="1001" then
									minutero1:= minutero1;
									minutero0:= minutero0+1;
									segundero1:= "0000";
									segundero0:= "0000";
								
											--XX:5X==>XX:5(X+1)
								else
									segundero0 := segundero0+1;
									segundero1 :="0101";
									minutero0 :=minutero0;
									minutero1 :=minutero1;
								end if;	
							
							--XX:XQ
							else
											--XX:X9==>XX:(X+1)0
								if segundero0="1001" then
									segundero0:= "0000";
									segundero1:= segundero1+1;
									minutero0 :=minutero0;
									minutero1 :=minutero1;
										--XX:XX==>XX:X(X+1);
								else
									segundero0:=segundero0+1;
									segundero1 :=segundero1;
									minutero0 :=minutero0;
									minutero1 :=minutero1;
								end if;
									
							end if;
						end if;						
									
					end if;
			
			
					--CUENTA HACIA ATRAS
					else
						--XX:XX==>XX:X(X-1)
				
					--0X:XX
					if minutero1 = 0 then
					
						-- 00:XX
						if minutero0= 0 then

							
							--00:0X
							if segundero1=0 then
								
											--00:00==>00:00
								if segundero0=0 then
									minutero1:= "0000";
									minutero0:= "0000";
									segundero1:= "0000";
									segundero0:= "0000";
									fin:='1';
								
											--00:0X==>00:0(X-1)
								else
									segundero0 := segundero0-1;
									segundero1 :="0000";
									minutero0 :="0000";
									minutero1 :="0000";
								end if;	
							
							--00:XQ
							else
											--00:X0==>00:(X-1)9
								if segundero0=0 then
									segundero0:= "1001";
									segundero1:= segundero1-1;
									minutero0 :="0000";
									minutero1 :="0000";
											--00:XX==>00:X(X-1);
								else
									segundero0:=segundero0-1;
									segundero1 :=segundero1;
									minutero0 :="0000";
									minutero1 :="0000";
								end if;
									
							end if;
						
						--0X:QQ
						else
							--0X:0Q
							if segundero1=0 then
											--0X:00==>0(X-1):59
								if segundero0=0 then
									minutero1:= "0000";
									minutero0:= minutero0-1;
									segundero1:= "0101";
									segundero0:= "1001";
								
											--0X:0X==>0X:0(X-1)
								else
									segundero0 := segundero0-1;
									segundero1 :="0000";
									minutero0 := minutero0;
									minutero1 :="0000";
								end if;	
							
							--0X:XQ
							else
											--0X:X0==>0X:(X-1)9
								if segundero0=0 then
									segundero0:= "1001";
									segundero1:= segundero1-1;
									minutero0 :=minutero0;
									minutero1 :="0000";
										--0X:XX==>0X:X(X-1);
								else
									segundero0:=segundero0-1;
									segundero1 :=segundero1;
									minutero0 := minutero0;
									minutero1 :="0000";
								end if;
									
							end if;
						end if;
					--XQ:QQ	
					else
						-- X0:XX
						if minutero0= 0 then

							
							--X0:0X
							if segundero1=0 then
								
											--X0:00==>(X-1)0:00
								if segundero0=0 then
									minutero1:= minutero1-1;
									minutero0:= "0000";
									segundero1:= "0000";
									segundero0:= "0000";
								
											--X0:0X==>X0:0(X-1)
								else
									segundero0 := segundero0-1;
									segundero1 :="0000";
									minutero0 :="0000";
									minutero1 :=minutero1;
								end if;	
							
							--X0:XQ
							else
											--X0:X0==>X0:(X-1)9
								if segundero0=0 then
									segundero0:= "1001";
									segundero1:= segundero1-1;
									minutero0 :="0000";
									minutero1 :=minutero1;
											--X0:XX==>X0:X(X-1);
								else
									segundero0:=segundero0-1;
									segundero1 :=segundero1;
									minutero0 :="0000";
									minutero1 :=minutero1;
								end if;
									
							end if;
						
						--XX:QQ
						else
							--XX:0Q
							if segundero1=0 then
											--XX:00==>X(X-1):59
								if segundero0=0 then
									minutero1:= minutero1;
									minutero0:= minutero0-1;
									segundero1:= "0101";
									segundero0:= "1001";
								
											--XX:0X==>XX:0(X-1)
								else
									segundero0 := segundero0-1;
									segundero1 :="0000";
									minutero0 := minutero0;
									minutero1 :=minutero1;
								end if;	
							
							--XX:XQ
							else
											--XX:X0==>XX:(X-1)9
								if segundero0=0 then
									segundero0:= "1001";
									segundero1:= segundero1-1;
									minutero0 :=minutero0;
									minutero1 :=minutero1;
										--XX:XX==>XX:X(X-1);
								else
									segundero0:=segundero0-1;
									segundero1 :=segundero1;
									minutero0 := minutero0;
									minutero1 :=minutero1;
								end if;
							end if;	
						end if;						
									
					end if;
				end if;
			
					--Asignación de señales.
					Segundo0 <= STD_LOGIC_VECTOR(segundero0);
					Segundo1 <= STD_LOGIC_VECTOR(segundero1);
	
					Minuto0 <= STD_LOGIC_VECTOR(minutero0);
					Minuto1 <= STD_LOGIC_VECTOR(minutero1);
					FINAL <= fin;
				
				elsif LAP='1' and CE_N='1' then
			
					if load_N = '0' then 
						segundero0 := unsigned(IN_SEG0);
						segundero1 := unsigned(IN_SEG1);
						minutero0 := unsigned(IN_MIN0);
						minutero1 := unsigned(IN_MIN1);
			
					elsif up = '1' then
			--CUENTA HACIA ALANTE 
					--XXXX==>XXX(X+1)
				
					--5X:XX
					if minutero1 = "0101" then
					
						-- 59:XX
						if minutero0= "1001" then

							
							--59:5X
							if segundero1="0101" then
								
											--59:59==>59:59
								if segundero0="1001" then
									minutero1:= "0101";
									minutero0:="1001";
									segundero1:= "0101";
									segundero0:= "1001";
									fin:='1';
								
											--59:5X==>59:5(X+1)
								else
									segundero0 := segundero0+1;
									segundero1 :="0101";
									minutero0 :="1001";
									minutero1 :="0101";
								end if;	
							
							--59:XQ
							else
											--59:X9==>59:(X+1)0
								if segundero0="1001" then
									segundero0:= "0000";
									segundero1:= segundero1+1;
									minutero0 :="1001";
									minutero1 :="0101";
											--59:XX==>59:X(X+1);
								else
									segundero0:=segundero0+1;
									segundero1 :=segundero1;
									minutero0 :="1001";
									minutero1 :="0101";
								end if;
									
							end if;
						
						--5:XQQ
						else
							--5X:5Q
							if segundero1="0101" then
											--5X:59==>5(X+1):00
								if segundero0="1001" then
									minutero1:= "0101";
									minutero0:= minutero0+1;
									segundero1:= "0000";
									segundero0:= "0000";
								
											--5X:5X==>5X:5(X+1)
								else
									segundero0 := segundero0+1;
									segundero1 :="0101";
									minutero0 :=minutero0;
									minutero1 :="0101";
								end if;	
							
							--5X:XQ
							else
											--5X:X9==>5X:(X+1)0
								if segundero0="1001" then
									segundero0:= "0000";
									segundero1:= segundero1+1;
									minutero0 :=minutero0;
									minutero1 :="0101";
										--5X:XX==>5X:X(X+1);
								else
									segundero0:=segundero0+1;
									segundero1 :=segundero1;
									minutero0 :=minutero0;
									minutero1 :="0101";
								end if;
									
							end if;
						end if;
					
					--XQ:QQ	
					else
						-- X9:XX
						if minutero0= "1001" then

							
							--X9:5X
							if segundero1="0101" then
								
											--X9:59==>(x+1)000
								if segundero0="1001" then
									minutero1:= minutero1+1;
									minutero0:= "0000";
									segundero1:= "0000";
									segundero0:= "0000";
								
											--X9:5X==>X9:5(X+1)
								else
									segundero0 := segundero0+1;
									segundero1 :="0101";
									minutero0 :="1001";
									minutero1 :=minutero1;
								end if;	
							
							--X9:XQ
							else
											--X9:X9==>X9:(X+1)0
								if segundero0="1001" then
									segundero0:= "0000";
									segundero1:= segundero1+1;
									minutero0 :="1001";
									minutero1 :=minutero1;
											--X9:XX==>X9:X(X+1);
								else
									segundero0:=segundero0+1;
									segundero1 :=segundero1;
									minutero0 :="1001";
									minutero1 :=minutero1;
								end if;
									
							end if;
						
						--XX:QQ
						else
							--XX:5Q
							if segundero1="0101" then
											--XX:59==>X(X+1):00
								if segundero0="1001" then
									minutero1:= minutero1;
									minutero0:= minutero0+1;
									segundero1:= "0000";
									segundero0:= "0000";
								
											--XX:5X==>XX:5(X+1)
								else
									segundero0 := segundero0+1;
									segundero1 :="0101";
									minutero0 :=minutero0;
									minutero1 :=minutero1;
								end if;	
							
							--XX:XQ
							else
											--XX:X9==>XX:(X+1)0
								if segundero0="1001" then
									segundero0:= "0000";
									segundero1:= segundero1+1;
									minutero0 :=minutero0;
									minutero1 :=minutero1;
										--XX:XX==>XX:X(X+1);
								else
									segundero0:=segundero0+1;
									segundero1 :=segundero1;
									minutero0 :=minutero0;
									minutero1 :=minutero1;
								end if;
									
							end if;
						end if;						
									
					end if;
			
			
					--CUENTA HACIA ATRAS
					else
						--XX:XX==>XX:X(X-1)
				
					--0X:XX
					if minutero1 = 0 then
					
						-- 00:XX
						if minutero0= 0 then

							
							--00:0X
							if segundero1=0 then
								
											--00:00==>00:00
								if segundero0=0 then
									minutero1:= "0000";
									minutero0:= "0000";
									segundero1:= "0000";
									segundero0:= "0000";
									fin:='1';
								
											--00:0X==>00:0(X-1)
								else
									segundero0 := segundero0-1;
									segundero1 :="0000";
									minutero0 :="0000";
									minutero1 :="0000";
								end if;	
							
							--00:XQ
							else
											--00:X0==>00:(X-1)9
								if segundero0=0 then
									segundero0:= "1001";
									segundero1:= segundero1-1;
									minutero0 :="0000";
									minutero1 :="0000";
											--00:XX==>00:X(X-1);
								else
									segundero0:=segundero0-1;
									segundero1 :=segundero1;
									minutero0 :="0000";
									minutero1 :="0000";
								end if;
									
							end if;
						
						--0X:QQ
						else
							--0X:0Q
							if segundero1=0 then
											--0X:00==>0(X-1):59
								if segundero0=0 then
									minutero1:= "0000";
									minutero0:= minutero0-1;
									segundero1:= "0101";
									segundero0:= "1001";
								
											--0X:0X==>0X:0(X-1)
								else
									segundero0 := segundero0-1;
									segundero1 :="0000";
									minutero0 := minutero0;
									minutero1 :="0000";
								end if;	
							
							--0X:XQ
							else
											--0X:X0==>0X:(X-1)9
								if segundero0=0 then
									segundero0:= "1001";
									segundero1:= segundero1-1;
									minutero0 :=minutero0;
									minutero1 :="0000";
										--0X:XX==>0X:X(X-1);
								else
									segundero0:=segundero0-1;
									segundero1 :=segundero1;
									minutero0 := minutero0;
									minutero1 :="0000";
								end if;
									
							end if;
						end if;
					--XQ:QQ	
					else
						-- X0:XX
						if minutero0= 0 then

							
							--X0:0X
							if segundero1=0 then
								
											--X0:00==>(X-1)0:00
								if segundero0=0 then
									minutero1:= minutero1-1;
									minutero0:= "0000";
									segundero1:= "0000";
									segundero0:= "0000";
								
											--X0:0X==>X0:0(X-1)
								else
									segundero0 := segundero0-1;
									segundero1 :="0000";
									minutero0 :="0000";
									minutero1 :=minutero1;
								end if;	
							
							--X0:XQ
							else
											--X0:X0==>X0:(X-1)9
								if segundero0=0 then
									segundero0:= "1001";
									segundero1:= segundero1-1;
									minutero0 :="0000";
									minutero1 :=minutero1;
											--X0:XX==>X0:X(X-1);
								else
									segundero0:=segundero0-1;
									segundero1 :=segundero1;
									minutero0 :="0000";
									minutero1 :=minutero1;
								end if;
									
							end if;
						
						--XX:QQ
						else
							--XX:0Q
							if segundero1=0 then
											--XX:00==>X(X-1):59
								if segundero0=0 then
									minutero1:= minutero1;
									minutero0:= minutero0-1;
									segundero1:= "0101";
									segundero0:= "1001";
								
											--XX:0X==>XX:0(X-1)
								else
									segundero0 := segundero0-1;
									segundero1 :="0000";
									minutero0 := minutero0;
									minutero1 :=minutero1;
								end if;	
							
							--XX:XQ
							else
											--XX:X0==>XX:(X-1)9
								if segundero0=0 then
									segundero0:= "1001";
									segundero1:= segundero1-1;
									minutero0 :=minutero0;
									minutero1 :=minutero1;
										--XX:XX==>XX:X(X-1);
								else
									segundero0:=segundero0-1;
									segundero1 :=segundero1;
									minutero0 := minutero0;
									minutero1 :=minutero1;
								end if;
							end if;	
						end if;
					end if;
				end if;
			end if;
		end if;
	end if;
end process;
	


end Behavioral;


