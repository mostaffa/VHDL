--Definition of the required components

Library IEEE;
use IEEE.std_logic_1164.all;

entity AND_2 is
  port
  (
   in0,in1 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end AND_2;

architecture dataflow of AND_2 is 
begin
  out0 <= in0 and in1;
end dataflow;

Library IEEE;
use IEEE.std_logic_1164.all;

entity OR_2 is
  port
  (
   in0,in1 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end OR_2;

architecture dataflow of OR_2 is 
begin
  out0 <= in0 or in1;
end dataflow;

-- Circuit entity

Library IEEE;
use IEEE.std_logic_1164.all;

entity circuit_test is
  port
  (
   sig_in_0,  sig_in_1,  sig_in_2 : in STD_LOGIC;
  sig_out_0 : out STD_LOGIC
  );
end circuit_test;

-- Structural description of the circuit

architecture structure of circuit_test is

component AND_2
  port
  (
   in0,in1 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end component;

component OR_2
  port
  (
   in0,in1 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end component;

constant ConstLow : STD_LOGIC := '0';
constant ConstHigh : STD_LOGIC := '1';
signal AndGate0_out0 , AndGate0_out0_inverted , AndGate1_out0 , AndGate1_out0_inverted , AndGate2_out0 , AndGate2_out0_inverted , OrGate0_out0 , OrGate0_out0_inverted , OrGate1_out0 , OrGate1_out0_inverted , OrGate2_out0 , OrGate2_out0_inverted : STD_LOGIC;
signal sig_in_0_inverted, sig_in_1_inverted, sig_in_2_inverted : STD_LOGIC;

begin
AndGate0 : AND_2
 port map (
  in0 =>  sig_in_0,
  in1 =>  sig_in_1,
  out0 => AndGate0_out0);

AndGate1 : AND_2
 port map (
  in0 =>  sig_in_1,
  in1 =>  sig_in_2,
  out0 => AndGate1_out0);

AndGate2 : AND_2
 port map (
  in0 =>  sig_in_0,
  in1 =>  sig_in_2,
  out0 => AndGate2_out0);

OrGate0 : OR_2
 port map (
  in0 => AndGate0_out0,
  in1 => AndGate1_out0,
  out0 => OrGate0_out0);

OrGate1 : OR_2
 port map (
  in0 => AndGate1_out0,
  in1 => AndGate2_out0,
  out0 => OrGate1_out0);

OrGate2 : OR_2
 port map (
  in0 => OrGate0_out0,
  in1 => OrGate1_out0,
  out0 => OrGate2_out0);

--Signal mapping
sig_out_0 <= OrGate2_out0;
end structure;
