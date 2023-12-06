vlib work

vmap work work

vlog  ../Vsrc/data_trans.v
vlog  ../Vsrc/S65NLLHS2PH64x8.v
vlog  ../Vsrc/FIFO64x8.v
vlog  ../Vsrc/data_mod.v

vlog  ../Testbench/tb_top.v

vsim -voptargs=+acc work.tb_top

do top_wave.do

run -all

