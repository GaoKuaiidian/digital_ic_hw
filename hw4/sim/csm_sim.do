vlib work

vmap work work

vlog  ../clk_ctrl.sv
vlog  ../clk_gen.v
vlog  ../csm.v
vlog  ../rst_sync.v
vlog  ../tb_csm.v

vsim -voptargs=+acc work.tb_csm

do csm_wave.do

run -all

