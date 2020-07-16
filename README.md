# VHDL
## to check if Syntax is correct:
 ghdl -s file.vhdl
## to compile file:
 ghdl -a fiel.vhdl
## to generate vcd file
 ghdl -r fileNameWithoutExt --vcd=name.vcd
## to run diagramm:
 gtkwave filename.vcd