library ieee;
use ieee.std_logic_1164.all;

entity utest is
    end utest;

    architecture test of utest is
        component test
            port (
                in0:    in   std_ulogic;
                in1:    in   std_ulogic;
                in2:    in   std_ulogic;
                out0:   out  std_ulogic 
            );
            end component;

            signal in0, in1, in2, out0: std_ulogic;
    begin
        func: test port map(in0=>in0, in1=>in1, out0=>out0);

        process begin
            in0 <= 'X';
            in1 <= 'X';
            in2 <= 'X';
            wait for 1 ns;

            in0 <= '0';
            in1 <= '0';
            in2 <= '0';
            wait for 1 ns;

            in0 <= '1';
            in1 <= '0';
            in2 <= '0';
            wait for 1 ns;

            in0 <= '0';
            in1 <= '1';
            in2 <= '0';
            wait for 1 ns;

            in0 <= '1';
            in1 <= '1';
            in2 <= '0';
            wait for 1 ns;

            in0 <= '0';
            in1 <= '0';
            in2 <= '1';
            wait for 1 ns;

            in0 <= '1';
            in1 <= '0';
            in2 <= '1';
            wait for 1 ns;

            in0 <= '0';
            in1 <= '1';
            in2 <= '1';
            wait for 1 ns;

            in0 <= '1';
            in1 <= '1';
            in2 <= '1';
            wait for 1 ns;

            assert false report "End Of The Test";

            wait;
            end process;
        end test;