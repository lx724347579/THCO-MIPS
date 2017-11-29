library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity HazardUnit is
    Port ( 
      memoryRead : in STD_LOGIC;
      regWbAddr : in STD_LOGIC_VECTOR (3 downto 0);
      rxAddr : in STD_LOGIC_VECTOR (15 downto 0);
      ryAddr : in STD_LOGIC_VECTOR (15 downto 0);
      stayPC : out STD_LOGIC;
      stayIF2ID : out STD_LOGIC;
      dataSetZero : out STD_LOGIC
    ); --"00" Disabled; "01" Read; "10" Write; "11" Enabled;
end HazardUnit;

architecture Behavioral of HazardUnit is
  begin
    process(memoryRead, regWbAddr, rxAddr, ryAddr)
    begin
      if (rxAddr = regWbAddr or ryAddr = regWbAddr) then
        stayPC <= 1;
        stayIF2ID <= 1;
        dataSetZero <= 1;
      else
        stayPC <= 0;
        stayIF2ID <= 0;
        dataSetZero <= 0;
      end if;
    end process;
  end Behavioral;