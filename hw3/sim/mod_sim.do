vlib work

vmap work work

vlog  ../Vsrc/data_mod.v
vlog  ../Testbench/tb_data_mod.v

vsim -voptargs=+acc work.tb_data_mod

do mod_wave.do

run -all

