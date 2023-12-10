onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_csm/rst_n
add wave -noupdate /tb_csm/RCC_CR_in
add wave -noupdate /tb_csm/clk_100M
add wave -noupdate /tb_csm/clk_sys
add wave -noupdate /tb_csm/clk_ext_100M_ready
add wave -noupdate /tb_csm/u_csm/rst_sync_n
add wave -noupdate /tb_csm/u_csm/RCC_CR
add wave -noupdate /tb_csm/u_csm/counter_to_compute_clk_ext_100M_is_stable
add wave -noupdate /tb_csm/u_csm/flag_initial_n
add wave -noupdate /tb_csm/u_csm/clk_local_32K
add wave -noupdate /tb_csm/u_csm/clk_local_10M
add wave -noupdate -expand -group ctrl /tb_csm/u_csm/u_clk_ctrl/rst_n
add wave -noupdate -expand -group ctrl /tb_csm/u_csm/u_clk_ctrl/sel_clk
add wave -noupdate -expand -group ctrl /tb_csm/u_csm/u_clk_ctrl/clk_in
add wave -noupdate -expand -group ctrl /tb_csm/u_csm/u_clk_ctrl/clk_out
add wave -noupdate -expand -group ctrl -expand /tb_csm/u_csm/u_clk_ctrl/clk_enable
add wave -noupdate -expand -group ctrl /tb_csm/u_csm/u_clk_ctrl/other_clks_is_disable
add wave -noupdate -expand -group ctrl /tb_csm/u_csm/u_clk_ctrl/sel_clk_in
add wave -noupdate -expand -group ctrl /tb_csm/u_csm/u_clk_ctrl/reg_clk_enable_in
add wave -noupdate /tb_csm/u_csm/u_clk_ctrl/reg_clk_enable_in_delay
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {43707006 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 442
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {320084762 ps}
