vlib work

vmap work work

vlog  ../Vsrc/S65NLLHS2PH64x8.v
vlog  ../Vsrc/FIFO64x8.v
vlog  ../Testbench/tb_FIFO64x8.v

vsim -voptargs=+acc work.tb_FIFO64x8

do fifo_wave.do

run -all

