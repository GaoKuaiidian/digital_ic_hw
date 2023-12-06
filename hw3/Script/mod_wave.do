onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_data_mod/PERIOD
add wave -noupdate /tb_data_mod/reset_n
add wave -noupdate /tb_data_mod/clk
add wave -noupdate -radix binary /tb_data_mod/data_in
add wave -noupdate /tb_data_mod/rdy
add wave -noupdate /tb_data_mod/rd
add wave -noupdate -radix decimal /tb_data_mod/dmod
add wave -noupdate /tb_data_mod/mod_en
add wave -noupdate /tb_data_mod/i
add wave -noupdate /tb_data_mod/pattern
add wave -noupdate /tb_data_mod/u_data_mod/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7954 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 225
configure wave -valuecolwidth 182
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
WaveRestoreZoom {0 ps} {95680 ps}
