onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_top/reset_n
add wave -noupdate /tb_top/start
add wave -noupdate /tb_top/clk
add wave -noupdate /tb_top/data_in
add wave -noupdate /tb_top/byt
add wave -noupdate /tb_top/dmod
add wave -noupdate /tb_top/mod_en
add wave -noupdate /tb_top/trans_data_o
add wave -noupdate /tb_top/trans_data_en
add wave -noupdate /tb_top/fifo_data_o
add wave -noupdate /tb_top/full
add wave -noupdate /tb_top/empty
add wave -noupdate /tb_top/input_data
add wave -noupdate /tb_top/i
add wave -noupdate /tb_top/rd_en
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 97
configure wave -valuecolwidth 40
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
WaveRestoreZoom {0 ps} {53977 ps}
