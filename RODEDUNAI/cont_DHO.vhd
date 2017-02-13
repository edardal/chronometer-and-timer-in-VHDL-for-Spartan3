----------------------------------------------------------------------------------
-- Company: RODEDUNAI
-- Engineer: ARCONES DEL ÁLAMO, EDUARDO
--				 DE LA FUENTE PABLO, NAIPI 
--				 JEREZ BEDON, RODRIGO
--
-- Create Date:    15:47:37 12/28/2016 
-- Design Name:    CUENTA ATRAS
-- Module Name:    cuenta_dec - Behavioral 
-- Project Name: 	 SED PROYECT
-- Target Devices: 
-- Tool versions:  V2.1
-- Description: 	 ESTE MÓDULO SE ENCARGA DE LA CUENTA EN DECIMAL, OCTAL Y HEXADECIMAL
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


entity cuenta_DHO is
    Port (  clk : in  STD_LOGIC;
				clr_n: in STD_LOGIC;
			   up : in  STD_LOGIC;
			   load_N : in STD_LOGIC;
				reinicio : in STD_LOGIC;
				LAP: in STD_LOGIC;
			   CE_N : in  STD_LOGIC;
				Select1: in STD_LOGIC;
			   Select2: in STD_LOGIC;
			   Select3: in STD_LOGIC;
				IN_DIG1: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				IN_DIG2: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				IN_DIG3: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				IN_DIG4: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				
				DIGITO1   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);  --Primer digito 
				DIGITO2   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); --Segundo digito 
				
				DIGITO3   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); --tercer digito
				DIGITO4   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); --cuarto digito
				FINAL		 : OUT STD_LOGIC				--LLEGADA A FINAL
	);
end cuenta_DHO;

architecture Behavioral of cuenta_DHO is
	
begin
 process (clk, clr_n,Select1) 
		variable num1: UNSIGNED(3 downto 0);
		variable num2: UNSIGNED(3 downto 0);
	
		variable num3: UNSIGNED(3 downto 0);
		variable num4: UNSIGNED(3 downto 0);
		variable maximo: UNSIGNED(3 downto 0);
		variable fin : std_logic:='0' ;
		
begin
			fin:='0';
 			if  clr_n = '1'  or reinicio='1' then
				num4 := (others => '0');
				num3 := (others => '0');
				num2 := (others => '0');
				num1 := (others => '0');
				fin := '0';

				Digito1 <= STD_LOGIC_VECTOR(num1);
				Digito2 <= STD_LOGIC_VECTOR(num2);
	
				Digito3 <= STD_LOGIC_VECTOR(num3);
				Digito4 <= STD_LOGIC_VECTOR(num4);
				Final<= fin;
			elsif clk'event and clk='1' then

			if select1='1' then 
				if (Select1='1' and Select2='0' and Select3='1') or (select1='1' and Select2='1' and  Select3='1') then

						maximo :="1111";
				end if;	
				if (select1='1' and Select2='1' and  Select3='0') then
						maximo :="0111";
				end if;	
				if (select1='1' and Select2='0' and  Select3='0') then

						maximo :="1001";
				end if;
						
					
					
					if CE_N='0' then
						if load_N = '0' then 
							num1 := unsigned(IN_DIG1);
							num2 := unsigned(IN_DIG2);
							num3 := unsigned(IN_DIG3);
							num4 := unsigned(IN_DIG4);
			
					elsif up = '1' then --CUENTA HACIA ALANTE 
			--CUENTA HACIA ALANTE 
					--XXXX==>XXX(X+1)
				
					--MXXX
						if num4 = maximo then
					
						-- MMXX
							if num3= maximo then

							
							--MMMX
								if num2=maximo then
								
											--MMMM==>MMMM
									if num1=maximo then
										num4:= maximo;
										num3:=maximo;
										num2:= maximo;
										num1:= maximo;
										fin:='1';
								
											--MMMX==>MMM(X+1)
									else
									num1 := num1+1;
									num2 :=maximo;
									num3 :=maximo;
									num4 :=maximo;
								end if;	
							
							--MMXQ
							else
											--MMXM==>MM(X+1)0
								if num1=maximo then
									num1:= "0000";
									num2:= num2+1;
									num3 :=maximo;
									num4 :=maximo;
											--MMXX==>MMX(X+1);
								else
									num1:=num1+1;
									num2 :=num2;
									num3 :=maximo;
									num4 :=maximo;
								end if;
									
							end if;
						
						--MXQQ
						else
							--MXMQ
							if num2=maximo then
											--MXMM==>M(X+1)00
								if num1=maximo then
									num4:= maximo;
									num3:= num3+1;
									num2:= "0000";
									num1:= "0000";
								
											--MXMX==>MXM(X+1)
								else
									num1 := num1+1;
									num2 :=maximo;
									num3 :=num3;
									num4 :=maximo;
								end if;	
							
							--MXXQ
							else
											--MXXM==>MX(X+1)0
								if num1=maximo then
									num1:= "0000";
									num2:= num2+1;
									num3 :=num3;
									num4 :=maximo;
										--MXXX==>MXX(X+1);
								else
									num1:=num1+1;
									num2 :=num2;
									num3 :=num3;
									num4 :=maximo;
								end if;
									
							end if;
						end if;
					
					--XQQQ	
					else
						-- XMXX
						if num3= maximo then

							
							--XMMX
							if num2=maximo then
								
											--XMMM==>(x+1)000
								if num1=maximo then
									num4:= num4+1;
									num3:= "0000";
									num2:= "0000";
									num1:= "0000";
								
											--XMMX==>XMM(X+1)
								else
									num1 := num1+1;
									num2 :=maximo;
									num3 :=maximo;
									num4 :=num4;
								end if;	
							
							--XMXQ
							else
											--XMXM==>XM(X+1)0
								if num1=maximo then
									num1:= "0000";
									num2:= num2+1;
									num3 :=maximo;
									num4 :=num4;
											--XMXX==>XMX(X+1);
								else
									num1:=num1+1;
									num2 :=num2;
									num3 :=maximo;
									num4 :=num4;
								end if;
									
							end if;
						
						--XXQQ
						else
							--XXMQ
							if num2=maximo then
											--XXMM==>X(X+1)00
								if num1=maximo then
									num4:= num4;
									num3:= num3+1;
									num2:= "0000";
									num1:= "0000";
								
											--XXMX==>XXM(X+1)
								else
									num1 := num1+1;
									num2 :=maximo;
									num3 :=num3;
									num4 :=num4;
								end if;	
							
							--XXXQ
							else
											--XXXM==>XX(X+1)0
								if num1=maximo then
									num1:= "0000";
									num2:= num2+1;
									num3 :=num3;
									num4 :=num4;
										--XXXX==>XXX(X+1);
								else
									num1:=num1+1;
									num2 :=num2;
									num3 :=num3;
									num4 :=num4;
								end if;
									
							end if;
						end if;						
									
					end if;
			
			
					--CUENTA HACIA ATRAS
					else
						--XX:XX==>XX:X(X-1)
				
					--0X:XX
					if num4 = 0 then
					
						-- 00:XX
						if num3= 0 then

							
							--00:0X
							if num2=0 then
								
											--00:00==>00:00
								if num1=0 then
									num4:= "0000";
									num3:= "0000";
									num2:= "0000";
									num1:= "0000";
									fin:='1';
								
											--00:0X==>00:0(X-1)
								else
									num1 := num1-1;
									num2 :="0000";
									num3 :="0000";
									num4 :="0000";
								end if;	
							
							--00:XQ
							else
											--00:X0==>00:(X-1)9
								if num1=0 then
									num1:= maximo;
									num2:= num2-1;
									num3 :="0000";
									num4 :="0000";
											--00:XX==>00:X(X-1);
								else
									num1:=num1-1;
									num2 :=num2;
									num3 :="0000";
									num4 :="0000";
								end if;
									
							end if;
						
						--0X:QQ
						else
							--0X:0Q
							if num2=0 then
											--0X:00==>0(X-1):59
								if num1=0 then
									num4:= "0000";
									num3:= num3-1;
									num2:= maximo;
									num1:= maximo;
								
											--0X:0X==>0X:0(X-1)
								else
									num1 := num1-1;
									num2 :="0000";
									num3 := num3;
									num4 :="0000";
								end if;	
							
							--0X:XQ
							else
											--0X:X0==>0X:(X-1)9
								if num1=0 then
									num1:= maximo;
									num2:= num2-1;
									num3 :=num3;
									num4 :="0000";
										--0X:XX==>0X:X(X-1);
								else
									num1:=num1-1;
									num2 :=num2;
									num3 := num3;
									num4 :="0000";
								end if;
									
							end if;
						end if;
					--XQ:QQ	
					else
						-- X0:XX
						if num3= 0 then

							
							--X0:0X
							if num2=0 then
								
											--X0:00==>(X-1)0:00
								if num1=0 then
									num4:= num4-1;
									num3:= "0000";
									num2:= "0000";
									num1:= "0000";

								
											--X0:0X==>X0:0(X-1)
								else
									num1 := num1-1;
									num2 :="0000";
									num3 :="0000";
									num4 :=num4;
								end if;	
							
							--X0:XQ
							else
											--X0:X0==>X0:(X-1)9
								if num1=0 then
									num1:= maximo;
									num2:= num2-1;
									num3 :="0000";
									num4 :=num4;
											--X0:XX==>X0:X(X-1);
								else
									num1:=num1-1;
									num2 :=num2;
									num3 :="0000";
									num4 :=num4;
								end if;
									
							end if;
						
						--XX:QQ
						else
							--XX:0Q
							if num2=0 then
											--XX:00==>X(X-1):59
								if num1=0 then
									num4:= num4;
									num3:= num3-1;
									num2:= maximo;
									num1:= maximo;
								
											--XX:0X==>XX:0(X-1)
								else
									num1 := num1-1;
									num2 :="0000";
									num3 := num3;
									num4 :=num4;
								end if;	
							
							--XX:XQ
							else
											--XX:X0==>XX:(X-1)9
								if num1=0 then
									num1:= maximo;
									num2:= num2-1;
									num3 :=num3;
									num4 :="0000";
										--XX:XX==>XX:X(X-1);
								else
									num1:=num1-1;
									num2 :=num2;
									num3 := num3;
									num4 :=num4;
								end if;
							end if;	
						end if;						
									
					end if;
				end if;
			
					--Asignación de señales.
				Digito1 <= STD_LOGIC_VECTOR(num1);
				Digito2 <= STD_LOGIC_VECTOR(num2);
	
				Digito3 <= STD_LOGIC_VECTOR(num3);
				Digito4 <= STD_LOGIC_VECTOR(num4);
					FINAL <= fin;
				
				elsif LAP='1' and CE_N='1' then
			
					if load_N = '0' then 
						num1 := unsigned(IN_DIG1);
						num2 := unsigned(IN_DIG2);
						num3 := unsigned(IN_DIG3);
						num4 := unsigned(IN_DIG4);
			
					elsif up = '1' then
			--CUENTA HACIA ALANTE 
					--XXXX==>XXX(X+1)
				
					--MXXX
					if num4 = maximo then
					
						-- MMXX
						if num3= maximo then

							
							--MMMX
							if num2=maximo then
								
											--MMMM==>MMMM
								if num1=maximo then
									num4:= maximo;
									num3:=maximo;
									num2:= maximo;
									num1:= maximo;
									fin:='1';
								
											--MMMX==>MMM(X+1)
								else
									num1 := num1+1;
									num2 :=maximo;
									num3 :=maximo;
									num4 :=maximo;
								end if;	
							
							--MMXQ
							else
											--MMXM==>MM(X+1)0
								if num1=maximo then
									num1:= "0000";
									num2:= num2+1;
									num3 :=maximo;
									num4 :=maximo;
											--MMXX==>MMX(X+1);
								else
									num1:=num1+1;
									num2 :=num2;
									num3 :=maximo;
									num4 :=maximo;
								end if;
									
							end if;
						
						--MXQQ
						else
							--MXMQ
							if num2=maximo then
											--MXMM==>M(X+1)00
								if num1=maximo then
									num4:= maximo;
									num3:= num3+1;
									num2:= "0000";
									num1:= "0000";
								
											--MXMX==>MXM(X+1)
								else
									num1 := num1+1;
									num2 :=maximo;
									num3 :=num3;
									num4 :=maximo;
								end if;	
							
							--MXXQ
							else
											--MXXM==>MX(X+1)0
								if num1=maximo then
									num1:= "0000";
									num2:= num2+1;
									num3 :=num3;
									num4 :=maximo;
										--MXXX==>MXX(X+1);
								else
									num1:=num1+1;
									num2 :=num2;
									num3 :=num3;
									num4 :=maximo;
								end if;
									
							end if;
						end if;
					
					--XQQQ	
					else
						-- XMXX
						if num3= maximo then

							
							--MMMX
							if num2=maximo then
								
											--XMMM==>(x+1)000
								if num1=maximo then
									num4:= num4+1;
									num3:= "0000";
									num2:= "0000";
									num1:= "0000";

								
											--XMMX==>XMM(X+1)
								else
									num1 := num1+1;
									num2 :=maximo;
									num3 :=maximo;
									num4 :=num4;
								end if;	
							
							--XMXQ
							else
											--XMXM==>XM(X+1)0
								if num1=maximo then
									num1:= "0000";
									num2:= num2+1;
									num3 :=maximo;
									num4 :=num4;
											--XMXX==>XMX(X+1);
								else
									num1:=num1+1;
									num2 :=num2;
									num3 :=maximo;
									num4 :=num4;
								end if;
									
							end if;
						
						--XXQQ
						else
							--XXMQ
							if num2=maximo then
											--XXMM==>X(X+1)00
								if num1=maximo then
									num4:= num4;
									num3:= num3+1;
									num2:= "0000";
									num1:= "0000";
								
											--XXMX==>XXM(X+1)
								else
									num1 := num1+1;
									num2 :=maximo;
									num3 :=num3;
									num4 :=num4;
								end if;	
							
							--XXXQ
							else
											--XXXM==>XX(X+1)0
								if num1=maximo then
									num1:= "0000";
									num2:= num2+1;
									num3 :=num3;
									num4 :=num4;
										--XXXX==>XXX(X+1);
								else
									num1:=num1+1;
									num2 :=num2;
									num3 :=num3;
									num4 :=num4;
								end if;
									
							end if;
						end if;						
									
					end if;
			
			
					--CUENTA HACIA ATRAS
					else
						--XX:XX==>XX:X(X-1)
				
					--0X:XX
					if num4 = 0 then
					
						-- 00:XX
						if num3= 0 then

							
							--00:0X
							if num2=0 then
								
											--00:00==>00:00
								if num1=0 then
									num4:= "0000";
									num3:= "0000";
									num2:= "0000";
									num1:= "0000";
									fin:='1';
								
											--00:0X==>00:0(X-1)
								else
									num1 := num1-1;
									num2 :="0000";
									num3 :="0000";
									num4 :="0000";

								end if;	
							
							--00:XQ
							else
											--00:X0==>00:(X-1)9
								if num1=0 then
									num1:= maximo;
									num2:= num2-1;
									num3 :="0000";
									num4 :="0000";
											--00:XX==>00:X(X-1);
								else
									num1:=num1-1;
									num2 :=num2;
									num3 :="0000";
									num4 :="0000";
								end if;
									
							end if;
						
						--0X:QQ
						else
							--0X:0Q
							if num2=0 then
											--0X:00==>0(X-1):59
								if num1=0 then
									num4:= "0000";
									num3:= num3-1;
									num2:= maximo;
									num1:= maximo;
								
											--0X:0X==>0X:0(X-1)
								else
									num1 := num1-1;
									num2 :="0000";
									num3 := num3;
									num4 :="0000";
								end if;	
							
							--0X:XQ
							else
											--0X:X0==>0X:(X-1)9
								if num1=0 then
									num1:= maximo;
									num2:= num2-1;
									num3 :=num3;
									num4 :="0000";
										--0X:XX==>0X:X(X-1);
								else
									num1:=num1-1;
									num2 :=num2;
									num3 := num3;
									num4 :="0000";
								end if;
									
							end if;
						end if;
					--XQ:QQ	
					else
						-- X0:XX
						if num3= 0 then

							
							--X0:0X
							if num2=0 then
								
											--X0:00==>(X-1)0:00
								if num1=0 then
									num4:= num4-1;
									num3:= "0000";
									num2:= "0000";
									num1:= "0000";

								
											--X0:0X==>X0:0(X-1)
								else
									num1 := num1-1;
									num2 :="0000";
									num3 :="0000";
									num4 :=num4;
								end if;	
							
							--X0:XQ
							else
											--X0:X0==>X0:(X-1)9
								if num1=0 then
									num1:= maximo;
									num2:= num2-1;
									num3 :="0000";
									num4 :=num4;
											--X0:XX==>X0:X(X-1);
								else
									num1:=num1-1;
									num2 :=num2;
									num3 :="0000";
									num4 :=num4;
								end if;
									
							end if;
						
						--XX:QQ
						else
							--XX:0Q
							if num2=0 then
											--XX:00==>X(X-1):59
								if num1=0 then
									num4:= num4;
									num3:= num3-1;
									num2:= maximo;
									num1:= maximo;
								
											--XX:0X==>XX:0(X-1)
								else
									num1 := num1-1;
									num2 :="0000";
									num3 := num3;
									num4 :=num4;
								end if;	
							
							--XX:XQ
							else
											--XX:X0==>XX:(X-1)9
								if num1=0 then
									num1:= maximo;
									num2:= num2-1;
									num3 :=num3;
									num4 :="0000";
										--XX:XX==>XX:X(X-1);
								else
									num1:=num1-1;
									num2 :=num2;
									num3 := num3;
									num4 :=num4;
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


